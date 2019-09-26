call plug#begin('~/.local/share/nvim/plug')
" syntax extensions
Plug 'OrangeT/vim-csharp'
Plug 'dag/vim-fish'
Plug 'cespare/vim-toml'
Plug 'calviken/vim-gdscript3'
Plug 'kovetskiy/sxhkd-vim'
Plug 'tikhomirov/vim-glsl'

" completion and linting
"Plug 'w0rp/ale'
Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'Raimondi/delimitMate'
call plug#end()

let g:deoplete#enable_at_startup = 1

" TODO: confiugre a python language server

let g:LanguageClient_serverCommands = {
	\ 'c': ['clangd'],
	\}
	"\ 'glsl': ['glslls', '--stdin'],
"let g:LanguageClient_diagnosticsEnable = 0
let g:LanguageClient_serverStderr = '/tmp/clangd.stderr'

let g:delimitMate_expand_cr = 2

set completeopt=menuone,preview,noinsert,noselect
autocmd CompleteDone * silent! pclose

autocmd BufRead,BufNewFile *.h set filetype=c

set list " show certain invisibles
set listchars=tab:·\ ,trail:$

set textwidth=80 " lines end at 80
set nowrap       " but lines longer than 80 don't get wrapped
set colorcolumn=81 " draw a line at the first column out of bounds
highlight ColorColumn ctermbg=darkgrey
highlight Visual ctermbg=yellow ctermfg=black

set nohlsearch " disable search highlighting

" relative line numbers can be toggled with underscore
set number relativenumber
nnoremap _ :set rnu!<CR>

set background=light

nnoremap <F1> :pc<CR>:ccl<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
nnoremap <F5> :!./run<CR>
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>

inoremap <F1> <nop>
