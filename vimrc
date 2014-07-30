" Make Vim more useful
set nocompatible

" Enable file type detection
filetype on

" set the runtime path to include Vundle and initialize
set runtimepath+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

Plugin 'gmarik/Vundle.vim'
Plugin 'ervandew/supertab'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-markdown'
Plugin 'reedes/vim-pencil'
Plugin 'kana/vim-textobj-user' " Dependency for vim-textobj-sentence
Plugin 'reedes/vim-textobj-sentence'
Plugin 'reedes/vim-lexical'
Plugin 'tpope/vim-commentary' " from Practical Vim (25)
Plugin 'kana/vim-textobj-entire' " from Practical Vim (26)
Plugin 'tpope/vim-unimpaired' " from Practical Vim (79)
Plugin 'tpope/vim-rails' " from Practical Vim (97)
Plugin 'tpope/vim-surround' " from Practical Vim (129)
Plugin 'tpope/vim-bundler' " from Practical Vim (136)
Plugin 'majutsushi/tagbar' " from http://blog.yux.ch/blog/2013/10/01/vim-with-ctags/
Plugin 'altercation/vim-colors-solarized' " from http://fideloper.com/mac-vim-tmux 

" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin on
filetype plugin indent on

" Autoload the matchit plugin -- from Practical Vim (129)
runtime macros/matchit.vim


" vim-pencil
let g:pencil#wrapModeDefault = 'hard'   " or 'soft'
augroup pencil
	autocmd!
	autocmd FileType markdown call pencil#init({'wrap': 'soft'})
	autocmd FileType textile call pencil#init()
	autocmd FileType text call pencil#init({'wrap': 'hard'})
augroup END

augroup lexical " vim-lexical
	autocmd!
	autocmd FileType markdown call lexical#init()
	autocmd FileType textile call lexical#init()
	autocmd FileType text call lexical#init({ 'spell': 0 })
augroup END


"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed

" Enhance command-line completion
set wildmenu
set wildmode=full

" Allow cursor keys in insert mode
set esckeys

" Allow backspace in insert mode
set backspace=indent,eol,start

" Optimize for fast terminal connections
set ttyfast

" Add the g flag to search/replace by default
set gdefault

" Use UTF-8 without BOM
set encoding=utf-8 nobomb

" Change mapleader
let mapleader=","

" Don’t add empty newlines at the end of files
set binary
set noeol

" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif

" Respect modeline in files
set modeline
set modelines=4

" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure

" Enable line numbers
set number

" Enable syntax highlighting
syntax on

" Highlight current line
set cursorline

" Make tabs as wide as two spaces
set tabstop=2

" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list

" Highlight searches
set hlsearch

" Ignore case of searches
set ignorecase

" Highlight dynamically as pattern is typed
set incsearch

" Always show status line
set laststatus=2

" Disable mouse in all modes 
set mouse=""

" Disable error bells
set noerrorbells

" Don’t reset cursor to start of line when moving around.
set nostartofline

" Show the cursor position
set ruler

" Don’t show the intro message when starting Vim
set shortmess=atI

" Show the current mode
set showmode

" Show the filename in the window titlebar
set title

" Show the (partial) command as it’s being typed
set showcmd

" Use relative line numbers
" if exists("&relativenumber")
set relativenumber
" 	au BufReadPost * set relativenumber
" endif

" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction

" Strip whitespace (,ss)
noremap <leader>ss :call StripWhitespace()<CR>

" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Set shift width (when indenting text)
set shiftwidth=2

" Find matching brackets 
set showmatch

" No word wrap
set nowrap

" Overriding syntax files
set runtimepath+=~/.vim/after/syntax

" Longer history
set history=200

" Have <C-p> and <c-n> filter command history
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" Easy expansion of active file directory -- Practical Vim (95)
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Disable use of arrow keys -- Practical Vim (109)
noremap <Up> <Nop>
noremap <Down> <Nop> 
noremap <Left> <Nop> 
noremap <Right> <Nop>

" Open Tagbar automatically -- http://blog.yux.ch/blog/2013/10/01/vim-with-ctags/
" autocmd VimEnter * TagbarToggle