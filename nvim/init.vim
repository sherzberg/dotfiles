"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/sherzberg/.nvim/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('/home/sherzberg/.nvim/dein')

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

" Editorconfig
call dein#add('editorconfig/editorconfig-vim')

" Bracketed Paste
" is this needed in neovim??
" call dein#add('ConradIrwin/vim-bracketed-paste')

" Nice commenting
call dein#add('tpope/vim-commentary')

" Syntax Checker
call dein#add('benekastah/neomake')

" git
call dein#add('tpope/vim-fugitive')
call dein#add('airblade/vim-gitgutter')

" deoplete
call dein#add('Shougo/deoplete.nvim')
call dein#add('zchee/deoplete-go', {'build': 'make'})

" Go
call dein#add('fatih/vim-go')

" HCL
call dein#add('fatih/vim-hclfmt')

" Terraform
call dein#add('hashivim/vim-terraform')

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


" vim-go
let g:go_fmt_command = "goimports"

" Ctrl-P
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

set wildignore+=*/tmp/*,*/vendor/*,*/node_modules/*,*/bower_components*/,*.so,*.swp,*.zip     " MacOSX/Linux

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
" Treat Thor files like Ruby {2
"-----------------------------------------------------------------------------------
au BufRead,BufNewFile *.thor set filetype=ruby
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
