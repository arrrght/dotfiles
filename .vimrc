call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'vim-syntastic/syntastic'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'
Plug 'myusuf3/numbers.vim'
Plug 'elixir-editors/vim-elixir'
call plug#end()
" after changes run :PlugInstall

set backspace=indent,eol,start

" Open NERDTree automatically when no files
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

nnoremap H <NOP>
nnoremap L <NOP>
nnoremap M <NOP>
syntax on
filetype plugin indent on
set background=dark
 
set modeline
set tabstop=2
set shiftwidth=2
colorscheme gruvbox

" Ansible jinja
au BufRead,BufNewFile *.j2 set filetype=jinja
au FileType xml setlocal equalprg=xmllint\ --format\ --encode\ UTF-8\ --noent\ --recover\ -\ 2>/dev/null
let g:syntastic_yaml_checkers = ['yamllint']

set listchars=eol:⏎,tab:␉·,trail:␠,nbsp:⎵

let g:rust_cargo_check_tests = 1

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=%{FugitiveStatusline()}
