set nocompatible
filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            Start Plug Manager                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""     
" call plug#begin()

" Plug 'w0rp/ale'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'} 
" Plug 'zchee/deoplete-jedi'
" Plug 'davidhalter/jedi-vim'
" Plug 'jalvesaq/vimcmdline'

" call plug#end()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             End plugin manager                             "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let python_highlight_all=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""                                 vimcmdline                                 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let cmdline_app = {}
let cmdline_app['python'] = 'ipython'
let cmdline_map_start          = '<F5>'
let cmdline_map_send           = '<Space>'
let cmdline_map_send_and_stay  = '<F5><Space>'
let cmdline_map_source_fun     = '<F5>f' 
let cmdline_map_send_paragraph = '<F5>p' 
let cmdline_map_send_block     = '<F5>b'
let cmdline_map_send_motion    = '<F5>m'
let cmdline_map_quit           = '<F5>q'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""                                 Ale                                        "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:ale_linters = {'python': ['flake8', 'mypy']}
" let g:ale_fixers = {'*': [], 'python': ['black']}
let g:ale_linters = {'*': ['flake8', 'mypy']}
let g:ale_fixers = {'*': ['black']}
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_enter = 1
let g:ale_lint_on_text_changed = 'never' "'normal' 
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
let g:syntastic_tex_checkers = ['lacheck']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""                                 deoplete                                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:deoplete#enable_at_startup = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""                               jedi-vim                                     "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:jedi#completions_enabled = 0
let g:jedi#use_splits_not_buffers = "right"
let g:jedi#auto_close_doc = 0
let g:jedi#show_call_signatures = 1 
