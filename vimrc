  set encoding=utf-8
  syntax on
  filetype plugin indent on   " Needed  for  Nerd Commenter as well
  let mapleader = " "         " Changing default master key to space

  "256 color
  "if !has('gui_running')
    "set t_Co=256
    " set t_AB=^[[48;5;%dm
    " set t_AF=^[[38;5;%dm
  "endif 

  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  set termguicolors
  set background=dark
  "let base16colorspace=256

  set nomodeline
  set cursorline
  set nowrap
  set wildmenu
  set wildmode=longest:full,full
  set colorcolumn=80

" Except ... on  Markdown. Good stuff?
	autocmd FileType markdown setlocal wrap
" Adjust system undo levels
  set undolevels=100
" Use system clipboard
  set clipboard=unnamed
  "set clipboard=unnamedplus
  map <C-c> "+y<CR>           " CTRL+C   to copy in Vmode
" Set tab width and convert tabs to spaces
  set tabstop=2
  set softtabstop=2
  set shiftwidth=2
  set expandtab
  set smartindent
  "autocmd Filetype vimrc setlocal ts=2 sw=2 "expandtab
  "autocmd Filetype C setlocal  ts=3 sw=2
                  
" Don't let Vim hide characters or make loud dings
  set conceallevel=1
  set noerrorbells

" Number gutter
  set number
  set numberwidth=2
  
" Space above/beside cursor from screen edges
  set scrolloff=5
  set sidescrolloff=5

" Remaping Esc to jj
  inoremap jj <ESC>

  set ignorecase
  set smartcase

  set autoindent              " indent
  " set showmatch             " highlight matching brackets
  set autoread                " when file was changed
  set lazyredraw              " redraw only when we need to"
  set hlsearch                " highlight same words while searching with Shift + *
  "Ability to cancel a search with Escape (marcgg.com)
  nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>

" Removes the delay when hitting esc in insert mode
  set ttimeout
  set ttimeoutlen=1

" Automatically refresh changed files
  set autoread

" Wrap long lines
  nnoremap wl gggqG

" Redraw vim
  nnoremap rr :so $MYVIMRC \| checktime<CR>

" Highlight last inserted text
  nnoremap gV `[v`]

