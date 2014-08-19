" /usr/<username>/.vimrc Configuration for Vim version 7.4     "
"                                                              "
" Adapted from:                                                "
" 1) Steve Losh                                                "
" 2) Devcharm: http://devcharm.com/pages/18-vim-is-your-new-ide"
" 3) mutewinter/dotvim, vimified,                   "
"                                                              "
" Jonathan Tan, NUS School of Computing                        "
" Vim configuration for Modules of CS1010, CS1020, and beyond. "
" Config includes popular plugins that make Vim a better text  "
" editor that suits text editting for courses taken in intro.  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""
" Vundle plugin manager config "
""""""""""""""""""""""""""""""""
" Initialise Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Vundle manages Vundle
Bundle 'gmarik/vundle'

" Plugins "
Bundle 'rking/ag.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/syntastic'
Bundle 'Shougo/unite.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'tsaleh/vim-align'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-surround'

" HTML plugins "
Bundle 'tpope/vim-markdown'
Bundle 'rstacruz/sparkup'

""""""""""""""""""""""""""
" Important .vimrc Lines "
"""""""""""""""""""""""""""
" .vimrc commands
filetype plugin indent on
set modelines=0

" VIM USABILITY "
"" Use system clipboard
set clipboard+=unnamed
set nobackup

" _ backups {{{
if has('persistent_undo')
    set undodir=~/.vim/tmp/undo//     " undo files
    set undofile
    set undolevels=3000
    set undoreload=10000
endif
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swap files
set backup
set noswapfile
" _ }}}

" no viminfo files
"set viminfo=
"set backupdir=~/.vim/backup
"set directory=~/.vim/backup

set encoding=utf-8
set ffs=unix,dos,mac
set scrolloff=3
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set dictionary=/usr/share/dict/wordst

"" No error and visual bells
set visualbell
set t_vb=
set noerrorbells

" UI Configuration "
set cursorline
set ttyfast
set ruler
set relativenumber
set number
set laststatus=2 " needed for PowerLine
set undofile
" if exists('+colorcolumn')
" set colorcolumn=80 " Color the 80th column differently as a wrapping guide.
" endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fast editing and reloading of config files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{
nnoremap <leader>ev <C-w>s<C-w>j:e $MYVIMRC<cr>
nnoremap <leader>es <C-w>s<C-w>j:e ~/.vim/snippets/<cr>
nnoremap <leader>eg <C-w>s<C-w>j:e ~/.gitconfig<cr>
nnoremap <leader>ez <C-w>s<C-w>j:e ~/.zshrc<cr>

" --------------------

set ofu=syntaxcomplete#Complete
let g:rubycomplete_buffer_loading = 0
let g:rubycomplete_classes_in_global = 1

" showmarks
let g:showmarks_enable = 1
hi! link ShowMarksHLl LineNr
hi! link ShowMarksHLu LineNr
hi! link ShowMarksHLo LineNr
hi! link ShowMarksHLm LineNr
" }}}

""""""""""""""""""""
" FONTS AND COLORS "
""""""""""""""""""""
if has("mac") || has("macunix")
    set gfn=CosmicSansNeueMono:h12
elseif has("linux")
    set gfn=Monospace\ 12
endif

syntax enable
set background=dark
set t_Co=256
colorscheme molokai

"" MacVim default font and size
set guifont=Inconsolata:h14
if has("gui_macvim")
    set fuoptions=maxvert,maxhorz
    "" au GUIEnter * set fullscreen
endif

"""""""""""""""""""
" Text Formatting "
"""""""""""""""""""
set tabstop=4
set backspace=indent,eol,start
set autoindent
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab
set wrap

autocmd FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType python set complete+=k~/.vim/syntax/python.vim isk+=.,(

" Vim Mappings and Keybinds "
let mapleader = ","

" ---------------
" Searching
" ---------------
nnoremap / /\v
vnoremap / /\v
set ignorecase " Case insensitive search
set smartcase  " Non-case sensitive search
set incsearch  " Incremental search
set hlsearch   " Highlight search results
set gdefault
set showmatch
set wildignore+=*.o,*.obj,*.exe,*.so,*.dll,*.pyc,.svn,.hg,.bzr,.git,
            \.sass-cache,*.class,*.scssc,*.cssc,sprockets%*,*.lessc,*/node_modules/*,
            \rake-pipeline-*

" Stops search highlighting "
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

""""""""""""""""
" . Folding    "
""""""""""""""""
set foldlevelstart=10
set foldmethod=syntax

" Space to toggle folds.
nnoremap <space> za
vnoremap <space> za

" Make zO recursively open whatever top level fold we're in, no matter where the
" cursor happens to be.
nnoremap zO zCzO

" Use ,z to "focus" the current fold.
nnoremap <leader>z zMzvzz


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Parenthesis/bracket
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $e <esc>`>a"<esc>`<i"<esc>

" Map auto complete of (, ", ', [
inoremap $1 ()<esc>i
inoremap $2 []<esc>i
inoremap $3 {}<esc>i
inoremap $4 {<esc>o}<esc>O
inoremap $q ''<esc>i
inoremap $e ""<esc>i
inoremap $t <><esc>i

" Handling of long lines "
set wrap
set textwidth=79
set formatoptions=qrn1
" set colorcolumn=85 "

"" No arrow keys for vimmers!
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" More natural navigation with hjkl
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" Usability fixes "
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
" Quicker colon remap
nnoremap ; :
" Auto-save when on other windows
au FocusLost * :wa

""""""""""""""""""""""""""
""   <Leader> keybinds   "
""""""""""""""""""""""""""
" Gets rid of trailing whitespace "
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" HTML and CSS Fold Tag + Sorting "
nnoremap <leader>ft Vatzf
nnoremap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>

" Hardwrap text "
nnoremap <leader>q gqip

" Reselect Pasted Text "
nnoremap <leader>v V`]
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

" Quicker Escape to NORMAL "
inoremap jj <ESC>

" Vertical and Horizontal Split "
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader>h <C-w>s<C-w>j

" Navigation around buffers "
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" ---------------
" NERDTree
" ---------------
nnoremap <leader>nn :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeChDirMode = 1
let g:NERDTreeWinSize = 20
let g:NERDTreeMinimalUI = 1
" Close Vim if NERDTree is the last buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType")
            \&& b:NERDTreeType == "primary") | q | endif

" ---------------
" Syntastic
" ---------------
let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_mode_map = { 'mode': 'active',
            \ 'active_filetypes': [],
            \ 'passive_filetypes': [] }
let g:syntastic_html_checkers = ['handlebars']
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args = '--ignore="E501,E302,E261,E701,E241,E126,E127,E128,W801"'

" Hat tip http://git.io/SPIBfg
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_full_redraws = 1

" ---------------
" ctrlp.vim
" ---------------
" Ensure Ctrl-P isn't bound by default
let g:ctrlp_map = ''

" Ensure max height isn't too large. (for performance)
let g:ctrlp_max_height = 10
let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }
" Fix fix new windows opening in split from startify
let g:ctrlp_reuse_window = 'startify'
let g:ctrlp_mruf_max = 350
let g:ctrlp_mruf_default_order = 0

" Leader Commands
nnoremap <leader>t :CtrlPRoot<CR>
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>u :CtrlPCurFile<CR>
nnoremap <leader>m :CtrlPMRUFiles<CR>

" ---------------
" Ag.vim
" ---------------
nnoremap <silent> <leader>as :AgFromSearch<CR>
nnoremap <leader>ag :Ag<space>

" ---------------
" vim-markdown
" ---------------
let g:vim_markdown_folding_disabled = 1
