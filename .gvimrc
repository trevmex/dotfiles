" Add Railscasts colors
colorscheme railscasts

" add line numbers
set number

" do not emulate vi's bad habits
set nocompatible

" try to guess the indentation of the line
set autoindent
set smartindent

" add syntax highlighting
syntax on

" add tabstops and make them spaces
set expandtab
set tabstop=2
set shiftwidth=2

" make the cursor jump to the opening paren when closing
set showmatch

" add a ruler to the bottom of the screen
set ruler

" search as you type
set incsearch

" Enable filetype plugin
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" Sets how many lines of history VIM has to remember
set history=700

" Common command line typos
cmap W w
cmap Q q

" When jj is typed fast, it acts as escape
imap jj <Esc>

" Set the number of lines
set lines=63

" Set the number of columns
set columns=203
