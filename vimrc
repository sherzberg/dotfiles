set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" Bundles
Bundle 'klen/python-mode'
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
Bundle "hylang/vim-hy"
Bundle "editorconfig/editorconfig-vim"
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-commentary'

Bundle 'majutsushi/tagbar'

" Color
Bundle 'duythinht/inori'

" Go
Bundle 'fatih/vim-go'

" PHP
Bundle 'arnaud-lb/vim-php-namespace'

" Scala
Bundle 'derekwyatt/vim-scala'

" Terraform
Bundle 'markcornick/vim-terraform'

filetype plugin indent on     " required!

" Setup Leader
let mapleader = ","

" File Type settings
autocmd filetype python set expandtab
autocmd filetype python set ft=python.django

" Colors
set t_Co=256
silent! colorscheme inori

" Python Mode Settings
" Enable python folding
let g:pymode_folding = 0
" Disable rope guess
let g:pymode_rope_guess_project = 0
" Ignore errors with:
let g:pymode_lint_ignore = "E501,E128,W391"
" Ignore 'dot'
let g:pymode_rope_complete_on_dot = 0
" Disable rope lookup project
let g:pymode_rope_lookup_project = 0
let g:pymode_rope_regenerate_on_write = 0
let g:pymode_rope_autoimport = 0

" CtrlP Mappings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" let g:ctrlp_custom_ignore = 'build$\|node_modules$\|.DS_Store|.git|.bak|.swp|.pyc|_site$\'
let g:ctrlp_custom_ignore = {
  \ 'hiddendir':  '\v[\/]\.(git|hg|svn|DS_Store)$',
  \ 'dir':  '\v[\/](_site)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
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

" I always type this on accedent...
nmap <leader>Wq :wq<cr>
nmap <leader>wq :wq<cr>

" Split Window Navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Remove arrow key mappings
"map <up> <nop>
"map <down> <nop>
"map <left> <nop>
"map <right> <nop>
"imap <up> <nop>
"imap <down> <nop>
"imap <left> <nop>
"imap <right> <nop>

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
nnoremap<Leader>nf :NosetestFile<CR>
nnoremap<Leader>nc :NosetestClass<CR>
nnoremap<Leader>nm :NosetestMethod<CR>
nnoremap<Leader>rr :RerunLastTests<CR>

"vim-markdown settings
let g:vim_markdown_folding_disabled=1









" From here: https://github.com/JarrodCTaylor/dotfiles

if !exists("g:exclude")
    let g:exclude = [""]
endif

let b:fileList = split(globpath('~/.vim/vanilla-configs', '*.vim'), '\n')
" let b:fileList += split(globpath('~/.vim/plugin-configs', '*.vim'), '\n')
" let b:fileList += split(globpath('~/.vim/functions', '*.vim'), '\n')
" let b:fileList += split(globpath('~/dotfiles/custom-configs/**', '*.vim'), '\n')

" Function to process lists for sourceing and adding bundles {1
function! ProcessList(listToProcess, functionToCall)
    for fpath in a:listToProcess
        if index(g:exclude, split(fpath, "/")[-1]) >= 0
            continue
        else
            call {a:functionToCall}(fpath)
        endif
    endfor
endfunction

function! SourceFile(fpath)
    exe 'source' a:fpath
endfunction

call ProcessList(b:fileList, "SourceFile")
