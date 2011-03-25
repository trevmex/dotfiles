filetype plugin indent on      " filetype-specific plugins and indents

set autoindent                 " keep the indentation of the previous line
set autoread                   " reload if it has been edited outside of vim
set background=dark            " I prefer dark backgrounds
set backspace=indent,eol,start " make backspace key work the way it should
set expandtab                  " convert all tabs to spaces on save
set history=700                " remember a lot of commands
set incsearch                  " jump to the first result while searching
set laststatus=2               " make the status two lines deep to see it
set nocompatible               " Don't do the bad things vi does
set nohls                      " turn off annoying match highlighting
set number                     " add line numbers
set ruler                      " add a ruler to the bottom of the screen
set shiftwidth=2               " treat 2 spaces as a tab
set showmatch                  " match pairing parens, brackets, etc.
set showmode                   " show the current mode
set smartindent                " try to predict when to indent
set tabstop=2                  " insert 2 spaces when pressing the tab key
set visualbell t_vb=           " turn off the visual bell

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

au BufNewFile,BufRead *.ftl set syn=html " treat FreeMarker as HTML
au FileType javascript setlocal shiftwidth=4 softtabstop=4 " set default tabs for JavaScript to 4

syntax on                      " turn syntax highlighting on by default

" Show EOL type and last modified timestamp, right after the filename
set statusline=%<%F%h%m%r\ [%{&ff}]\ (%{strftime(\"%H:%M\ %d/%m/%Y\",getftime(expand(\"%:p\")))})%=%l,%c%V\ %P

"---------------------------------------------------------------------------
" Only do this part when compiled with support for autocommands.
if has("autocmd")
    "Remember the positions in files with some git-specific exceptions"
    autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$")
      \           && expand("%") !~ "COMMIT_EDITMSG"
      \           && expand("%") !~ "ADD_EDIT.patch"
      \           && expand("%") !~ "addp-hunk-edit.diff"
      \           && expand("%") !~ "git-rebase-todo" |
      \   exe "normal g`\"" |
      \ endif
endif " has("autocmd") 
