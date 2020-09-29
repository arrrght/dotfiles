" https://github.com/junegunn/vim-plug
call plug#begin()
Plug 'Raimondi/delimitMate'
Plug 'vim-airline/vim-airline'
Plug 'tomtom/tcomment_vim'
Plug 'andrewstuart/vim-kubernetes'
Plug 'chr4/nginx.vim'
Plug 'morhetz/gruvbox'
Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'
Plug 'myusuf3/numbers.vim'
Plug 'elixir-editors/vim-elixir'
Plug 'hashivim/vim-terraform'
" Plug 'dense-analysis/ale'
Plug 'mustache/vim-mustache-handlebars'
Plug 'towolf/vim-helm'
Plug 'gregsexton/gitv', {'on': ['Gitv']}
Plug 'easymotion/vim-easymotion'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
call plug#end()
" after changes run :PlugInstall

set backspace=indent,eol,start
set encoding=UTF-8

" <Leader> & <LocalLeader> mapping {{{

let mapleader='\'
let maplocalleader= ' '

" }}}


" Open NERDTree automatically when no files
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" show hidden files on NERDTree by default
let NERDTreeShowHidden=1

nnoremap H <NOP>
nnoremap L <NOP>
nnoremap M <NOP>
set clipboard^=autoselect

" Save as root
cmap w!! w !sudo tee % >/dev/null<CR>:e!<CR><CR>

syntax on
filetype plugin indent on
set background=dark
 
set modeline
set expandtab                  " spaces instead of tabs
set tabstop=2                  " a tab = four spaces
set shiftwidth=2               " number of spaces for auto-indent
set softtabstop=2              " a soft-tab of four spaces
set autoindent                 " set on the auto-indent
set smarttab

colorscheme gruvbox

" Ansible jinja
au BufRead,BufNewFile *.j2 set filetype=jinja

au FileType xml setlocal equalprg=xmllint\ --format\ --encode\ UTF-8\ --noent\ --recover\ -\ 2>/dev/null
let g:syntastic_yaml_checkers = ['yamllint']
let g:syntastic_terraform_checkers = ['tflint']

set listchars=eol:⏎,tab:␉·,trail:␠,nbsp:⎵

let g:rust_cargo_check_tests = 1

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=%{FugitiveStatusline()}

set foldenable
set foldmethod=marker

" Plugins {{{
" Airline {{{
" set noshowmode

" let g:airline_theme="dark"
let g:airline_powerline_fonts=0
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#whitespace#enabled=1

let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" let g:airline#extensions#tabline#enabled = 2
" let g:airline#extensions#tabline#fnamemod = ':t'
" let g:airline#extensions#tabline#buffer_min_count = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_right_sep = '«'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" }}}
" delimitmate {{{

let delimitMate_expand_space = 1

" }}}
" Gitv {{{

nnoremap <silent> <leader>gv :Gitv --all<CR>
nnoremap <silent> <leader>gV :Gitv! --all<CR>
vnoremap <silent> <leader>gV :Gitv! --all<CR>

let g:Gitv_OpenHorizontal = 'auto'
let g:Gitv_WipeAllOnClose = 1
let g:Gitv_DoNotMapCtrlKey = 1
" let g:Gitv_WrapLines = 1

autocmd FileType git set nofoldenable

" }}}
" Syntastic {{{

nmap <silent><Leader>N :SyntasticCheck<CR>:Errors<CR>

let g:syntastic_python_pylint_exe = "pylint2"
let g:syntastic_mode_map = { 'mode': 'active',
            \ 'active_filetypes': ['javascript'],
            \ 'passive_filetypes': ['go', 'python'] }

let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='w'
let g:syntastic_style_error_symbol  = 'S✗'
let g:syntastic_style_warning_symbol  = 'Sw'

let g:syntastic_aggregate_errors = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1

let g:syntastic_stl_format="%t:%e/%w"

" }}}
" Lokaltog/vim-easymotion {{{

" map <Leader> <Plug>(easymotion-prefix)
nmap s <Plug>(easymotion-sn)
nmap t <Plug>(easymotion-t2)
" Use uppercase target labels and type as a lower case
let g:EasyMotion_use_upper = 1
 " type `l` and match `l`&`L`
let g:EasyMotion_smartcase = 1
" Smartsign (type `3` and match `3`&`#`)
let g:EasyMotion_use_smartsign_us = 1

" JK motions: Line motions
map <Leader><C-j> <Plug>(easymotion-j)
map <Leader><C-k> <Plug>(easymotion-k)

" }}}
" NERDTree {{{
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" let g:NERDTreeDirArrowExpandable = ''
" let g:NERDTreeDirArrowCollapsible = ''
" }}}
" }}}
