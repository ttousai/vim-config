vim-config
==========

An attempt to automate the installation of all the vim plugins and scripts I find useful
for my Go development, based on [Martin Angers @PuerkitoBio's blog](http://0value.com/my-Go-centric-Vim-setup).
These include;

1. [Tpope's amazing pathogen](https://github.com/tpope/vim-pathogen)
2. The Go Vim tools which come with the installation
3. [Nsf's gocode](https://github.com/nsf/gocode) Go completion tool
4. [Townk's vim-autoclose](https://github.com/Townk/vim-autoclose) for closing pair symbols (){},etc
5. [scrooloose's NerdTree](https://github.com/scrooloose/nerdtree) tree explorer
6. [scrooloose's syntastic](https://github.com/scrooloose/syntastic) syntax checking plugin
7. [Majutsushi's Tagbar](https://github.com/majutsushi/tagbar) tag browser
8. [Ervandew's SuperTab](https://github.com/ervandew/supertab) for tab completion
9. [Tpope's vim-sensible](https://github.com/tpope/vim-sensible) acceptable defaults for vim
10. [Altercation's vim-colors-solarized](https://github.com/altercation/vim-colors-solarized) colorscheme.

**NOTE:** The install script backsup your vimrc and .vim directories to ~/.vim.old and ~/.vimrc.old.

## Prerequisites

1. [Go](https://golang.org)
2. [Gotags](https://github.com/jstemmer/gotags)


## Installation

0. `mkdir PATH/TO/REPOS/github.com/ttousai && cd PATH/TO/REPOS/github.com/ttousai`
1. `git clone git://github.com/ttousai/vim-config`
2. `cd vim-config`
3. `./install.sh /PATH/TO/REPOS`

The /PATH/TO/REPOS argument specifies where the various plugin sources wiil be cloned to and must be an absolute PATH.

**NOTE**: Step is critical, the install script requires the github.com/ttousai part,
of course this can be changed in the script :).

## Uninstall

Before uninstalling please make sure to backup any new things you've added to the .vim/autoload and .vim/bundle directory. These instructions assume you kept your backups from the installation (.vimrc.old and .vim).

To uninstall just do the following, 
1. `rm -v ~/.vim/autoload/pathogen.vim`
2. `rm -rfv ~/.vim/bundle`
3. `rm -v ~/.vimrc && mv ~/.vimrc.old ~/.vimrc`

optionally
4. `rm -rfv ~/.vim && mv ~/.vim.old ~/.vim`
5. Remove all cloned plugin code in /PATH/TO/REPOS


## Personalization

I have separated all my personal configuration into the file plugin/default.vim and
plugin/keybindings.vim.

Also the file plugin/go.vim, contains configurations specific to go

## Solarized

I have included a shell script solarized-gnome-term.sh, from this [post](http://www.xorcode.com/2011/04/11/solarized-vim-eclipse-ubuntu/). I found it helpful when my solarize
color scheme was not running out of the box.
