call pathogen#infect()                                " Enable bundles in the ~/.vim/bundle directory
filetype plugin indent on                             " filetype-specific plugins and indents

set autoindent                                        " keep the indentation of the previous line
set autoread                                          " reload if it has been edited outside of vim
set background=light                                  " /set the background to light or dark
set backspace=indent,eol,start                        " make backspace key work the way it should
set expandtab                                         " convert all tabs to spaces on save
set history=700                                       " remember a lot of commands
set nohlsearch                                        " do not highlight searched-for phrases
set ignorecase                                        " ignore case in searches
set incsearch                                         " highlight search as you type
set laststatus=2                                      " make the status two lines deep to see it
set list listchars=tab:»·,trail:·                     " set trailing space characters as a dot.
set nocompatible                                      " Don't do the bad things vi does
set number                                            " add line numbers
set ruler                                             " add a ruler to the bottom of the screen
set shiftwidth=4                                      " treat 4 spaces as a tab
set showcmd                                           " show incomplete commands
set showmatch                                         " match pairing parens, brackets, etc.
set showmode                                          " show the current mode
set smartindent                                       " try to predict when to indent
set softtabstop=4                                     " insert 4 spaces when pressing the tab key
set tabstop=4                                         " insert 4 spaces when pressing the tab key
set visualbell t_vb=                                  " turn off the visual bell

syntax enable                                         " turn syntax highlighting on by default

au BufNewFile,BufRead *.ftl set syn=html              " treat FreeMarker as HTML
au BufNewFile,BufRead *.ru set syn=rackup             " add highlighting for rakup files
au FileType ruby setlocal shiftwidth=2 softtabstop=2  " set default tabs for Ruby to 2
"au FileType scala setlocal shiftwidth=2 softtabstop=2 " set default tabs for Scala to 2

" map gl in visual mode to svn blame
vmap gl :<C-U>!svn blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>

" In many terminal emulators the mouse works just fine, thus enable it.
if has("mouse")
  set mouse=a
endif " has("mouse")

" Show EOL type and last modified timestamp, right after the filename
set statusline=%<%F%h%m%r\ [%{&ff}]\ (%{strftime(\"%H:%M\ %d/%m/%Y\",getftime(expand(\"%:p\")))})%=%l,%c%V\ %P

" Change the text color of files over 80 characters
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.\+/

"Remember the positions in files with some git-specific exceptions"
if has("autocmd")
    autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$")
      \           && expand("%") !~ "COMMIT_EDITMSG"
      \           && expand("%") !~ "ADD_EDIT.patch"
      \           && expand("%") !~ "addp-hunk-edit.diff"
      \           && expand("%") !~ "git-rebase-todo" |
      \   exe "normal g`\"" |
      \ endif
endif " has("autocmd")
