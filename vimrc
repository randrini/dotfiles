let mapleader =  " " " Changing default master key

set encoding=utf8
set t_Co=256  " 256 colormode

set nomodeline

set nowrap
"Except ... on  Markdown. Good stuff?
	autocmd FileType markdown setlocal warp
" Adjust system undo levels
set undolevels=100
" Use system clipboard
set clipboard=unnamed
" Set tab width and convert tabs to spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smartindent

" Don't let Vim hide characters or make loud dings
set conceallevel=1
set noerrorbells
" Number gutter
set number
set numberwidth=5
" Space above/beside cursor from screen edges
set scrolloff=1
set sidescrolloff=5
" Remaping Esc to jj
inoremap jj <ESC>
" Nerd Commenter
filetype plugin on

set ignorecase
set smartcase

set autoindent        " indent
set showmatch         " highlight matching brackets
set autoread          " when file was changed
set lazyredraw        " redraw only when we need to"
set hlsearch          " highlight same words while searching with Shift + *

" removes the delay when hitting esc in insert mode
set ttimeout
set ttimeoutlen=1

" automatically refresh changed files
set autoread

" make line number brighter
hi LineNr ctermfg=240 guifg=#585858

" wrap long lines
nnoremap wl gggqG

" redraw vim
nnoremap rr :so $MYVIMRC \| checktime<CR>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" highlight last inserted text
nnoremap gV `[v`]

" use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
endif

"=========== Plugin Manager ==========

call plug#begin('~/.local/share/nvim/plugged')

" Important?
Plug 'Shougo/unite.vim'

" Visual
Plug 'dracula/vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Project - Navigation - Files
Plug 'ctrlpvim/ctrlp.vim', { 'on': 'CtrlP' }
Plug 'mhinz/vim-grepper'
Plug 'Shougo/vimfiler.vim', { 'on': 'VimFiler' }
Plug 'scrooloose/nerdtree'

" Code help
Plug 'tpope/vim-repeat'                                 " repeat more commands with '.'
Plug 'terryma/vim-multiple-cursors'                     " multiple cursors like in ST
Plug 'Shougo/deoplete.nvim', { 'on': [], 'do': ':UpdateRemotePlugins', 'tag': 'e28d519' } " autocomplete, use e28d519 because of https://github.com/Shougo/deoplete.nvim/issues/291
Plug 'Raimondi/delimitMate', { 'on': [] }               " closing brackets
Plug 'terryma/vim-expand-region'                        " change visual selection by using '+' / '-'
Plug 'mbbill/undotree'                                  " undo history tree
Plug 'Yggdroot/indentLine'                              " indent columns
Plug 'tpope/vim-surround'                               " better brackets
Plug 'scrooloose/syntastic'                             " check syntax
Plug 'w0rp/ale'
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/nerdcommenter'
" using deoplete - Plug 'valloric/youcompleteme'

" Movement
Plug 'justinmk/vim-sneak'

" Tmux
Plug 'christoomey/vim-tmux-navigator'

" git
Plug 'tpope/vim-fugitive'                               " git commands
Plug 'airblade/vim-gitgutter'                           " git gutter

call plug#end()

" Disable mouse support
set mouse=r
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1


"=========== Dealing with Buffers/Tab ==============

" Return the last file opened : 
" SPACE SPACE to open  previously opened file buffer
nmap <Leader><Leader> <c-^>

" Next/Previous Buffer/Tab
"TAB next buffer, SHIFT TAB previous
nnoremap <Tab> :bnext!<CR> 
nnoremap <S-Tab> :bprev!<CR><Paste>

" Change arrow keys to resize panes
nnoremap <Left> :vertical resize -1<CR>
nnoremap <Right> :vertical resize +1<CR>
nnoremap <Up> :resize -1<CR>
nnoremap <Down> :resize +1<CR>

"Disable arrow keys completely in Insert Mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

"=========== indentLine settings =========
let g:indentLine_enabled = 1
let g:indentLine_char = "⟩"

"=========== airline settings =========
let g:airline#extensions#tabline#enabled=1
let g:airline_powrline_fonts=1
set laststatus=2

" adding empty lines
nnoremap <Leader>[  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[
nnoremap <Leader>]  :<c-u>put =repeat(nr2char(10), v:count1)<cr>
" moving current line
nnoremap <Leader>m[  :<c-u>execute 'move -1-'. v:count1<cr>
nnoremap <Leader>m]  :<c-u>execute 'move +'. v:count1<cr>

"========= ctrlp settings ==========
" SPACE t or SPACE p opens Fuzzy Finder
nnoremap <Leader>p :CtrlP<CR>
nnoremap <Leader>t :CtrlP<CR>

"======== vim-grepper find in files settings ====
" SPACE f p to  type a search to find matches in entire
" project; SPACE f b in current buffers
nnoremap <Leader>fp :Grepper<Space>-query<Space>
nnoremap <Leader>fb :Grepper<Space>-buffers<Space>-query<Space>-<Space>

"==== VimFiler directory structure ====
" SPACE backtick to toggle
" SPACE ~ to open file tree from current buffer's dir
map ` :VimFiler -explorer<CR>
map ~ :VimFilerCurrentDir -explorer -find<CR>

"===== deoplete autocomplete ====
let g:deoplete#enable_at_startup = 1
"  inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>

"==== vim-sneak effcient moving ===
let g:sneak#s_next = 1
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
omap f <Plug>Sneak_f
omap F <Plug>Sneak_F

