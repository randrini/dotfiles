  set  nocompatible
  syntax on
  let mapleader =  " "        " Changing default master key to space
  filetype plugin indent on   "Needed  for  Nerd Commenter as well
  set encoding=utf8

" 256 color
  if !has('gui_running')
    set t_Co=256
    set t_AB=^[[48;5;%dm
    set t_AF=^[[38;5;%dm
  endif

  set nomodeline
  set cursorline
  set nowrap
  set wildmenu
  set wildmode=longest:full,full

" Except ... on  Markdown. Good stuff?
	autocmd FileType markdown setlocal wrap
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
  autocmd Filetype vimrc setlocal ts=2 sw=2 "expandtab
  autocmd Filetype C setlocal  ts=3 sw=2
                  
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

  set autoindent        " indent
  " set showmatch         " highlight matching brackets
  set autoread          " when file was changed
  set lazyredraw        " redraw only when we need to"
  set hlsearch          " highlight same words while searching with Shift + *

" removes the delay when hitting esc in insert mode
  set ttimeout
  set ttimeoutlen=1

" automatically refresh changed files
  set autoread

" wrap long lines
  nnoremap wl gggqG

" redraw vim
  nnoremap rr :so $MYVIMRC \| checktime<CR>

" highlight last inserted text
  nnoremap gV `[v`]

" Adding empty lines
  nnoremap <Leader>[  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[
  nnoremap <Leader>]  :<c-u>put =repeat(nr2char(10), v:count1)<cr>

" Moving current line
  nnoremap <Leader>m[  :<c-u>execute 'move -1-'. v:count1<cr>
  nnoremap <Leader>m]  :<c-u>execute 'move +'. v:count1<cr>


"  ========================= Plugin Manager ========================= 
"
call plug#begin('~/.local/share/nvim/plugged')

" Important?
  Plug 'Shougo/unite.vim'

" Visual
  Plug 'chriskempson/base16-vim'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
  Plug 'itchyny/lightline.vim'

" Project - Navigation - Files
  Plug 'ctrlpvim/ctrlp.vim', { 'on': 'CtrlP' }
  Plug 'mhinz/vim-grepper'
  Plug 'Shougo/vimfiler.vim', { 'on': 'VimFiler' }
  Plug 'scrooloose/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'mileszs/ack.vim'

" Code help
  " Plug 'Valloric/YouCompleteMe'
  Plug 'tpope/vim-repeat'                                 " repeat more commands with '.'
  Plug 'terryma/vim-multiple-cursors'                     " multiple cursors like in ST

  " Plug 'Shougo/deoplete.nvim', { 'on': [], 'do': ':UpdateRemotePlugins', 'tag': 'e28d519' } " autocomplete, use e28d519 because of https://github.com/Shougo/deoplete.nvim/issues/291
  " Plug 'zchee/deoplete-clang'

  Plug 'Raimondi/delimitMate', { 'on': [] }               " closing brackets
  Plug 'terryma/vim-expand-region'                        " change visual selection by using '+' / '-'
  Plug 'mbbill/undotree'                                  " undo history tree
  Plug 'Yggdroot/indentLine'                              " indent columns
  Plug 'tpope/vim-surround'                               " better brackets
  Plug 'scrooloose/syntastic'                             " check syntax
  Plug 'matze/vim-move'

  "Plug 'w0rp/ale'
  Plug 'sheerun/vim-polyglot'
  Plug 'scrooloose/nerdcommenter'
  " Plug 'valloric/youcompleteme' For later  use

" Movement
  Plug 'justinmk/vim-sneak'
  Plug 'easymotion/vim-easymotion'
  Plug 'yuttie/comfortable-motion.vim'

" Tmux
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'tmux-plugins/vim-tmux'
  Plug 'tmux-plugins/vim-tmux-focus-events'

" git
  Plug 'tpope/vim-fugitive'                               " git commands
  Plug 'airblade/vim-gitgutter'                           " git gutter

call plug#end()

"  ========================= Configuration ========================= 
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

" Colorscheme
  colorscheme base16-harmonic-dark

" Indent  line
  let g:indentLine_enabled = 1
  "let g:indentLine_char = "⟩"
  
" What  is this code below? 
  set laststatus=2
  set noshowmode " remove extra default info from nvim


"  ========================= Lightline ========================= 
"let g:airline#extensions#tabline#enabled=1
"let g:airline_powrline_fonts=1
"
"let g:lightline = {
"      \ 'colorscheme': 'powerline',
"      \ }
"
let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ], ['ctrlpmark'] ],
      \   'right': [ [ 'syntastic', 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightlineFugitive',
      \   'filename': 'LightlineFilename',
      \   'fileformat': 'LightlineFileformat',
      \   'filetype': 'LightlineFiletype',
      \   'fileencoding': 'LightlineFileencoding',
      \   'mode': 'LightlineMode',
      \   'ctrlpmark': 'CtrlPMark',
      \ },
      \ 'component_expand': {
      \   'syntastic': 'SyntasticStatuslineFlag',
      \ },
      \ 'component_type': {
      \   'syntastic': 'error',
      \ },
      \ 'subseparator': { 'left': '|', 'right': '|' }
      \ }

function! LightlineModified()
  return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
  return &ft !~? 'help' && &readonly ? 'RO' : ''
endfunction

function! LightlineFilename()
  let fname = expand('%:t')
  return fname == 'ControlP' && has_key(g:lightline, 'ctrlp_item') ? g:lightline.ctrlp_item :
        \ fname == '__Tagbar__' ? g:lightline.fname :
        \ fname =~ '__Gundo\|NERD_tree' ? '' :
        \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
        \ &ft == 'unite' ? unite#get_status_string() :
        \ &ft == 'vimshell' ? vimshell#get_status_string() :
        \ ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
        \ ('' != fname ? fname : '[No Name]') .
        \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

function! LightlineFugitive()
  try
    if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
      let mark = ''  " edit here for cool mark
      let branch = fugitive#head()
      return branch !=# '' ? mark.branch : ''
    endif
  catch
  endtry
  return ''
endfunction

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightlineMode()
  let fname = expand('%:t')
  return fname == '__Tagbar__' ? 'Tagbar' :
        \ fname == 'ControlP' ? 'CtrlP' :
        \ fname == '__Gundo__' ? 'Gundo' :
        \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
        \ fname =~ 'NERD_tree' ? 'NERDTree' :
        \ &ft == 'unite' ? 'Unite' :
        \ &ft == 'vimfiler' ? 'VimFiler' :
        \ &ft == 'vimshell' ? 'VimShell' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! CtrlPMark()
  if expand('%:t') =~ 'ControlP' && has_key(g:lightline, 'ctrlp_item')
    call lightline#link('iR'[g:lightline.ctrlp_regex])
    return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
          \ , g:lightline.ctrlp_next], 0)
  else
    return ''
  endif
