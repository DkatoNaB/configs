" Plugin handling stuffs 
" https://github.com/VundleVim/Vundle.vim <-- details
" Keep Plugin commands between vundle#begin/end.
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

let g:ycm_confirm_extra_conf = 0
" close that fking preview window
let g:ycm_autoclose_preview_window_after_completionn = 1
set completeopt-=preview
"cygwin_vimrc
set smartindent
set showmatch
set foldenable
"set selectmode=mouse
"set showcmd
" syntax highlighting on
syntax on

"for wrapping text at a given size (e.g. 80): set wrap, set textwidth=80
set wrap
set textwidth=0

set mouse=a

" size(TAB) = 2 space
set tabstop=2
" converts tabs to space
"set expandtab

" kappa cucc
set scrolloff=7

" indentation step
set sw=2

" line numbering on
set number

" no backup files
set nobackup

" shows command while typing
set showcmd

" smoother redraws
set ttyfast

" set igonore case when searching
set ignorecase
" samrt case
set smartcase

" always display the status line
set laststatus=2

"more informative status line
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L] 
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%04l,%04v][%p%%]\ [LEN=%L] 
set statusline=%f%r\ [FORMAT=%{&ff}]\ [TYPE=%Y]
" show current editing status
set showmode

" highlight current line
set cursorline

"highlight search default
set hlsearch

" set line endings to unix
set ff=unix
" enable backspace key to delete anything
set backspace=indent,eol,start

" don't break words
set linebreak

" set autoindent (for tabs)
set autoindent

" set maximum number of tabs
set tabpagemax=100

set nofoldenable " dont fold by default
set foldmethod=manual " zf) : close current block; zo : open current block (same put cursor on line + press RIGHT)
set foldnestmax=10
set foldlevel=1

" The wildmenu appears in the info line above the command line when a TAB is pressed while entring a path in the command line and it shows the possible values
set wildmode=longest:full
set wildmenu

"Run Pathogen -- a vim package manager
"execute pathogen#infect()

" Sets the terminal window's scroolback buffer size
let g:terminal_scrollback_buffer_size = 100000

" color
syntax on
set t_Co=256
set cursorline
let g:rehash256 = 1
colorscheme molokai
"colorscheme onehalfdark
"let g:airline_theme='onehalfdark'

" extra cpp highlight options https://github.com/octol/vim-cpp-enhanced-highlight
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

"------ SYNTAX HIGHLIGHTERS ------ begin

"au BufNewFile,BufRead *.yaml,*.yml,*.txt so ~/.vim/syntax/yaml.vim
"au BufNewFile,BufRead *.cpp,*.h, so ~/.vim/syntax/cpp11.vim

"------ SYNTAX HIGHLIGHTERS ------ end
"
"showing invisible characters"
:set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»
:set list
" transparent background
hi Normal guibg=NONE ctermbg=NONE

"tmp tags file
:set tags=/home/kappa/git/oxygine/tags
