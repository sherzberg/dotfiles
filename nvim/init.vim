"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath^=/Users/sherzberg/dotfiles/vim/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin(expand('~/dotfiles/vim/dein'))

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')

" ------------------------------------------------------

" Color
call dein#add('duythinht/inori')

" IntelliJ-like smart select
call dein#add('terryma/vim-expand-region')

" Ctrl-P
call dein#add('ctrlpvim/ctrlp.vim')

" Bracketed Paste
" is this needed in neovim??
" call dein#add('ConradIrwin/vim-bracketed-paste')

" Nice commenting
call dein#add('tpope/vim-commentary')

" Syntax Checker
call dein#add('benekastah/neomake')

" deoplete
call dein#add('Shougo/deoplete.nvim')
call dein#add('zchee/deoplete-go', {'build': 'make'})

" Go
call dein#add('fatih/vim-go')

" ------------------------------------------------------

" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax on

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

" Setup Leader
let mapleader = ","

" Colors
set t_Co=256
silent! colorscheme inori

" NeoVim
" disable mouse
set mouse-=a

" Neomake
" syntax check on save
autocmd! BufWritePost * Neomake

" deoplete
let g:deoplete#enable_at_startup = 1
" " Use smartcase.
let g:deoplete#enable_smart_case = 1
" <TAB>: completion.
inoremap <silent><expr> <Tab>
		\ pumvisible() ? "\<C-n>" :
		\ deoplete#mappings#manual_complete()

syntax on

