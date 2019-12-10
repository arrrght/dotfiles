set backspace=indent,eol,start

nnoremap H <NOP>
nnoremap L <NOP>
nnoremap M <NOP>

execute pathogen#infect()
syntax on
filetype plugin indent on
set background=dark
let g:solarized_termcolors=256
colorscheme gruvbox
map <F1> <C-w><C-w>
set modeline
set tabstop=2
set shiftwidth=2
" let g:syntastic_enable_perl_checker = 1
" let g:syntastic_kotlin_checkers=['kotlinc']
au BufRead,BufNewFile *.j2 set filetype=jinja


set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" 
" let g:rust_cargo_check_tests = 1

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