" Adding empty lines
  nnoremap <Leader>[  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[
  nnoremap <Leader>]  :<c-u>put =repeat(nr2char(10), v:count1)<cr>

" Moving current line
  nnoremap <Leader>m[  :<c-u>execute 'move -1-'. v:count1<cr>
  nnoremap <Leader>m]  :<c-u>execute 'move +'. v:count1<cr>


"  ========================= Plugin Manager ========================= 
"
call plug#begin('~/.config/nvim/plugged')

" Important?
  Plug 'Shougo/unite.vim'

" Visual
  Plug 'chriskempson/base16-vim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
" Plug 'itchyny/lightline.vim'
  Plug 'rakr/vim-one'
  Plug 'morhetz/gruvbox'

" Project - Navigation - Files
  Plug 'ctrlpvim/ctrlp.vim', { 'on': 'CtrlP' }
  Plug 'mhinz/vim-grepper'
  Plug 'Shougo/vimfiler.vim', { 'on': 'VimFiler' }
  Plug 'scrooloose/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'mileszs/ack.vim'

" Code help
  Plug 'tpope/vim-repeat'                 " repeat more commands with '.'
  Plug 'terryma/vim-multiple-cursors'     " multiple cursors like in ST

  " Plug 'Shougo/deoplete.nvim', { 'on': [], 'do': ':UpdateRemotePlugins', 'tag': 'e28d519' } " autocomplete, use e28d519 because of https://github.com/Shougo/deoplete.nvim/issues/291
  " Plug 'zchee/deoplete-clang'

  Plug 'Raimondi/delimitMate', { 'on': [] }   " closing brackets
  Plug 'terryma/vim-expand-region'            " change visual selection by using '+' / '-'
  Plug 'mbbill/undotree'                      " undo history tree
  Plug 'Yggdroot/indentLine'                  " indent columns
  Plug 'tpope/vim-surround'                   " better brackets
  Plug 'scrooloose/syntastic'                 " check syntax
  Plug 'matze/vim-move'
  Plug 'majutsushi/tagbar'

  "Plug 'w0rp/ale'
  Plug 'sheerun/vim-polyglot'
  Plug 'scrooloose/nerdcommenter'
  Plug 'ervandew/supertab'
  Plug 'valloric/youcompleteme'
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  Plug 'ryanoasis/vim-devicons'

" Movement
  Plug 'justinmk/vim-sneak'
  Plug 'easymotion/vim-easymotion'
  Plug 'yuttie/comfortable-motion.vim'

" Tmux
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'tmux-plugins/vim-tmux'
  Plug 'tmux-plugins/vim-tmux-focus-events'

" git
  Plug 'tpope/vim-fugitive'                   " git commands
  Plug 'airblade/vim-gitgutter'               " git gutter

call plug#end()

"  ========================= Configuration ========================= 
"
"
" Unite
  let g:unite_force_overwrite_statusline = 0
  let g:vimfiler_force_overwrite_statusline = 0
  let g:vimshell_force_overwrite_statusline = 0
  
" Disable mouse support
  set mouse=r
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" Next/Previous Buffer/Tab
  nnoremap <Tab> :bnext!<CR> 
  nnoremap <S-Tab> :bprev!<CR><Paste>

" Change arrow keys to resize panes
  nnoremap <Left> :vertical resize -1<CR>
  nnoremap <Right> :vertical resize +1<CR>
  nnoremap <Up> :resize -1<CR>
  nnoremap <Down> :resize +1<CR>

" Disable arrow keys completely in Insert Mode
  imap <up> <nop>
  imap <down> <nop>
  imap <left> <nop>
  imap <right> <nop>

" Set  ENTER to go new line without insert!
  nnoremap <cr> o<esc>

" Reload vim config /// github.com/ismay
  nnoremap <leader>r :source $MYVIMRC<CR>

" Clear search
  nnoremap <leader>c :let @/ = ""<CR>

" Select all
  nnoremap <leader>a ggVG<CR>

" Copy all
  nnoremap <leader>y ggVGy<CR>

" Colorschem
  "colorscheme base16-harmonic-dark

  colorscheme gruvbox

" Indent  line
  let g:indentLine_enabled = 1
  "let g:indentLine_char = "⟩"
  
" What  is this code below? 
  set laststatus=2
  set noshowmode              " remove extra default info from nvim

" " --- CtrlP -----------------------------
"
  nnoremap <Leader>p :CtrlP<CR>
  nnoremap <Leader>t :CtrlP<CR>

" use The Silver Searcher https://github.com/ggreer/the_silver_searcher
  "if executable('ag')
    " use Ag over Grep
    " set grepprg=ag\ --nogroup\ --nocolor
    " let g:ackprg = 'ag --nogroup --nocolor --column'
  "  let g:ackprg = 'ag --vimgrep'
  "endif
  
" --- Ag/Ack/Grep -----------------------
  if executable('ag')
    " use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor

    " define Ag command
    command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

    " bind \ to grep shortcut
    nnoremap \ :Ag<SPACE>
  endif

" --- VimGrepper ------------------------
"
" Find match in enter project and in current buffers
  nnoremap <Leader>fp :Grepper<Space>-query<Space>
  nnoremap <Leader>fb :Grepper<Space>-buffers<Space>-query<Space>-<Space>

" --- VimFiler 00------------------------
" SPACE backtick to toggle
" SPACE ~ to open file tree from current buffer's dir
  map ` :VimFiler -explorer<CR>
  map ~ :VimFilerCurrentDir -explorer -find<CR>

" --- Deoplete --------------------------
" let g:deoplete#enable_at_startup = 1

" Clang path for deoplete
"    let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
"    let g:deoplete#sources#clang#clang_header = '/usr/lib/clang'
"    let g:deoplete#sources#clang#std = 'c11'

" deoplete tab-complete
" inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" --- Vim-sneak -------------------------
"
  let g:sneak#s_next = 1
  nmap f <Plug>Sneak_f
  nmap F <Plug>Sneak_F
  xmap f <Plug>Sneak_f
  xmap F <Plug>Sneak_F
  omap f <Plug>Sneak_f
  omap F <Plug>Sneak_F

" --- Vim  easymotion -------------------
"
  let g:EasyMotion_smartcase = 1
  let g:EasyMotion_keys='qwertyuiopasdfghjklzxcvbnm'
  map <leader> <Plug>(easymotion-prefix)

" --- Nerdtree --------------------------
"
  let NERDTreeMapActivateNode='l'
  let NERDTreeMapCloseDir='h'
  let NERDTreeMapOpenSplit='<c-s>'
  let NERDTreeMapOpenVSplit='<c-v>'
  let NERDTreeMinimalUI = 1
  let NERDTreeAutoDeleteBuffer = 1
  let NERDTreeIgnore=['\.DS_Store', '\~$', '\.swp']
  nnoremap <leader>n :NERDTreeToggle<CR>

" --- Ale -------------------------------
"
  let g:ale_sign_error = '>>'
  let g:ale_sign_warning = '--'
  let g:ale_sign_column_always = 1
  let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']

" --- Comfortable motion ----------------
"
  let g:comfortable_motion_scroll_down_key = "j"
  let g:comfortable_motion_scroll_up_key = "k" 

" --- Gitgutter -------------------------
"
  "let g:gitgutter_sign_column_always = 1
  set signcolumn=yes
  let g:gitgutter_sign_added = '++'
  let g:gitgutter_sign_modified = '~~'
  let g:gitgutter_sign_removed = '__'
  let g:gitgutter_sign_removed_first_line = '¯¯'
  let g:gitgutter_sign_modified_removed = '~_'

" --- Tagbar ----------------------------
"
  nmap <leader>m :TagbarToggle<CR>

" --- Airline ---------------------------
"
  let g:airline_theme='one'
  let g:airline#extensions#tabline#enabled = 1
  let g:airline_powerline_fonts = 1

" --- Ultisnip --------------------------
"
" If you want :UltiSnipsEdit to split your window.
  let g:UltiSnipsEditSplit="vertical"

" Make YCM compatible with UltiSnips (using supertab)
  let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
  let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
  let g:SuperTabDefaultCompletionType = '<C-j>'

" Better key bindings for UltiSnipsExpandTrigger
  let g:UltiSnipsExpandTrigger = "<tab>"
  let g:UltiSnipsJumpForwardTrigger = "<tab>"
  let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" make sure this is the last line
  filetype plugin indent on
