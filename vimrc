set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" Bundles
Bundle 'klen/python-mode'
Bundle 'flazz/vim-colorschemes'
Bundle 'ameade/qtpy-vim'
Bundle 'rodjek/vim-puppet'
Bundle 'godlygeek/tabular'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-fugitive'
Bundle 'kien/ctrlp.vim'
Bundle 'honza/vim-snippets'
" vim-snipmate requires these
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle "ekalinin/Dockerfile.vim"
Bundle 'https://github.com/JarrodCTaylor/vim-python-test-runner'
Bundle "plasticboy/vim-markdown"
Bundle "jnwhiteh/vim-golang"


filetype plugin indent on     " required!

" Setup Leader
let mapleader = ","

syntax on
set ruler
set number
set showmode

" File Type settings
autocmd filetype python set expandtab
autocmd filetype python set ft=python.django

" Colors
set t_Co=256
color 256-jungle

" Python Mode Settings
" Enable python folding
let g:pymode_folding = 0

"Disable rope guess
let g:pymode_rope_guess_project = 0

" Ignore errors with:
let g:pymode_lint_ignore = "E501,E128"

" CtrlP Mappings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = 'build$\|node_modules$\|.DS_Store|.git|.bak|.swp|.pyc'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_dotfiles = 0
let g:ctrlp_switch_buffer = 0
let g:ctrlp_max_height = 18

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

" Key Mappings
""""""""""""""

" Fast saving
nmap <leader>w :w!<cr>
nmap <leader>q :q<cr>
nmap <leader>wq :wq<cr>
nmap <leader>qw :wq<cr>

" Split Window Navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Remove arrow key mappings
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

"QTPY
au FileType python nnoremap <F8> :QTPY method verbose<CR>
au FileType python nnoremap <F9> :QTPY session<CR>
au FileType python nnoremap <silent><Leader>c <Esc>:QTPY class verbose<CR>
au FileType python nnoremap <silent><Leader>m <Esc>:QTPY method verbose<CR>

"vim-python-test-runner
nnoremap<Leader>da :DjangoTestApp<CR>
nnoremap<Leader>df :DjangoTestFile<CR>
nnoremap<Leader>dc :DjangoTestClass<CR>
nnoremap<Leader>dm :DjangoTestMethod<CR>

"vim-markdown settings
let g:vim_markdown_folding_disabled=1
