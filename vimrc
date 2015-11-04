if has('vim_starting')
  if &compatible
    set nocompatible           " Be iMproved
  endif

 " required
 set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

set rtp+=~/work/unite.vim
set rtp+=~/work/vimproc.vim

" required
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" required
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

" -------------------------------------------------

" Bundles
NeoBundle 'klen/python-mode'
NeoBundle 'ameade/qtpy-vim'
NeoBundle 'rodjek/vim-puppet'
NeoBundle 'godlygeek/tabular'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tpope/vim-fugitive'
" NeoBundle 'kien/ctrlp.vim'
NeoBundle 'honza/vim-snippets'
" vim-snipmate requires these
NeoBundle "MarcWeber/vim-addon-mw-utils"
NeoBundle "tomtom/tlib_vim"
NeoBundle "garbas/vim-snipmate"
NeoBundle "ekalinin/Dockerfile.vim"
NeoBundle 'https://github.com/JarrodCTaylor/vim-python-test-runner'
NeoBundle "plasticboy/vim-markdown"
NeoBundle "hylang/vim-hy"
NeoBundle "editorconfig/editorconfig-vim"
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'tpope/vim-commentary'

NeoBundle 'Shougo/neocomplete.vim'

NeoBundle 'majutsushi/tagbar'

NeoBundle 'ConradIrwin/vim-bracketed-paste'

NeoBundle 'lambdalisue/vim-gista'

" Color
NeoBundle 'duythinht/inori'

" Go
NeoBundle 'fatih/vim-go'

" PHP
NeoBundle 'arnaud-lb/vim-php-namespace'

" Terraform
NeoBundle 'markcornick/vim-terraform'

" IntelliJ-like smart select
NeoBundle 'terryma/vim-expand-region'

" YAML
NeoBundle "avakhov/vim-yaml"

" HCL
NeoBundle 'fatih/vim-hclfmt'

NeoBundle 'Shougo/unite.vim'

NeoBundle 'airblade/vim-gitgutter'

NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }

NeoBundle 'Shougo/vimfiler.vim'

" -------------------------------------------------
call neobundle#end()

" required
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
" -------------------------------------------------



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



" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" " Use smartcase.
let g:neocomplete#enable_smart_case = 1
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"


" Unite
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
" Unite search for a file
" nnoremap <C-p> :Unite -start-insert tab file_rec/async<cr>
nnoremap <C-p> :Unite -start-insert file buffer file_rec/async<cr>
" nnoremap <C-p> :Unite -start-insert file buffer file_rec/git<cr>

" Unite search in file
call unite#custom#source('file,file/new,buffer,file_rec,line', 'matchers', 'matcher_fuzzy')
nnoremap <C-k> :<C-u>Unite -buffer-name=search -start-insert line<cr>

let g:unite_update_time = 333
let g:unite_source_file_rec_max_cache_files = 0
let g:unite_source_grep_max_candidates = 200

let g:unite_source_grep_command = 'ag --follow --nocolor --nogroup --hidden -g ""'
let g:unite_source_grep_recursive_opt = ''

let g:unite_source_rec_async_command =
    \ 'ag --follow --nocolor --nogroup --hidden -g ""'

" https://github.com/terryma/dotfiles/blob/master/.vimrc#L1317
" Set up some custom ignores
call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
      \ 'ignore_pattern', join([
      \ '\.git/',
      \ 'tmp/',
      \ '.sass-cache',
      \ 'node_modules/',
      \ 'bower_components/',
      \ 'vendor/',
      \ 'target/',
      \ 'Godeps/_workspace',
      \ 'dist/',
      \ '.idea/',
      \ '.vagrant/',
      \ '.pyc',
      \ ], '\|'))


" VimFiler
let g:vimfiler_as_default_explorer = 1

" Gista
let g:gista#github_user = 'sherzberg'
" default to private
let g:gista#post_private = 1

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
