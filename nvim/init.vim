set nocompatible
filetype off

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            Start Plug Manager                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""     
call plug#begin()
" filetype plugin indent on

Plug 'preservim/nerdtree' |            
            \ Plug 'ryanoasis/vim-devicons'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'icymind/NeoSolarized'
Plug 'jalvesaq/vimcmdline', {'for': ['python', 'racket']}
Plug 'jiangmiao/auto-pairs'
Plug 'w0rp/ale', {'for': 'python'}
Plug 'vim-syntastic/syntastic', {'for': 'r'}
Plug 'jimhester/lintr', {'for': 'r'}
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'} 
Plug 'zchee/deoplete-jedi', {'for': 'python'}
Plug 'ervandew/supertab'
Plug 'tpope/vim-commentary' 
Plug 'machakann/vim-highlightedyank'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'frazrepo/vim-rainbow'
Plug 'airblade/vim-gitgutter'
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            not always needed                               "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" Plug 'davidhalter/jedi-vim', {'for': 'python'}
Plug 'tpope/vim-surround'
Plug 'wlangstroth/vim-racket', {'for': 'racket'}
Plug 'junegunn/vim-easy-align', {'for': 'r'}
Plug 'ncm2/ncm2', {'for': 'r'}
Plug 'roxma/nvim-yarp', {'for': 'r'}
Plug 'gaalcaras/ncm-R', {'for': 'r'}
Plug 'jalvesaq/Nvim-R', {'for': 'r','branch': 'stable'}
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'


call plug#end()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             End plugin manager                             "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" filetype plugin indent on
set history=100
set laststatus=2
set noswapfile
set nobackup

set nu
set relativenumber
let python_highlight_all=1
set clipboard=unnamed
set splitbelow
set encoding=UTF-8
set incsearch 
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=79
set expandtab
set autoindent
set noerrorbells
set showmatch
syntax on
set splitright splitright
set mouse=a
set updatetime=100

" turn off arrow keys
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>
inoremap <Left>  <NOP>
inoremap <Right> <NOP>
noremap  <Up>    <NOP>
noremap  <Down>  <NOP>
noremap  <Left>  <NOP>
noremap  <Right> <NOP>

" vim splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
tnoremap <Esc> <C-\><C-n>

" leader keys
let mapleader = ";"
let maplocalleader = ","

" Split window
noremap <leader>h :<C-u>split<CR>
noremap <leader>v :<C-u>vsplit<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               Colour Scheme                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme NeoSolarized
set colorcolumn=80
set termguicolors
if $PROFILENAME == "dark"
    set background=dark
elseif $PROFILENAME == "light"
    set background=light
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""                                 airline                                    "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_powerline_fonts = 1
let g:airline#extensions#ale#enabled = 1
let airline#extensions#ale#error_symbol = '✘'
let airline#extensions#ale#warning_symbol = '⚠'
let airline#extensions#ale#show_line_numbers = 1
let g:airline_theme='base16_solarized'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""                                  Supertab                                  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:SuperTabDefaultCompletionType = "context"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""                                 vimcmdline                                 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let cmdline_app = {}
let cmdline_app['python'] = 'ipython'
let cmdline_app['racket'] = 'racket'
let cmdline_map_start          = '<F5>'
let cmdline_map_send           = '<Space>'
let cmdline_map_send_and_stay  = '<F5><Space>'
let cmdline_map_source_fun     = '<F5>f' 
let cmdline_map_send_paragraph = '<F5>p' 
let cmdline_map_send_block     = '<F5>b'
let cmdline_map_send_motion    = '<F5>m'
let cmdline_map_quit           = '<F5>q'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""                                  NERDTree                                  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nnoremap <F6> :NERDTreeToggle<Enter>
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

let g:NERDTreeGitStatusUseNerdFonts = 1

augroup nerdtree
  autocmd!
  autocmd FileType nerdtree syntax clear NERDTreeFlags
  autocmd FileType nerdtree syntax match hideBracketsInNerdTree "\]" contained conceal containedin=ALL
  autocmd FileType nerdtree syntax match hideBracketsInNerdTree "\[" contained conceal containedin=ALL
  autocmd FileType nerdtree setlocal conceallevel=3
  autocmd FileType nerdtree setlocal concealcursor=nvic
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""                                 Ale                                        "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_linters = {'python': ['flake8', 'mypy']}
let g:ale_fixers = {'*': [], 'python': ['black']}
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
""                              ranibow                                       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:rainbow_active = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""                                 deoplete                                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:deoplete#enable_at_startup = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""                                 Nvim-R                                     "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <F5> <Plug>RStart
vmap <Space> <Plug>RDSendSelection
nmap <Space> <Plug>RDSendLine
let R_assign_map = "--"
let R_min_editor_width = 80
let R_rconsole_width = 1000
" let R_show_args = 1
let R_objbr_opendf = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""                               jedi-vim                                     "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:jedi#completions_enabled = 0
let g:jedi#use_splits_not_buffers = "right"
let g:jedi#auto_close_doc = 0
let g:jedi#show_call_signatures = 1 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""                              vim-easy-align                                "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""                              vim-highlightedyank                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" hi HighlightedyankRegion cterm=reverse gui=reverse
" let g:highlightedyank_highlight_duration = 1000

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 git-gutter                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gitgutter_map_keys = 0
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_enabled = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  syntastic                                  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_enable_r_lintr_checker = 1
let g:syntastic_aggregate_errors = 1
let g:syntastic_enable_signs = 1
let g:syntastic_r_checkers = ['lintr']
let g:syntastic_error_symbol = '✘'
let syntastic_style_error_symbol = '✘'
let g:syntastic_warning_symbol = '⚠'
let syntastic_style_warning_symbol = '⚠'
