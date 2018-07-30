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

" this means that the tex specific settings should be loaded from ~/.vim/tex.vim
autocmd FileType tex source ~/.config/nvim/tex.vim

" The two commands below map Ctrl-Up to change to the previous tab and Ctrl-Down to change to the next tab
map <S-Right> :tabnext<CR>
map <S-Left> :tabprevious<CR>
"map <S-Left> /{<CR>zfa}
"map <S-Right> zO
"map <C-x> :w<CR> latexmk -pdf % -c<CR> latexmk -pdf %<CR>
map <C-l> <ESC>:w<CR>:! latexmk -pdf %<CR>
map <C-c> <ESC>:w<CR>:! context %<CR>
map <C-#> <ESC>:let @+=expand("%:p:h")<CR>
map <C-x> <ESC>:w<CR>:! make all<CR>

" tmp removed old c++ highlight, new can be found in after folder
"au BufNewFile,BufRead *.cc set syntax=cpp11
"au BufNewFile,BufRead *.cpp set syntax=cpp11
au BufRead,BufNewFile *.logcat set filetype=logcat
au BufNewFile,BufRead sys*.txt set filetype=dosini

""""""""""""" My cscope/vim key mappings
"
" The following maps all invoke one of the following cscope search types:
"
"   's'   symbol: find all references to the token under cursor
"   'g'   global: find global definition(s) of the token under cursor
"   'c'   calls:  find all calls to the function name under cursor
"   't'   text:   find all instances of the text under cursor
"   'e'   egrep:  egrep search for the word under cursor
"   'f'   file:   open the filename under cursor
"   'i'   includes: find files that include the filename under cursor
"   'd'   called: find functions that function under cursor calls
cs add $CSCOPE_DB
nmap <C-\>s :tab cs find s <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>g :tab cs find g <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>c :tab cs find c <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>t :tab cs find t <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>e :tab cs find e <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>f :tab cs find f <C-R>=expand("%:t")<CR><CR>	
nmap <C-\>i :tab cs find i <C-R>=expand("%:t")<CR><CR>
nmap <C-\>d :tab cs find d <C-R>=expand("<cword>")<CR><CR>	

" Toggles the class outline viewer (tagbar)
" 	The items can be closed/opened with zc/zo -- jumping to symbol: <cr> on the item
"nmap <F8> :TagbarToggle<CR>
nmap <F9> :vsplit<CR>:vertical resize 40<CR>:e %:p:h<CR><C-w>l

" netrw default: tree
let g:netrw_liststyle=3

map <F2> :grep! <C-R>" `find . -name "*.h" -o -name "*.cpp" -o -name "*.lua" -o -name "*.ui" -o -name "*.java"`<CR><CR>:tabe<CR><Esc>:clist<CR>
map <F3> :tabe<CR><Esc>:clist<CR>

command! -nargs=+ Slua execute "grep! <args> `find . -name \"*.lua\" -o -name \"*.ui\"`"
command! -nargs=+ Scpp execute "grep! <args> `find . -name \"*.h\" -o -name \"*.cpp\"`"
command! -nargs=+ Sjava execute "grep! <args> `find . -name \"*.java\"`"
command! -nargs=+ Spy execute "grep! <args> `find . -name \"*.py\"`"
command! -nargs=+ Sr execute "grep! <args> `find . -name \"*.h\" -o -name \"*.cpp\" -o -name \"*.lua\" -o -name \"*.ui\" -o -name \"*.java\" -o -name \"*.py\"`"
command! -nargs=+ Ff r !find * -name "<args>"
command! -nargs=+ Ffp r !find * -name "*<args>*"

