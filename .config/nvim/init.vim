"""""""""""""""""""""""
" plugins
" 1. Install vim-plug according to "https://github.com/junegunn/vim-plug"
" 2. execute ":PlugInstall" to install plugins with vim-plug
"""""""""""""""""""""""
call plug#begin()
    Plug 'ntk148v/vim-horizon'
    Plug 'preservim/nerdtree'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'https://github.com/tpope/vim-commentary'
    Plug 'https://github.com/tpope/vim-fugitive'
    Plug 'https://github.com/airblade/vim-gitgutter'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
    Plug 'cocopon/iceberg.vim' , { 'branch': 'master' }
    Plug 'ericbn/vim-solarized'
    Plug 'arcticicestudio/nord-vim'
    Plug 'prabirshrestha/vim-lsp'
    Plug 'mattn/vim-lsp-settings'
    Plug 'prabirshrestha/asyncomplete.vim'
    Plug 'prabirshrestha/asyncomplete-lsp.vim'
    Plug 'jiangmiao/auto-pairs'
    " Plug 'sheerun/vim-polyglot'
call plug#end()

"""""""""""""""""""""""
" NERDTree
"""""""""""""""""""""""
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

"""""""""""""""""""""""
" fzf.vim
"""""""""""""""""""""""
let $FZF_DEFAULT_COMMAND="fd --type f --hidden --exclude '.git'"
let $FZF_DEFAULT_OPTS="--layout=reverse"
let g:fzf_layout = {'down':'~50%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'border': 'sharp' } }
" let g:fzf_layout = {'down':'~40%'}
let mapleader = "\<Space>"
nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>g :GFiles<CR>
nnoremap <silent> <leader>G :GFiles?<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>h :History<CR>
nnoremap <silent> <leader>r :Rg<CR>
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --hidden --column --line-number --no-heading --color=always --smart-case --glob "!.git/**" -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

"""""""""""""""""""""""
" vim-gitgutter
"""""""""""""""""""""""
nmap <C-b> :Git blame<CR>
set updatetime=100

"""""""""""""""""""""""
" vim-airline
"""""""""""""""""""""""
" let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
nmap <C-p> <Plug>AirlineSelectPrevTab
nmap <C-n> <Plug>AirlineSelectNextTab
let g:airline_section_z = "help"
" let g:airline_theme = "fixme"
let g:airline_section_z = get(g:, 'airline_linecolumn_prefix', '').'[%2p%%]%4l/%-4Lln:%-2v'

"""""""""""""""""""""""
" color scheme
"""""""""""""""""""""""
set background=dark
colorscheme nord

"""""""""""""""""""""""
" vim-lsp
"""""""""""""""""""""""
nmap <C-s> :LspInstallServer<CR>

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <Plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <Plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
endfunction

augroup lsp_install
    au!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

"""""""""""""""""""""""
" basic configurations
"""""""""""""""""""""""
if has('vim_starting')
endif
set ignorecase
set smartcase
set wrapscan
set incsearch
set hlsearch
set nowritebackup
set nobackup
set virtualedit=block
set backspace=indent,eol,start
" set ambiwidth=double
set wildmenu
hi CursorLineNr term=bold   cterm=NONE ctermfg=228 ctermbg=NONE
set cursorline
" set cursorcolumn
" set guicursor+=c:ver10
set shell=/bin/zsh
set ttimeoutlen=50
set termguicolors " for true color
hi Comment ctermfg=4
syntax on
scriptencoding utf-8
set encoding=utf-8
set number
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
set expandtab
set shiftwidth=4
set textwidth=0
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
set clipboard=unnamed
nnoremap <Esc><Esc> :nohlsearch<CR><ESC>
set nrformats=
set whichwrap=b,s,h,l,<,>,[,],~
set mouse=a
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set autoindent
set nocompatible
"
"""""""""""""""""""""""
" key bindins
"""""""""""""""""""""""
" Split window
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w
" Move window
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l
" Switch tab
nmap <S-Tab> :tabprev<Return>
nmap <Tab> :tabnext<Return>
