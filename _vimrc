" .vimrc: Vim configuration file
" Wentao Han (wentao.han@gmail.com)

if v:progname =~? "evim"
  finish
endif

set nocompatible

" Set up Vundle
filetype off
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'Tagbar'
Plugin 'The-NERD-Commenter'
Plugin 'The-NERD-tree'
Plugin 'Valloric/YouCompleteMe'
Plugin 'kien/ctrlp.vim'
Plugin 'ervandew/supertab'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'

call vundle#end()
filetype plugin indent on

" Display related settings
set background=dark
set completeopt=menu
set foldmethod=marker
set laststatus=2
set list
set listchars=tab:>\ ,trail:.
set matchtime=1
set number
set relativenumber
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
set history=50
set incsearch
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
  let undo_dir = expand("~/.vim-undo")
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
let g:ctrlp_extensions = ['buffertag']
let g:ctrlp_map = ''
let g:is_bash = 1
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf = $HOME . "/.vim/ycm_global_conf.py"

nnoremap <silent> <Leader>t :TagbarToggle<CR>
nnoremap <silent> <Leader>d :NERDTreeToggle<CR>
nnoremap <silent> <Leader>s :CtrlPBufTag<CR>
nnoremap <silent> <Leader>g :CtrlPTag<CR>
nnoremap <silent> <Leader>f :CtrlPMRU<CR>
