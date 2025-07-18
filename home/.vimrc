" Maintainer:
"       Amir Salihefendic — @amix3k
"
" Awesome_version:
"       Get this config, nice color schemes and lots of plugins!
"
"       Install the awesome version from:
"
"           https://github.com/amix/vimrc
"
" Sections:
"    -> General
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Moving around, tabs and buffers
"    -> Status line
"    -> Editing mappings
"    -> vimgrep searching and cope displaying
"    -> Spell checking
"    -> Misc
"    -> Helper functions
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = " "

" Fast saving
nmap <leader>w :w!<cr>

" :W sudo saves the file
" (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" my own setup
" -------------------- Close tags and brackets -----------
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
" inoremap < <><left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
:imap ii <Esc>
nnoremap <c-z> :u<CR>      " Avoid using this**
inoremap <c-z> <c-o>:u<CR>

" mouse setup
set cursorline
" -------------------- VIM SHORTCUTS --------------------------------
nnoremap <A-k> :m-2<CR>==
nnoremap <A-j> :m+<CR>==
nnoremap <C-S> :w!<CR>
set noreadonly
set noswapfile
set encoding=UTF-8

" Avoid garbled characters in Chinese language windows OS
let $LANG='en'
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Turn on the Wild menu
set wildmenu
set number
set relativenumber

" Ignore compiled files
set wildignore=.o,~,*.pyc
if has("win16") || has("win32")
  set wildignore+=.git\,.hg\,.svn\*
else
  set wildignore+=/.git/,/.hg/,/.svn/,*/.DS_Store
endif

" Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Properly disable sound on errors on MacVim
if has("gui_macvim")
  autocmd GUIEnter * set vb t_vb=
endif

" Add a bit extra margin to the left
set foldcolumn=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

" Set regular expression engine automatically
set regexpengine=0

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

try
  " colorscheme zaibatsu
  " colorscheme green
  colorscheme oceanic
catch
  colorscheme wildcharm
endtry

set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
  set guioptions-=T
  set guioptions-=e
  set t_Co=256
  set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=2
set tabstop=2

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

inoremap jk <Esc>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
  map <C-space> ?

  " Disable highlight when <leader><cr> is pressed
  map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext<cr>

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <C-r>=escape(expand("%:p:h"), " ")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr><my>mzgv`yo`z
vmap <M-k> :m'<-2<cr>>my<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  silent! %s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfun

if has("autocmd")
  autocmd BufWritePre .txt,.js,.py,.wiki,.sh,.coffee :call CleanExtraSpaces()
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scribble
map <leader>q :e ~/buffer<cr>

" Quickly open a markdown buffer for scribble
map <leader>x :e ~/buffer.md<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
function! HasPaste()
  if &paste
    return 'PASTE MODE  '
  endif
  return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
  let l:currentBufNum = bufnr("%")
  let l:alternateBufNum = bufnr("#")

  if buflisted(l:alternateBufNum)
    buffer #
  else
    bnext
  endif

  if bufnr("%") == l:currentBufNum
    new
  endif

  if buflisted(l:currentBufNum)
    execute("bdelete! ".l:currentBufNum)
  endif
endfunction

function! CmdLine(str)
  call feedkeys(":" . a:str)
endfunction

