"""""""""""""""""""""
"                   "
" NVIM Plugins File "
"                   "
"""""""""""""""""""""

" Vim-Plug Auto Install Script

if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" Plugins List

call plug#begin('~/.config/nvim/autoload/plugged')

Plug 'sheerun/vim-polyglot'                     " Better Syntax
Plug 'gruvbox-community/gruvbox'                " Color Scheme
Plug 'scrooloose/NERDTree'                      " File Explorer
Plug 'jiangmiao/auto-pairs'                     " Auto Pair () {} []
Plug 'neoclide/coc.nvim', {'branch': 'release'} " LSP
Plug 'liuchengxu/vim-which-key'                 " Key Command Menu
Plug 'mhinz/vim-startify'                       " Start Menu
Plug 'kevinoid/vim-jsonc'                       " Coc Comment Highlight 
Plug 'norcalli/nvim-colorizer.lua'              " Show Color Codes
Plug 'vim-airline/vim-airline'                  " Status Line
Plug 'vim-airline/vim-airline-themes'           " Status Line Themes

call plug#end()
