#!/bin/bash
# 
# Vim configuration with Go in mind.
# This setup uses mostly symlinks, so as to
# make vim plugin repos easy to update.
VIMHOME="$HOME/.vim"
# All source code will be cloned here
REPOS=$1
EARGS=50
EPATH=51
ETOOLS=52

function usage()
{
		echo "
Usage: install.sh /PATH/TO/REPO
		REPO 	Absolute path where all dowloaded code will be saved."
		exit $1
}

# check for repo directory argument
if [ -z $REPOS ]; then
		usage $ARGS
fi

# check if $REPO is absolute
if [ ! ${REPOS%%/*} == "/" ]; then
		echo -e "$REPOS is not an absolute path\n"
		usage $EPATH
fi

# check for Go
go version &> /dev/null
if [ ! $? -eq 0 ]; then
		echo -e "Go language support is required\n"
		usage $ETOOLS
fi

# check for GOROOT
if [ -z $GOROOT ]; then
		echo -e "Please set the GOROOT environment variable"
		usage $ETOOLS
fi

# backup old vim-configs before running scripts
[ -f ${HOME}/.vimrc ] && mv ${HOME}/.vimrc{,.old}
cp -v vimrc ${HOME}/.vimrc
[ -d ${HOME}/.vim ] && mv ${HOME}/.vim{,.old}

# install pathogen.vim to manage runtimepath
# vimrc contains configuration to activate.
PLUGIN='github.com/tpope/vim-pathogen'
AUTHOR=${PLUGIN%/*}
TOOL=${PLUGIN##*/} 
git clone git://$PLUGIN.git || exit $?
mkdir -pv $REPOS/$AUTHOR  && mv $TOOL $REPOS/$AUTHOR
mkdir -pv $VIMHOME/autoload $VIMHOME/bundle
ln -sv $REPOS/$PLUGIN/autoload/pathogen.vim \
		$VIMHOME/autoload/pathogen.vim
rm -rf $TOOL

# With pathogen.vim setup we can now install all plugins into the bundle
# directory.

# install Go's standard vim plugins, ttousai/vim-config/plugin/go.vim
# we assume vim-config is already in $REPOS
# also this script is in vim-config so we
# can assume you already got it.
PLUGIN='github.com/ttousai/vim-config'
ln -sv $REPOS/$PLUGIN $VIMHOME/bundle/${PLUGIN##*/}

# install gotags
PLUGIN='github.com/jstemmer/gotags'
go get -u $PLUGIN || exit $?

# install nsf/gocode assumes go is install and GOPATH properly configured
# configuration for "tagbar" support installed later is in vim-config/plugin/go.vim
PLUGIN='github.com/nsf/gocode'
go get -u $PLUGIN || exit $?
ln -sv $GOPATH/src/$PLUGIN/vim/ $VIMHOME/bundle/${PLUGIN##*/}


# the following share same installation code
plugins=(\
		'scrooloose/nerdtree' 'ervandew/supertab'\
		'majutsushi/tagbar'  'Townk/vim-autoclose'\
		'tpope/vim-sensible' 'altercation/vim-colors-solarized'\
		'scrooloose/syntastic'\
)

for p in ${plugins[@]}; do
		# install plugin using pathogen.vim
		PLUGIN="github.com/$p"
		AUTHOR=${PLUGIN%/*}
		TOOL=${PLUGIN##*/} 
		git clone git://$PLUGIN.git || exit $?
		mkdir -pv $REPOS/$AUTHOR && mv $TOOL $REPOS/$AUTHOR
		ln -sv $REPOS/$PLUGIN $VIMHOME/bundle/$TOOL
		rm -rf $TOOL
done

# install vimrc, and templates.
# support for templating is in vim-config/plugin/default.vim
cp -av templates ${HOME}/.vim
