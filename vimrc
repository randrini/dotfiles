  let mapleader =  " " " Changing default master key to space
        
  set encoding=utf8

" 256 color
  if !has('gui_running')
    set t_Co=256
    set t_AB=^[[48;5;%dm
    set t_AF=^[[38;5;%dm
  endif

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
  set softtabstop=0
  set shiftwidth=2
  set expandtab
  set smartindent
  autocmd Filetype vimrc setlocal ts=2 sw=2 "expandtab
                  
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
  " set showmatch         " highlight matching brackets
  set autoread          " when file was changed
  set lazyredraw        " redraw only when we need to"
  set hlsearch          " highlight same words while searching with Shift + *

" removes the delay when hitting esc in insert mode
  set ttimeout
  set ttimeoutlen=1

" automatically refresh changed files
  set autoread

" make line number brighter
  hi LineNr ctermfg=240 guifg=#ff0000

" wrap long lines
  nnoremap wl gggqG

" redraw vim
  nnoremap rr :so $MYVIMRC \| checktime<CR>

" Better Vim buffer/split navigation
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
  Plug 'chriskempson/base16-vim'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
  Plug 'itchyny/lightline.vim'

" Project - Navigation - Files
  Plug 'ctrlpvim/ctrlp.vim', { 'on': 'CtrlP' }
  Plug 'mhinz/vim-grepper'
  Plug 'Shougo/vimfiler.vim', { 'on': 'VimFiler' }
  Plug 'scrooloose/nerdtree'

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
"Plug 'w0rp/ale'
  Plug 'sheerun/vim-polyglot'
  Plug 'scrooloose/nerdcommenter'
" using deoplete - Plug 'valloric/youcompleteme'

" Movement
Plug 'justinmk/vim-sneak'

" Tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux'
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


  

colorscheme base16-harmonic-dark

"=========== indentLine settings =========
  let g:indentLine_enabled = 1
  "let g:indentLine_char = "⟩"

"=========== airline settings =========
"let g:airline#extensions#tabline#enabled=1
"let g:airline_powrline_fonts=1
"
"let g:lightline = {
"      \ 'colorscheme': 'powerline',
"      \ }
"
"  Lightline conf from main source
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

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0

set laststatus=2
set noshowmode " remove extra default info from nvim

" adding empty lines
nnoremap <Leader>[  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[
nnoremap <Leader>]  :<c-u>put =repeat(nr2char(10), v:count1)<cr>
" moving current line
nnoremap <Leader>m[  :<c-u>execute 'move -1-'. v:count1<cr>
nnoremap <Leader>m]  :<c-u>execute 'move +'. v:count1<cr>

" ----------------------------------- CtrlP --------------------------------
" SPACE t or SPACE p opens Fuzzy Finder
  nnoremap <Leader>p :CtrlP<CR>
  nnoremap <Leader>t :CtrlP<CR>

" -------------------- vim-grepper -----------------------------------
" SPACE f p to  type a search to find matches in entire
" project; SPACE f b in current buffers
nnoremap <Leader>fp :Grepper<Space>-query<Space>
nnoremap <Leader>fb :Grepper<Space>-buffers<Space>-query<Space>-<Space>

" ---------------------- VimFiler  ----------------------------------
" SPACE backtick to toggle
" SPACE ~ to open file tree from current buffer's dir
map ` :VimFiler -explorer<CR>
map ~ :VimFilerCurrentDir -explorer -find<CR>

" ------------------------------  Deoplete ---------------------------------
" let g:deoplete#enable_at_startup = 1

" Clang path for deoplete
"    let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
"    let g:deoplete#sources#clang#clang_header = '/usr/lib/clang'
"    let g:deoplete#sources#clang#std = 'c11'

" set wildmenu
syntax enable


" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

"==== vim-sneak effcient moving ===
let g:sneak#s_next = 1
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
omap f <Plug>Sneak_f
omap F <Plug>Sneak_F