" Various settings
"-----------------------------------------------------------------------------------
set autoindent                         " Copy indent from current line
set autoread                           " Read open files again when changed outside Vim
set autowrite                          " Write a modified buffer on each :next , ...
set backspace=indent,eol,start         " Backspacing over everything in insert mode
set history=200                        " Keep 200 lines of command line history
set incsearch                          " Do incremental searching
set ignorecase                         " Ignore case when searching....
set smartcase                          " ...unless uppercase letter are used
set hlsearch                           " Highlight the last used search pattern
"set list                               " Toggle manually with set list / set nolist or set list!
"set listchars=""                       " Empty the listchars
"set listchars=tab:>.                   " A tab will be displayed as >...
"set listchars+=trail:.                 " Trailing white spaces will be displayed as .
set nobackup                           " Don't constantly write backup files
set noswapfile                         " Ain't nobody got time for swap files
set noerrorbells                       " Don't beep
set nowrap                             " Do not wrap lines
set showbreak=|->                      " Character to precede line wraps for the times I turn it on
set popt=left:8pc,right:3pc            " Print options
set shiftwidth=4                       " Number of spaces to use for each step of indent
set showcmd                            " Display incomplete commands in the bottom line of the screen
set tabstop=4                          " Number of spaces that a <Tab> counts for
set expandtab                          " Make vim use spaces and not tabs
set undolevels=1000                    " Never can be too careful when it comes to undoing
set hidden                             " Don't unload the buffer when we switch between them. Saves undo history
set visualbell                         " Visual bell instead of beeping
set wildignore=*.swp,*.bak,*.pyc,*.class,node_modules/**  " wildmenu: ignore these extensions
set wildmenu                           " Command-line completion in an enhanced mode
set shell=bash                         " Required to let zsh know how to run things on command line
set ttimeoutlen=50                     " Fix delay when escaping from insert with Esc
set noshowmode                         " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set synmaxcol=256                      " Don't syntax highlight long lines
set nosol                              " Keep cursor in the same column if possible for G, gg, etc.
set ruler
set number
set showmode

" Treat JSON files like JavaScript {2
"-----------------------------------------------------------------------------------
au BufNewFile,BufRead *.json set ft=javascript
"-----------------------------------------------------------------------------------
" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
"-----------------------------------------------------------------------------------
if has("autocmd")
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif
endif

" Bundles
"" NeoBundle 'klen/python-mode'
"" NeoBundle 'ameade/qtpy-vim'
"" NeoBundle 'rodjek/vim-puppet'
"" NeoBundle 'godlygeek/tabular'
"" NeoBundle 'scrooloose/syntastic'
"" NeoBundle 'tpope/vim-fugitive'
"" NeoBundle 'honza/vim-snippets'
"" " vim-snipmate requires these
"" NeoBundle "MarcWeber/vim-addon-mw-utils"
"" NeoBundle "tomtom/tlib_vim"
"" NeoBundle "garbas/vim-snipmate"

"" NeoBundle "ekalinin/Dockerfile.vim"
"" NeoBundle 'https://github.com/JarrodCTaylor/vim-python-test-runner'
"" NeoBundle "plasticboy/vim-markdown"
"" NeoBundle "hylang/vim-hy"
"" NeoBundle "editorconfig/editorconfig-vim"
"" NeoBundle 'vim-ruby/vim-ruby'
"" 
"" NeoBundle 'majutsushi/tagbar'
"" 
"" 
"" NeoBundle 'lambdalisue/vim-gista'
"" 
"" " Go
"" NeoBundle 'fatih/vim-go'
"" 
"" " PHP
"" NeoBundle 'arnaud-lb/vim-php-namespace'
"" 
"" " Terraform
"" NeoBundle 'markcornick/vim-terraform'
"" 
"" 
"" " YAML
"" NeoBundle "avakhov/vim-yaml"
"" 
"" " HCL
"" NeoBundle 'fatih/vim-hclfmt'
"" 
"" NeoBundle 'Shougo/unite.vim'
"" 
"" NeoBundle 'airblade/vim-gitgutter'
"" 
"" NeoBundle 'Shougo/vimproc.vim', {
"" \ 'build' : {
"" \     'windows' : 'tools\\update-dll-mingw',
"" \     'cygwin' : 'make -f make_cygwin.mak',
"" \     'mac' : 'make -f make_mac.mak',
"" \     'linux' : 'make',
"" \     'unix' : 'gmake',
"" \    },
"" \ }
"" 
"" NeoBundle 'Shougo/vimfiler.vim'
"" 
"" " -------------------------------------------------
"" call neobundle#end()
"" 
"" " required
"" filetype plugin indent on
"" 
"" " If there are uninstalled bundles found on startup,
"" " this will conveniently prompt you to install them.
"" NeoBundleCheck
"" " -------------------------------------------------
"" 
"" 
"" 
"" " Setup Leader
"" let mapleader = ","
"" 
"" " File Type settings
"" autocmd filetype python set expandtab
"" autocmd filetype python set ft=python.django
"" 
"" " Colors
"" set t_Co=256
"" silent! colorscheme inori
"" 
"" " Python Mode Settings
"" " Enable python folding
"" let g:pymode_folding = 0
"" " Disable rope guess
"" let g:pymode_rope_guess_project = 0
"" " Ignore errors with:
"" let g:pymode_lint_ignore = "E501,E128,W391"
"" " Ignore 'dot'
"" let g:pymode_rope_complete_on_dot = 0
"" " Disable rope lookup project
"" let g:pymode_rope_lookup_project = 0
"" let g:pymode_rope_regenerate_on_write = 0
"" let g:pymode_rope_autoimport = 0
"" 
"" " Ignore compiled files
"" set wildignore=*.o,*~,*.pyc
"" 
"" " Key Mappings
"" """"""""""""""
"" 
"" " Fast saving
"" nmap <leader>w :w!<cr>
"" nmap <leader>q :q<cr>
"" nmap <leader>wq :wq<cr>
"" nmap <leader>qw :wq<cr>
"" 
"" " I always type this on accedent...
"" nmap <leader>Wq :wq<cr>
"" nmap <leader>wq :wq<cr>
"" 
"" " Split Window Navigation
"" map <C-h> <C-w>h
"" map <C-j> <C-w>j
"" map <C-k> <C-w>k
"" map <C-l> <C-w>l
"" 
"" " Remove arrow key mappings
"" "map <up> <nop>
"" "map <down> <nop>
"" "map <left> <nop>
"" "map <right> <nop>
"" "imap <up> <nop>
"" "imap <down> <nop>
"" "imap <left> <nop>
"" "imap <right> <nop>
"" 
"" "QTPY
"" au FileType python nnoremap <F8> :QTPY method verbose<CR>
"" au FileType python nnoremap <F9> :QTPY session<CR>
"" au FileType python nnoremap <silent><Leader>c <Esc>:QTPY class verbose<CR>
"" au FileType python nnoremap <silent><Leader>m <Esc>:QTPY method verbose<CR>
"" 
"" "vim-python-test-runner
"" nnoremap<Leader>da :DjangoTestApp<CR>
"" nnoremap<Leader>df :DjangoTestFile<CR>
"" nnoremap<Leader>dc :DjangoTestClass<CR>
"" nnoremap<Leader>dm :DjangoTestMethod<CR>
"" nnoremap<Leader>nf :NosetestFile<CR>
"" nnoremap<Leader>nc :NosetestClass<CR>
"" nnoremap<Leader>nm :NosetestMethod<CR>
"" nnoremap<Leader>rr :RerunLastTests<CR>
"" 
"" "vim-markdown settings
"" let g:vim_markdown_folding_disabled=1
"" 
"" 
"" 
"" " Unite
"" call unite#filters#matcher_default#use(['matcher_fuzzy'])
"" call unite#filters#sorter_default#use(['sorter_rank'])
"" " Unite search for a file
"" " nnoremap <C-p> :Unite -start-insert tab file_rec/async<cr>
"" nnoremap <C-p> :Unite -start-insert file buffer file_rec/async<cr>
"" " nnoremap <C-p> :Unite -start-insert file buffer file_rec/git<cr>
"" 
"" " Unite search in file
"" call unite#custom#source('file,file/new,buffer,file_rec,line', 'matchers', 'matcher_fuzzy')
"" nnoremap <C-k> :<C-u>Unite -buffer-name=search -start-insert line<cr>
"" 
"" let g:unite_update_time = 333
"" let g:unite_source_file_rec_max_cache_files = 0
"" let g:unite_source_grep_max_candidates = 200
"" 
"" let g:unite_source_grep_command = 'ag --follow --nocolor --nogroup --hidden -g ""'
"" let g:unite_source_grep_recursive_opt = ''
"" 
"" let g:unite_source_rec_async_command =
""     \ 'ag --follow --nocolor --nogroup --hidden -g ""'
"" 
"" " https://github.com/terryma/dotfiles/blob/master/.vimrc#L1317
"" " Set up some custom ignores
"" call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
""       \ 'ignore_pattern', join([
""       \ '\.git/',
""       \ 'tmp/',
""       \ '.sass-cache',
""       \ 'node_modules/',
""       \ 'bower_components/',
""       \ 'vendor/',
""       \ 'target/',
""       \ 'Godeps/_workspace',
""       \ 'dist/',
""       \ '.idea/',
""       \ '.vagrant/',
""       \ '.pyc',
""       \ ], '\|'))
"" 
"" 
"" " VimFiler
"" let g:vimfiler_as_default_explorer = 1
"" 
"" " Gista
"" let g:gista#github_user = 'sherzberg'
"" " default to private
"" let g:gista#post_private = 1
"" 
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
