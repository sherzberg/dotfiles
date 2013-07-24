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
" color 256-jungle

" Python Mode Settings
" Enable python folding
let g:pymode_folding = 0

"Disable rope guess
let g:pymode_rope_guess_project = 0


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

