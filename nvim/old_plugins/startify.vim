Plug 'mhinz/vim-startify'


let g:startify_session_dir = '~/.config/nvim/session'

    let g:startify_lists = [
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
          \ { 'type': 'files',     'header': ['   MRU']            },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ { 'type': 'commands',  'header': ['   Commands']       },
          \ ]
let g:startify_session_delete_buffers = 1

let g:startify_change_to_vcs_root = 0

let g:startify_session_persistence = 0

