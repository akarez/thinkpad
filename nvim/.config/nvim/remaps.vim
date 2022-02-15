""""""""""""""""""""""""""
"                        "
" NVIM Key Mappings File "
"                        "
""""""""""""""""""""""""""
let g:mapleader = "\<Space>"

nnoremap <leader>f <cmd>NERDTree <CR>                           " Launch NERDTree File Explorer
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>    " Launch WhichKey Command Menu
nnoremap <silent>'Tab' <cmd>bnext <CR>   

nnoremap <C-c> :!g++ -o  %:r.out % -std=c++17
nnoremap <C-x> :!./%:r.out
