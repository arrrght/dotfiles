" VimPLug https://github.com/junegunn/vim-plug {{{
call plug#begin()
Plug 'neovim/nvim-lspconfig'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
" Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'myusuf3/numbers.vim'
Plug 'Yggdroot/indentLine'
Plug 'earthly/earthly.vim', { 'branch': 'main' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'chr4/nginx.vim'
Plug 'towolf/vim-helm'
Plug 'hashivim/vim-terraform'
Plug 'mfussenegger/nvim-dap'
" Plug 'puremourning/vimspector'
Plug 'editorconfig/editorconfig-vim'
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Plug 'jvirtanen/vim-hcl'
" Plug 'hashivim/vim-terraform'
Plug 'alx741/vim-rustfmt'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'preservim/tagbar'
Plug 'github/copilot.vim', { 'branch': 'release' }
" Plug 'vim-vdebug/vdebug'
Plug 'puremourning/vimspector'
" Plug 'mfussenegger/nvim-dap'
" Plug 'jremmen/vim-ripgrep'
Plug 'google/vim-jsonnet'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()
" after changes run :PlugInstall
" }}}

let mapleader=' '
let maplocalleader= ' '

let g:vimspector_enable_mappings = 'HUMAN'
nmap <leader>vl :call vimspector#Launch()<CR>
nmap <leader>vr :VimspectorReset<CR>
nmap <leader>ve :VimspectorEval
nmap <leader>vw :VimspectorWatch
nmap <leader>vo :VimspectorShowOutput
nmap <leader>vi <Plug>VimspectorBalloonEval
xmap <leader>vi <Plug>VimspectorBalloonEval

" let g:copilot_node_command = "/Users/a3r/.hb/Cellar/node@16/16.15.1/bin/node"
"
let g:vdebug_options = {}
let g:vdebug_options["port"] = 7000

lua <<EOF
 require'lspconfig'.terraformls.setup{} 
 require'lspconfig'.tflint.setup{}
EOF

autocmd BufEnter *.tf :setlocal filetype=terraform
autocmd BufWritePre *.tf lua vim.lsp.buf.formatting_sync()

au BufRead,BufNewFile *.hcl set filetype=tf

cnoreabbrev Wq wq
syntax on
filetype plugin indent on

nmap Y yy
nmap TG :TagbarToggle<CR>
nmap TT :NERDTreeToggle<CR>

set nohlsearch
set clipboard+=unnamedplus
colorscheme gruvbox

set modeline
set modelines=5
set expandtab                  " spaces instead of tabs
set tabstop=4                  " a tab = four spaces
set shiftwidth=4               " number of spaces for auto-indent
set softtabstop=4              " a soft-tab of four spaces
set autoindent                 " set on the auto-indent
set smarttab
set noswapfile

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType helm setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType proto setlocal ts=2 sts=2 sw=2 expandtab

set foldenable
set foldmethod=marker

let g:rustfmt_on_save = 1
let g:rustfmt_edition = '2021'

nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt

let g:syntastic_yaml_checkers = ['yamllint']

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=%{FugitiveStatusline()}
let g:indentLine_char_list = ['|', '¦', '┆', '┊']


" Conceal {{{
let g:vim_json_conceal=0
let g:markdown_syntax_conceal=0
" }}}
" NERDTree {{{
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" show hidden files on NERDTree by default
let NERDTreeShowHidden=1
" let NERDTreeShowBookmarks = 1
" }}}
" Airline {{{
" set noshowmode

" let g:airline_theme="dark"
let g:airline_powerline_fonts=1
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#whitespace#enabled=1

let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

let g:airline#extensions#tabline#enabled = 2
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_min_count = 1

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
