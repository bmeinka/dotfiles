call plug#begin('~/.local/share/nvim/plug')
Plug 'w0rp/ale'
Plug 'OmniSharp/omnisharp-vim'
Plug 'OrangeT/vim-csharp'
Plug 'dag/vim-fish'
Plug 'cespare/vim-toml'
Plug 'calviken/vim-gdscript3'
call plug#end()

" async connection to omnisharp server
let g:OmniSharp_server_stdio = 1

" highlight types
highlight link csUserIdentifier Normal
let g:OmniSharp_highlight_types = 2

" only use omnisharp for c# linting
let g:ale_linters = {'cs': ['OmniSharp']}

nnoremap gd :OmniSharpGotoDefinition<CR>
nnoremap <Leader>fi :OmniSharpFindImplementations<CR>
nnoremap <Leader>fs :OmniSharpFindSymbol<CR>
nnoremap <Leader>fu :OmniSharpFindUsages<CR>
nnoremap <Leader>fm :OmniSharpFindMembers<CR>

nnoremap <Leader>fx :OmniSharpFixUsings<CR>
nnoremap <Leader>tt :OmniSharpTypeLookup<CR>
nnoremap <Leader>dc :OmniSharpDocumentation<CR>
nnoremap <Leader>dh :OmniSharpSignatureHelp<CR>

nnoremap <Leader><Space> :OmniSharpGetCodeActions<CR>
xnoremap <Leader><Space> :call OmniSharp#GetCodeActions('visual')<CR>
nnoremap <buffer> <Leader>cc :OmniSharpGlobalCodeCheck<CR>
nnoremap <Leader>cf :OmniSharpCodeFormat<CR>

nnoremap <F2> :OmniSharpRename<CR>

" TODO: experiment with longest, noinsert and noselect
set completeopt=menuone,preview

set list " show certain invisibles
set listchars=tab:·\ ,trail:$

set tabstop=4
set shiftwidth=4

set textwidth=80 " lines end at 80
set nowrap       " but lines longer than 80 don't get wrapped

set nohlsearch " disable search highlighting

" relative line numbers can be toggled with underscore
set number relativenumber
nnoremap _ :set rnu!<CR>

set background=light

noremap <F1> <nop>
nnoremap <F1> :pc<CR>:ccl<CR>
