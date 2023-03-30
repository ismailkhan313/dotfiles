" Title: .vimrc configurations 
" Description: A minimal .vimrc configuration
" Author: viz1er 

"---------------------------------------------

" REMAPS
" remap leader key to '
let mapleader = "'"

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" highlight syntax
if has('syntax')
  syntax on
endif

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
if has('filetype')
  filetype indent plugin on
endif

" RECOMMENDED
" show line numbers
set number

" disable the swapfile
set noswapfile

" highlight all results
set hlsearch

" ignore case in search
set ignorecase
set smartcase

" show search results as you type
set incsearch

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Enable use of the mouse for all modes
if has('mouse')
  set mouse=a
endif

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200
