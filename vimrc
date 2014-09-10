"""""""""""""""""""""""""""""""""
" 					STARTUP
"""""""""""""""""""""""""""""""""

" Make Vim more useful
set nocompatible

" Enable filetype plugins/indent settings
filetype plugin indent on

"""""""""""""""""""""""""""""""""
" 					VUNDLE
"""""""""""""""""""""""""""""""""

" set the runtime path to include Vundle and initialize
set runtimepath+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

"""""""""""""""""""""""""""""""""
" 				LIST OF PLUGINS
"""""""""""""""""""""""""""""""""

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
Plugin 'majutsushi/tagbar' 
				" from http://blog.yux.ch/blog/2013/10/01/vim-with-ctags/
Plugin 'altercation/vim-colors-solarized' 
				" http://fideloper.com/mac-vim-tmux 
Plugin 'terryma/vim-multiple-cursors'
Plugin 'itspriddle/vim-marked'
Plugin 'bling/vim-airline' 
Plugin 'gerw/vim-latex-suite'
" Plugin 'xuhdev/SingleCompile' " 
				" http://www.topbug.net/blog/2012/03/07/use-singlecompile-to-compile-and-run-a-single-source-file-easily-in-vim/
Plugin 'vim-scripts/c.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required

"""""""""""""""""""""""""""""""""
" 			PLUGINS SETTINGS
"""""""""""""""""""""""""""""""""

" vim-pencil
let g:pencil#wrapModeDefault = 'hard'   " or 'soft'
augroup pencil
	autocmd!
	autocmd FileType markdown call pencil#init({'wrap': 'soft'})
	autocmd FileType textile call pencil#init()
	autocmd FileType text call pencil#init({'wrap': 'hard'})
augroup END

" vim-lexical
augroup lexical 
	autocmd!
	autocmd FileType markdown call lexical#init()
	autocmd FileType textile call lexical#init()
	autocmd FileType text call lexical#init({ 'spell': 0 })
augroup END

" use g++ compiler for c.vim
let g:C_CCompiler = 'g++'

"""""""""""""""""""""""""""""""""
" 		VUNDLE INSTRUCTIONS	
"""""""""""""""""""""""""""""""""

"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


"""""""""""""""""""""""""""""""""
" 		NON-VUNDLE PLUGINS	
"""""""""""""""""""""""""""""""""

" Autoload the matchit plugin -- from Practical Vim (129)
runtime macros/matchit.vim

" Overriding syntax files
set runtimepath+=~/.vim/after/syntax

" Open Tagbar automatically 
" http://blog.yux.ch/blog/2013/10/01/vim-with-ctags/
" autocmd VimEnter * TagbarToggle

"""""""""""""""""""""""""""""""""
" 				CLIPBOARD
"""""""""""""""""""""""""""""""""

" Use the OS clipboard by default 
" (on versions compiled with `+clipboard`)
set clipboard=unnamed
" if has('unnamedplus')
" 	  set clipboard=unnamed,unnamedplus
" endif

" Sets paste toggle to the F5 key, 
" so you can paste text without the indentation going berserk. 
" http://bencrowder.net/files/vim-fu/ 
:set pastetoggle=<F5>

"""""""""""""""""""""""""""""""""
" 				BASIC
"""""""""""""""""""""""""""""""""

" Opening a new file when the current buffer has unsaved changes
" causes files to be hidden instead of closed. 
set hidden

" Optimize for fast terminal connections
set ttyfast

" Enhance command-line completion
set wildmenu
set wildmode=full

" Use UTF-8 without BOM
set encoding=utf-8 nobomb

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

" Enable per-directory .vimrc files 
" and disable unsafe commands in them
set exrc
set secure

" Longer history
set history=1000

" More levels of undo
set undolevels=1000

" Enable persistent undo  
" http://stevelosh.com/blog/2010/09/coming-home-to-vim/
set undofile

"""""""""""""""""""""""""""""""""
" 					MOVEMENT
"""""""""""""""""""""""""""""""""

" Allow cursor keys in insert mode
set esckeys

" Allow backspace in insert mode
set backspace=indent,eol,start

" Enable mouse in all modes 
" set mouse=""
set mouse=a

"""""""""""""""""""""""""""""""""
" 						UI
"""""""""""""""""""""""""""""""""
" Use Molokai color scheme
syntax enable
set background=dark
colorscheme molokai

" Disable error bells
set noerrorbells

" Disable beeping and flash the screen instead
set visualbell

" Show the filename in the window titlebar
set title

" Don’t show the intro message when starting Vim
set shortmess=atI

" Use relative line numbers
if exists("&relativenumber")
set relativenumber
	au BufReadPost * set relativenumber