endfunction

let g:ctrlp_status_func = {
  \ 'main': 'CtrlPStatusFunc_1',
  \ 'prog': 'CtrlPStatusFunc_2',
  \ }

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
  let g:lightline.ctrlp_regex = a:regex
  let g:lightline.ctrlp_prev = a:prev
  let g:lightline.ctrlp_item = a:item
  let g:lightline.ctrlp_next = a:next
  return lightline#statusline(0)
endfunction

function! CtrlPStatusFunc_2(str)
  return lightline#statusline(0)
endfunction

let g:tagbar_status_func = 'TagbarStatusFunc'

function! TagbarStatusFunc(current, sort, fname, ...) abort
    let g:lightline.fname = a:fname
  return lightline#statusline(0)
endfunction

augroup AutoSyntastic
  autocmd!
  autocmd BufWritePost *.c,*.cpp call s:syntastic()
augroup END
function! s:syntastic()
  SyntasticCheck
  call lightline#update()
endfunction

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
  let g:gitgutter_sign_column_always = 1
  let g:gitgutter_sign_added = '++'
  let g:gitgutter_sign_modified = '~~'
  let g:gitgutter_sign_removed = '__'
  let g:gitgutter_sign_removed_first_line = '¯¯'
  let g:gitgutter_sign_modified_removed = '~_'
