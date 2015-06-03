"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File: .vimrc                                              "
" 							                                "
" Sections:                                                 "
"   01. General ................. General Vim behavior      "
"   02. Events .................. General autocmd events    "
"   03. Theme/Colors ............ Colors, fonts, etc.       "
"   04. Vim UI .................. User interface behavior   "
"   05. Text Formatting/Layout .. Text, tab, indenation     "
"   06. Keys .................... Key binds, rebinds
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 01. General                                               "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible           " Kill Vi compatibility
set history=700            " How many lines of history Vim must remember
set autoread               " Auto read when a file is changed from the outside



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 02. Events                                                "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Leader mapping - must happen before plugins are loaded
let mapleader = ","
let g:mapleader = ","

"Initialize Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

Plugin 'gmarik/Vundle.vim'
Plugin 'ctrlp.vim'
Plugin 'surround.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'itchyny/lightline.vim'
Plugin 'mattn/emmet-vim'

filetype plugin indent on  "filetype detection[ON] plugin [ON] indent[ON]


" Enable NERDTree on startup
"autocmd vimenter * NERDTree
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Do not automatically add comment leaders
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Enable omnicompletion
set ofu=syntaxcomplete#Complete

" Set location of YCM python file
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"

" Only enable emmet in web files
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 03. Theme/Colors                                          "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256               " enable 256-color mode
syntax enable              " enable syntax highlighting

colorscheme desert
set background=dark        " set dark background

set encoding=utf8          " set uft8 as standard encoding


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 04. Vim UI                                                "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number                 " show line numbers
set relativenumber         " user relative line numbers
set cul                    " highlight current line
set laststatus=2           " last window always has a statusline
set hlsearch               " highlight searched phrases
set incsearch              " highlight while searching
set ignorecase             " make searches case-insensitive
set smartcase              " when searching try to be smart about cases
set ruler                  " always show info along bottom
set showmatch              " highlight completed block
set mat=2                  " how long to blink when matching brackets
set wildmenu               " turn on wild menu
set wildignore=*.o,*~,*pyc " wild ignores compiled files
set cmdheight=2            " height of command bar
set hid                    " buffer becomes hidden when abandoned
set lazyredraw             " do not redraw while executing macros
set magic                  " regular expressions

" Return to last edit possition when opening files
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal! g'\"" |
            \ endif
"Remember info about open buffers on close
set viminfo^=%


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 05. Text Formatting/Layout                                "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent             " auto-indent
set tabstop=4              " tab spacing
set softtabstop=4          " unify
set shiftwidth=4           " indent/outdent by 4 columns
set shiftround             " always indent/oudent to the nearest tabstop
set expandtab              " use spaces instead of tabs
set smarttab               " use tabs at the start of a line, spaces elsewhere
set nowrap                 " do not wrap text
set ai                     " auto indent
set si                     " smart indent

" Delete trailing white space on save
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc
autocmd BufWrite * :call DeleteTrailingWS()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 06. Keys                                                  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fast saving
nmap <leader>w :w! <cr>
nmap <leader>a :wa <cr>

" Disable highlight when <leader><cr> is pressed
nmap <silent> <leader><cr> :noh<cr>

" Treat long lines as break lines
map j gj
map k gk

" Smart way to move between splits
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Map jj to Esc
inoremap jj <Esc>

" Map ; to :
nnoremap ; :
