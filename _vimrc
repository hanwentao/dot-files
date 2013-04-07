" .vimrc: Vim configuration file
" Wentao Han (wentao.han@gmail.com)

if v:progname =~? "evim"
  finish
endif

set nocompatible

" Set up Vundle
filetype off
set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle "gmarik/vundle"

Bundle "taglist.vim"
Bundle "The-NERD-Commenter"
Bundle "cscope_macros.vim"
Bundle "clang-complete"
Bundle "LaTeX-Suite-aka-Vim-LaTeX"
Bundle "VimOrganizer"

" Display related settings
set background=dark
set completeopt=menu
set foldmethod=marker
set laststatus=2
set list
set listchars=tab:>\ ,trail:.
set matchtime=1
set number
set ruler
set scrolloff=3
set showcmd
set showmatch
set wildmenu
set nowrap
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Operation related settings
set backspace=indent,eol,start
set gdefault
set history=50
set ignorecase
set incsearch
set smartcase
if has("mouse")
  set mouse=
endif

" File related settings
set autoread
set backup
set encoding=utf-8
set expandtab
set fileencodings=ucs-bom,utf-8,gb18030,default,latin1
set shiftwidth=2
set softtabstop=2
set tabstop=8
if has("autocmd")
  filetype plugin indent on
  augroup vimrcEx
    autocmd!
    autocmd FileType text setlocal textwidth=78
    autocmd BufReadPost *
      \   if line("'\"") > 1 && line("\"") <= line("$")
      \ |   execute "normal! g`\""
      \ | endif
  augroup END
else
  set autoindent
endif
if has("persistent_undo")
  let undo_dir = expand("~/.undo")
  if !isdirectory(undo_dir) && exists("*mkdir")
    call mkdir(undo_dir)
  endif
  if isdirectory(undo_dir)
    set autowrite
    let &undodir = undo_dir
    set undofile
    set nobackup
  endif
endif

" Miscellaneous settings
map Q gq
if !exists(":DiffOrig")
  command DiffOrig vertical new
               \ | set buftype=nofile
               \ | read ++edit #
               \ | 0 delete _
               \ | diffthis
               \ | wincmd p
               \ | diffthis
endif

" Extension settings
let g:bash=1

nnoremap <Leader>t :TlistToggle<CR>
let Tlist_Exit_OnlyWindow=1
let Tlist_Use_Right_Window=1

let g:clang_complete_macros=1
let g:clang_snippets=1
let g:clang_sort_algo="alpha"

autocmd! BufRead,BufWrite,BufWritePost,BufNewFile *.org
autocmd BufEnter *.org call org#SetOrgFileType()
