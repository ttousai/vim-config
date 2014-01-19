" Startup defaults

" SuperTab completion default
let g:SuperTabDefaultCompletionType = "context"

" Default colorscheme solarized
set background=dark
set t_Co=16
let g:solarized_termcolors=16
colorscheme solarized

" Allow use of the mouse in all mode
set mouse=a

" Set tab width to 4, override the default 8
set tabstop=4

" Map CTRL-right to next buffer and CTRL-left to previous buffer
map <c-right> <esc>:bn<cr>
map <c-left> <esc>:bp<cr>

" Pimp my status bar and make it visible
" :set statusline=%F%m%r%h%w\ [FMT=%{&ff}]\ [TYPE=%Y]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
":set laststatus=2

" Include templates
:autocmd BufNewFile * silent! 0r $HOME/.vim/templates/%:e.tpl
" Placeholders and working with them
nnoremap <c-j> /<+.\{-1,}+><cr>c/+>/e<cr>
inoremap <c-j> <esc>/<+.\{-1,}+><cr>c/+>/e<cr>
:match Todo /<+.\++>/
