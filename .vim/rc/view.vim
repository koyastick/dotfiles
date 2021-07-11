" view

hi CursorLineNr term=bold   cterm=NONE ctermfg=228 ctermbg=NONE
hi Comment ctermfg=4
syntax on
set number
set cursorline
" set cursorcolumn
set noerrorbells
set showmatch matchtime=1
set cinoptions+=:0
set cmdheight=2
set laststatus=2
set showcmd
set display=lastline
set list
set listchars=tab:^\ ,trail:~
set history=10000
" set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set guioptions-=T
set guioptions+=a
set guioptions-=m
set guioptions+=R
set showmatch
set smartindent
set noswapfile
set nofoldenable
set title
set clipboard=unnamed,autoselect
nnoremap <Esc><Esc> :nohlsearch<CR><ESC>
set nrformats=
set whichwrap=b,s,h,l,<,>,[,],~
set mouse=a
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
if has('vim_starting')
	let &t_SI .= "\e[6 q"
	let &t_EI .= "\e[2 q"
	let &t_SR .= "\e[4 q"
endif

" syntax enable
" set background=dark    "または light
" colorscheme solarized