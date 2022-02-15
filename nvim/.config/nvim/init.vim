"""""""""""""""""""""""""""
"                         "
" NVIM Configuration File "
"                         "
"""""""""""""""""""""""""""

" Source Plugins

source  $HOME/.config/nvim/plugins.vim

" Source Set Rules

source  $HOME/.config/nvim/settings.vim

"Source Plugin Configuration

source  $HOME/.config/nvim/plug-config/coc.vim
source  $HOME/.config/nvim/plug-config/home-screen.vim
source  $HOME/.config/nvim/plug-config/airline.vim
luafile $HOME/.config/nvim/plug-config/plug-colorizer.lua

" Source Key Mappings

source  $HOME/.config/nvim/remaps.vim
