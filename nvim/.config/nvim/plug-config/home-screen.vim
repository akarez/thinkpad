"""""""""""""""""""""""""""""""
"                             "
" Startify Configuration File "
"                             "
"""""""""""""""""""""""""""""""

" Welcome Header

let g:startify_custom_header = [
        \'   _   _ ______ ______      _______ __  __ ',
        \'  | \ | |  ____/ __ \ \    / /_   _|  \/  |',
        \'  |  \| | |__ | |  | \ \  / /  | | | \  / |',
        \'  | . ` |  __|| |  | |\ \/ /   | | | |\/| |',
        \'  | |\  | |___| |__| | \  /   _| |_| |  | |',
        \'  |_| \_|______\____/   \/   |_____|_|  |_|',
        \'                                           ',
        \'   WELCOME BACK, COMRADE!                  ',
        \ ]

" General Settings

let g:startify_session_autoload = 1
let g:startify_change_to_vcs_root = 1
let g:startify_session_persistence = 1
let g:startify_session_persistence = 1

let g:startify_files_number = 5
let g:startify_session_dir = '~/.vim/session'

" Shown Lists

let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Recent Files']            },
          \ { 'type': 'dir',       'header': ['   Current Directory']       },
          \ { 'type': 'sessions',  'header': ['   Recent Projects']         },
          \ { 'type': 'bookmarks', 'header': ['   System Configuration']    },
          \ ]

" Bookmarks

let g:startify_bookmarks = [
            \ { '10': '~/.Xresources'},
            \ { '11': '~/.xinitrc'},
            \ { '12': '~/.bashrc'},
            \ { '13': '~/.config/bspwm/bspwmrc'},
            \ { '14': '~/.config/sxhkd/sxhkdrc'},
            \ { '15': '~/.config/nvim/init.vim'},
            \ { '16': '~/.config/alacritty/alacritty.yml'},
            \ { '17': '~/.config/polybar/config'},
            \ { '18': '~/.config/rofi/config.rasi'},
            \ { '19': '~/.config/zathura/zathurarc'},
            \ ]
