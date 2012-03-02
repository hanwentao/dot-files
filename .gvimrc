" .gvimrc: Vim configuration file
" Wentao Han (wentao.han@gmail.com)

if has("gui_macvim")
  set guifont=Monaco:h18
elseif has("gui_win32")
  set guifont=Consolas:h14
endif

colorscheme desert

set clipboard=unnamed
set mouse=a
