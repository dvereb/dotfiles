set nocompatible        " be iMproved, required
filetype off            " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'joshdick/onedark.vim'

" PLUGINS HERE
Plugin 'ntpeters/vim-better-whitespace'

call vundle#end()           " required
filetype plugin indent on   " required


" ONEDARK THEME
syntax on
colorscheme onedark

set tabstop=4
set listchars=
set listchars+=space:·
set listchars+=tab:▓░
set list