function! VisualSelection(direction, extra_filter) range
  let l:saved_reg = @"
  execute "normal! vgvy"

  let l:pattern = escape(@", "\\/.*'$^~[]")
  let l:pattern = substitute(l:pattern, "\n$", "", "")

  if a:direction == 'gv'
    call CmdLine("Ack '" . l:pattern . "' " )
  elseif a:direction == 'replace'
    call CmdLine("%s" . '/'. l:pattern . '/')
  endif

  let @/ = l:pattern
  let @" = l:saved_reg
endfunction

" Change cursor shape between insert and normal mode
if &term =~ '^xterm'
  " Use a thin vertical bar cursor in insert mode
  let &t_SI = "\e[5 q"
  " Use a solid block cursor in normal mode
  let &t_EI = "\e[2 q"
endif

" For terminal supporting DECSCUSR
if exists('$TMUX')
  " In TMUX, use these settings
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>[5 q\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>[2 q\<Esc>\\"
elseif &term =~ "screen"
  " For screen/tmux compatibility
  let &t_SI = "\<Esc>[5 q"
  let &t_EI = "\<Esc>[2 q"
endif

" ----
" Completion popup options
set completeopt=menuone,noinsert
set complete=b
" 
" Trigger only after 2+ characters typed
autocmd InsertCharPre * call AutoCompleteBuffer()
function! AutoCompleteBuffer()
  let col = col('.') - 1
  if col >= 2 && !pumvisible()
    call feedkeys("\<C-x>\<C-n>", "n")
  endif
endfunction

" Navigate popup with <C-j> and <C-k>

" Keymaps
" Set leader
let mapleader = " "

" Escape insert mode
inoremap jk <ESC>
vnoremap ii <ESC>

" Create a new tab with a new file
" nnoremap <leader>jf :tabnew | w<CR>

" Indent entire file
nnoremap ,a gg=G

" Fold selected code
vnoremap fc :fold<CR>

" Save file
nnoremap <leader>s :w<CR>

" Clear search highlights
nnoremap <leader>nh :nohl<CR>

" Delete without yanking
nnoremap x "_x
vnoremap x "_x

" Enable/disable system clipboard
" nnoremap <leader>mn :set clipboard=unnamedplus | echo 'clipboard enabled'<CR>
" nnoremap <leader>m, :set clipboard= | echo 'clipboard disabled'<CR>

" Find hovered word
nnoremap <leader>fw *

" Select all
nnoremap <C-a> ggVG

" Move lines up/down in normal mode
nnoremap <A-k> :m-2<CR>==
nnoremap <A-j> :m+<CR>==

" Move selected lines up/down
vnoremap <A-K> :m '<-2<CR>gv=gv
vnoremap <A-J> :m '>+1<CR>gv=gv

" Insert line from register 1 (like 'mm' in your config)
nnoremap mm :put 1<CR>

" Buffer navigation (if you're using multiple buffers manually)
nnoremap <A-2> :bnext<CR>
nnoremap <A-1> :bprevious<CR>
nnoremap <A-`> :bdelete<CR>

nnoremap <leader>w :bnext<CR>
nnoremap <leader>q :bprevious<CR>
nnoremap <leader>x :bdelete<CR>

" Quotes/Brackets wrapper
vnoremap " di"<ESC>pa"<ESC>x
vnoremap ` di`<ESC>pa`<ESC>x
vnoremap ' di'<ESC>pa'<ESC>x
vnoremap ( di(<ESC>pa)<ESC>x
vnoremap [ di[<ESC>pa]<ESC>x
vnoremap { di{<ESC>pa}<ESC>x

" Split windows
nnoremap <leader>sv <C-w>v
nnoremap <leader>sh <C-w>s
nnoremap <leader>se <C-w>=
nnoremap <leader>sx :close<CR>

" Resize windows
nnoremap f> :vertical resize +10<CR>
nnoremap f< :vertical resize -10<CR>
nnoremap g> :resize +3<CR>
nnoremap g< :resize -3<CR>

nnoremap <A-i> :vertical resize +10<CR>
nnoremap <A-s> :vertical resize -10<CR>
nnoremap <A-u> :resize +10<CR>
nnoremap <A-d> :resize -10<CR>

" Increment / Decrement
nnoremap + <C-a>
nnoremap - <C-x>

" Change without yanking
nnoremap ciw "_ciw
vnoremap c "_c

" Delete till EOL without yanking
nnoremap d$ "_d$
vnoremap d$ "_d$

" Change everything without yanking
nnoremap c "_c
vnoremap c "_c

" Focus mode toggles
nnoremap <leader>ef :set nonumber norelativenumber laststatus=0 showtabline=0<CR>
nnoremap <leader>df :set number relativenumber laststatus=2 showtabline=2<CR>

" Restore folds per file
augroup remember_folds
  autocmd!
  autocmd BufWinLeave * mkview 1
  autocmd BufWinEnter * silent! loadview 1
augroup END


" Normal mode: Toggle comment on current line
nnoremap gc :call ToggleCommentLine()<CR>

" Visual mode: Toggle comment on selected lines
vnoremap gc :call ToggleCommentVisual()<CR>

function! GetCommentSymbol()
  let ft = &filetype
  return get({
        \ 'c': '//',
        \ 'cpp': '//',
        \ 'java': '//',
        \ 'javascript': '//',
        \ 'typescript': '//',
        \ 'go': '//',
        \ 'rust': '//',
        \ 'python': '#',
        \ 'sh': '#',
        \ 'bash': '#',
        \ 'lua': '--',
        \ 'vim': '"',
        \ 'sql': '--',
        \ 'html': '<!--',
        \ 'xml': '<!--',
        \ }, ft, '#') " default to #
endfunction

function! ToggleCommentLine()
  let symbol = GetCommentSymbol()
  let line = getline('.')

  if symbol == '<!--'
    if line =~ '^\s*<!--'
      let line = substitute(line, '^\s*<!--\s*', '', '')
      let line = substitute(line, '\s*-->$', '', '')
    else
      let line = substitute(line, '^\s*', '\0<!-- ', '')
      let line .= ' -->'
    endif
  else
    if line =~ '^\s*' . escape(symbol, '#/.*~')
      let line = substitute(line, '^\(\s*\)' . escape(symbol, '#/.*~') . '\s*', '\1', '')
    else
      let line = substitute(line, '^\s*', '\0' . symbol . ' ', '')
    endif
  endif

  call setline('.', line)
endfunction

function! ToggleCommentVisual()
  let symbol = GetCommentSymbol()
  let start = line("'<")
  let end = line("'>")

  for lnum in range(start, end)
    let line = getline(lnum)

    if symbol == '<!--'
      if line =~ '^\s*<!--'
        let line = substitute(line, '^\s*<!--\s*', '', '')
        let line = substitute(line, '\s*-->$', '', '')
      else
        let line = substitute(line, '^\s*', '\0<!-- ', '')
        let line .= ' -->'
      endif
    else
      if line =~ '^\s*' . escape(symbol, '#/.*~')
        let line = substitute(line, '^\(\s*\)' . escape(symbol, '#/.*~') . '\s*', '\1', '')
      else
        let line = substitute(line, '^\s*', '\0' . symbol . ' ', '')
      endif
    endif

    call setline(lnum, line)
  endfor
endfunction

" Enable mouse support for navigation and resizing
set mouse=a

" Store swap and backup files in a dedicated directory
set backup
set writebackup
set swapfile
set backupdir=~/.vim/tmp/backup//,.
set directory=~/.vim/tmp/swap//,.
set undodir=~/.vim/tmp/undo//,.
set undofile " Persistent undo across sessions
if !isdirectory(expand('~/.vim/tmp/backup'))
  call mkdir(expand('~/.vim/tmp/backup'), 'p')
endif
if !isdirectory(expand('~/.vim/tmp/swap'))
  call mkdir(expand('~/.vim/tmp/swap'), 'p')
endif
if !isdirectory(expand('~/.vim/tmp/undo'))
  call mkdir(expand('~/.vim/tmp/undo'), 'p')
endif


" Completion popup options
"set completeopt=menuone,noinsert,noselect
"set complete=.,w,b,u,t,i " Include buffer, window, unloaded buffers, tags, and include files

" Trigger completion after 2+ characters, excluding comments
" autocmd InsertCharPre * call AutoCompleteBuffer()
" function! AutoCompleteBuffer()
"  let col = col('.') - 1
"  let line = getline('.')
"  if col >= 2 && !pumvisible() && line !~ '^\s*\/\/\|^\s*#' " Skip in comments
"    call feedkeys("\<C-n>", "n")
"  endif
"endfunction

inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

" Simplified status line
set laststatus=2
set statusline=%{HasPaste()}%f%m%r%h%w\ Line:%l\ Col:%c