endif

" Enable line numbers
" set number

" Enable syntax highlighting
syntax on

" Find matching brackets 
set showmatch

" Show “invisible” characters
set listchars=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list

" Always show status line
set laststatus=2

" Show the cursor position
set ruler

" Highlight current line
set cursorline

" Don’t reset cursor to start of line when moving around
set nostartofline

" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Show the current mode
set showmode

" Show the (partial) command as it’s being typed
set showcmd

"""""""""""""""""""""""""""""""""
" 					SEARCH
"""""""""""""""""""""""""""""""""

" Ignore case of searches
set ignorecase

" Ignore case if search pattern is all lowercase,
" case-sensitive otherwise
set smartcase

" Highlight dynamically as pattern is typed
set incsearch

" Add the g flag to search/replace by default
" for all words in a line
set gdefault

" Highlight searches
set hlsearch

"""""""""""""""""""""""""""""""""
" 					EDITING
"""""""""""""""""""""""""""""""""

" Handle long lines correctly 
" http://stevelosh.com/blog/2010/09/coming-home-to-vim/
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85

" Make tabs as wide as two spaces
set tabstop=4
set softtabstop=4

" Set shift width (when indenting text)
set shiftwidth=4

" Use multiple of shiftwidth when indenting
set shiftround

" Enable automatic indentation
set autoindent

" Copy the previous indentation on autoindenting
" http://nvie.com/posts/how-i-boosted-my-vim/
set copyindent

" Insert tabs on the start of a line according
" to shiftwidth, not tabstop
" http://nvie.com/posts/how-i-boosted-my-vim/
set smarttab

" Replicate TextMate's 'save on losing focus'
" http://stevelosh.com/blog/2010/09/coming-home-to-vim/
au FocusLost * :wa

"""""""""""""""""""""""""""""""""
" 			COMMAND SHORTCUTS
"""""""""""""""""""""""""""""""""

" Change mapleader
let mapleader=","

" Have <C-p> and <c-n> filter command history
cnoremap <C-p> <up>
cnoremap <C-n> <down>

" Quick save  
" http://vim.wikia.com/wiki/Quick_save 
noremap <leader>s :update<CR>

" Easy expansion of active file directory 
" Practical Vim (95)
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Get rid of help key that you will invariably hit
" while aiming for escape
" http://stevelosh.com/blog/2010/09/coming-home-to-vim/
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Make semicolon a colon
nnoremap ; :

"""""""""""""""""""""""""""""""""
" 			MOVEMENT SHORTCUTS
"""""""""""""""""""""""""""""""""

" Disable use of arrow keys and use hjkl instead 
" Practical Vim (109)
nnoremap <up> <nop>
nnoremap <down> <nop> 
nnoremap <left> <nop> 
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop> 
inoremap <left> <nop> 
inoremap <right> <nop>

" Make j and k work the way you expect instead of
" 'movement by file line instead of screen line'
nnoremap j gj
nnoremap k gk

" Map 'jj' in insert mode to do the same as the escape key. 
" http://bencrowder.net/files/vim-fu/
" :imap jj <Esc>

" Exit vim more quickly  
" http://unix.stackexchange.com/questions/93144/exit-vim-more-quickly
nnoremap <leader><leader> :xa<cr>
" inoremap <leader><leader> <esc>:xa<cr>

" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

"""""""""""""""""""""""""""""""""
" 			SEARCH SHORTCUTS
"""""""""""""""""""""""""""""""""

" Turn off Vim's default regex characters 
" and make searches use normal regexes.
" http://stevelosh.com/blog/2010/09/coming-home-to-vim/
nnoremap / /\v
vnoremap / /\v 

" Clear out a search to get rid of distracting highlighting
" Of course, highlighting will appear for future searches
" http://stevelosh.com/blog/2010/09/coming-home-to-vim/ 
nnoremap <leader><space> :noh<cr>

"""""""""""""""""""""""""""""""""
" 			EDITING SHORTCUTS
"""""""""""""""""""""""""""""""""

" Navigate bracket pairs
" http://stevelosh.com/blog/2010/09/coming-home-to-vim/
nnoremap <tab> %
vnoremap <tab> %

" Strip whitespace (,ss)
noremap <leader>ss :call StripWhitespace()<CR>
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction


"""""""""""""""""""""""""""""""""
" 			WINDOW SHORTCUTS
"""""""""""""""""""""""""""""""""

" Open a new vertical window and switch to it
" http://stevelosh.com/blog/2010/09/coming-home-to-vim/
nnoremap <leader>w <C-w>v<C-w>l

" Move around splits easily
" http://stevelosh.com/blog/2010/09/coming-home-to-vim/
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l