command! -nargs=+ Flua r !find * \( -name "*.lua" -o -name "*.ui" \) -print0 | xargs -0r egrep -ne "<args>" /dev/null || :
command! -nargs=+ Fcpp r !find * \( -name "*.h" -o -name "*.cpp" -o -name "*.c" -o -name "*.hpp" \) -print0 | xargs -0r egrep -ne "<args>" /dev/null || :
command! -nargs=+ Fjava r !find * \( -name "*.java" \) -print0 | xargs -0r egrep -ne "<args>" /dev/null || :
command! -nargs=+ Fpy r !find * \( -name "*.py" \) -print0 | xargs -0r egrep -ne "<args>" /dev/null || :
command! -nargs=+ Fxml r !find * \( -name "*.xml" \) -print0 | xargs -0r egrep -ne "<args>" /dev/null || :
command! -nargs=+ Fsh r !find * \( -name "*.sh" \) -print0 | xargs -0r egrep -ne "<args>" /dev/null || :
command! -nargs=+ Fc r !find * \( -name "*.java" -o -name "*.lua" -o -name "*.ui" -o -name "*.h" -o -name "*.cpp" -o -name "*.c" -o -name "*.py" -o -name "*.xml" -o -name "*.sh" \) -print0 | xargs -0r egrep -ne "<args>" /dev/null || :
command! -nargs=+ Fall r !find * \( -type f \) -print0 | xargs -0r egrep -ne "<args>" /dev/null || :

command! -nargs=+ Fcs execute "tab cs find s <args>"

command! -nargs=+ Glua r !egrep -Hni "<args>" --include "*.lua" --include "*.ui" -r *
command! -nargs=+ Gcpp r !egrep -Hni "<args>" --include "*.h" --include "*.cpp" --include "*.c" -r *
command! -nargs=+ Gjava r !egrep -Hni "<args>" --include "*.java" -r *
command! -nargs=+ Gpy r !egrep -Hni "<args>" --include "*.py" -r *
command! -nargs=+ Gxml r !egrep -Hni "<args>" --include "*.xml" -r *
command! -nargs=+ Gsh r !egrep -Hni "<args>" --include "*.sh" -r *
command! -nargs=+ Gall r !egrep -Hni "<args>" -r *

set lcs=tab:>·
map <F4> <esc>:set list!<cr>
"map <F5> <esc>:set hlsearch!<cr>
map <F5> <esc> :noh <cr>
map <F6> y<esc>/<c-r>"<cr>
map <F7> <esc>:w !diff -u % -<cr>

" TODO implement page down as CTRL+D
map <PageUp> <C-U>
map <PageDown> <C-D>
" replace first character in lnie to a tab + # and selects
"map <F8> <esc>:s/^/\t#/<cr>j
" auto indent and comments
noremap <F8> @: <cr>  

" Replace code extend to ctrl + space 
inoremap <Nul> <C-n>

tnoremap <ESC> <C-\><C-n>

"function ResolveDoubleUTF8() 
"    let s:thisline = getline(".")
"    let s:result = ''
"    let s:i = 0
"	let s:length = strlen(s:thisline) 
"    while s:i < s:length
"        let s:code = char2nr(strpart(s:thisline, s:i, 1))
"        let s:i = s:i + 1
"        if s:code >= 252 " 6 bytes 
"            let s:code = s:code - 252 
"            let s:nbytes = 5 
"        elseif s:code >= 248 " 5 bytes
"            let s:code = s:code - 248 
"            let s:nbytes = 4 
"        elseif s:code >= 240 " 4 bytes
"            let s:code = s:code - 240 
"            let s:nbytes = 3 
"        elseif s:code >= 224 " 3 bytes
"            let s:code = s:code - 224 
"            let s:nbytes = 2 
"        elseif s:code >= 192 " 2 bytes
"            let s:code = s:code - 192 
"            let s:nbytes = 1
"        else
"            let s:nbytes = 0
"        endif
"        while s:nbytes > 0
"            let s:code = (s:code * 64) + char2nr(strpart(s:thisline, s:i, 1)) - 128
"            let s:i = s:i + 1
"            let s:nbytes = s:nbytes - 1
"        endwhile
"
"        let s:oldenc = &enc
"        let &enc = 'latin1'
"        let s:result = s:result . nr2char(s:code)  
"        let &enc = s:oldenc
"    endwhile
"    call setline(".", s:result)
"endfunction
"
"map <F9> <esc>:call ResolveDoubleUTF8()<cr>

"------ SYNTAX HIGHLIGHTERS ------ begin

"au BufNewFile,BufRead *.yaml,*.yml,*.txt so ~/.vim/syntax/yaml.vim
"au BufNewFile,BufRead *.cpp,*.h, so ~/.vim/syntax/cpp11.vim

"------ SYNTAX HIGHLIGHTERS ------ end
"
"showing invisible characters"
:set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»
:set list
