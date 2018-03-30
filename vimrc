" My comprehensive .vimrc
" @author Yves Chevallier <nowox@x0x.ch>
" @date   2016-09-05 Mon 08:36 AM

" Clear all the settings. Very useful when the .vimrc is reloaded.
set all&

" Vim7 is still Vi compatible. Required to use the power of Vim.
set nocompatible

" Depending on the architecture (I am working on both Windows and Linux),
" I want different settings.
let s:is_windows = has("win16") || has("win32") || has("win64")|| has("win95")
let s:is_cygwin  = has('win32unix')

if s:is_windows
    let $VIM = $HOME."\\.vim"
    set runtimepath +=$VIM
endif

" Initiate the plugin manager Vundle
set runtimepath +=~/.vim/bundle/Vundle.vim

filetype off
call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'ap/vim-buftabline'
    Plugin 'tomasiser/vim-code-dark'
    Plugin 'terryma/vim-multiple-cursors'
    Plugin 'ervandew/supertab'
    Plugin 'junegunn/vim-easy-align'
    Plugin 'junegunn/limelight.vim'
    Plugin 'skywind3000/asyncrun.vim'
    Plugin 'mhinz/vim-grepper'
    Plugin 'easymotion/vim-easymotion'
    Plugin 'luochen1990/rainbow'
    Plugin 'bufkill.vim'
    Plugin 'ZoomWin'
    Plugin 'majutsushi/tagbar'
    Plugin 'Mark'
    Plugin 'junegunn/goyo.vim'
    Plugin 'ctrlpvim/ctrlp.vim'
    Plugin 'kana/vim-fakeclip'
    Plugin 'scrooloose/nerdtree'           " File explorer
    Plugin 'kshenoy/vim-signature'
    Plugin 'lilydjwg/colorizer'
    Plugin 'jpalardy/vim-slime'
call vundle#end()

let g:colorizer_startup=0

let g:rainbow_conf = {
\   'guifgs': ['CornflowerBlue', 'RosyBrown1', 'DeepSkyBlue', 'LightCyan', 'SeaGreen1', 'tan1'],
\   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta', 'lightred', 'lightyellow'],
\   'operators': '_,_',
\   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\   'separately': {
\       '*': {},
\       'tex': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\       },
\       'lisp': {
\           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
\       },
\       'vim': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\       },
\       'html': {
\           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\       },
\       'css': 0,
\   }
\}

let g:slime_target = "tmux"
let g:slime_dont_ask_default = 1
let g:slime_default_config = {"socket_name": "default", "target_pane": "2"}

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(doj|exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

let g:buftabline_show=1
let g:buftabline_separators=0
let g:buftabline_numbers=0

let g:goyo_width=100

" Multiple cursors
let g:multi_cursor_use_default_mapping=1

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

let g:limelight_default_coefficient = 0.9
let g:limelight_conceal_ctermfg = 238
nmap <silent> gl :Limelight!!<CR>
xmap gl <Plug>(Limelight)

let g:rainbow_active=1

let g:tagbar_iconchars = ['►', '▼'] " Set for consolas powerline

let g:fakeclip_terminal_multiplexer_type="tmux"

let g:airline_theme                      = 'codedark' " With brighter split separators
let g:airline#extensions#tabline#enabled = 1      " Allows to view windows/tabs
let g:airline_powerline_fonts            = 1      " Fancy fonts

let g:NERDTreeDirArrows  = 1           " Show nice arrows instead of |+
let g:NERDTreeShowHidden = 1           " Show hidden files
let g:NERDTreeWinPos     = "left"      " Window position
let g:NERDTreeWinSize    = 50          " Width of the NERDTree sidebar

" Shell and workarounds for Windows
" =================================
if s:is_windows
    set shell=C:/cygwin/bin/bash
    set shellcmdflag=--login\ -c
    set shellxquote=\"
endif

" History & Backup
" ================
" The command-lines entered are remembered in a history table. There are
" five tables: the ':' commands, the '/' search strings, the expressions,
" the input() lines and the debug commands. By default only 50 lines are
" remembered. A bigger history does not cost much and could be very useful
" to remember old and complicated commands used months ago.
set history=1000

" Allow an infinite number of changes than can be undone.
set undolevels=10000

" File encoding/type
" ==================
" On MS-DOS and MS-Windows, the default value is dos,unix. I prefer having
" the same on every platforms.
set fileformats=unix,dos

" Default encoding is latin1 which is now obsolete. It is recommended to set
" the default encoding to utf-8
set encoding=utf8
set termencoding=utf-8

" Open/Close/Backup
" =================
" Automatically reload the file when it has changed outside of Vim.
set autoread

" Ignore some files for expanding wildcards
set wildignore=*.o,*~,*.pyc,*.doj,*.exe

" Allow to have unsaved hidden buffers. Otherwise you need to :w it before :bn
set hidden

" Do not use swap files when editing
set noswapfile

" Do not use temporary files, prefer use a pipe
set noshelltemp

" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,n~/.viminfo

function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

" Presentation
" ============
" Dispaly the line numbers on the left side in relative mode and highlight
" the current line number on the cursor line.
set number
set relativenumber
set numberwidth=4

set helpheight=1000

" Display the current line, the current column and the percentage of the file
" on the bottom right of the screen like:    51,49    23%
set ruler
" Show information related to the current command on the last line of the
" screen. For example, it shows the number of lines selected
set showcmd

" Assign the terminal title to the current edited buffer name
set title

" Always display N lines at the top and the bottom of the window when
" scrolling.
set scrolloff=2

" Simplify the file messages
set shortmess=a

" Visually show the matching bracket when inserted
set showmatch

" Wrap long lines at a character in 'breakat' rather than at the last
" character that fits on the screen. Only valid when 'wrap' is set.
set linebreak

" Use special chars to show hidden chars when 'list' is enabled
set listchars=eol:$

" Use Powerline consolas on the GUI
set guifont=Powerline_Consolas:h11:cANSI

" Display the messages in english on the GUI (valid for French version of Windows)
if has('gui')
    language message en
    set guioptions=r
endif

" Increase the statusline size for lightline
set laststatus=2

set fillchars+=vert:│,stl:─

" Use DirectX instead of GTK for rendering glyphs
set rop=type:directx,gamma:1.0,contrast:0.5,level:1,geom:1,renmode:4,taamode:1

" Highlight the last good column (98 chars)
set colorcolumn=80

" Edition
" =======
" Allow the cursor to be positionned where there is no actual character. This
" option is useful to select a rectangle in block mode and easily move the cursor
" up and down.
set virtualedit=all

" By default, in insertion mode Vim refuses to backspace over indent or EOL.
" Is it a more modern way to use backspace anywhere.
" eol   Allow backspacing over line breaks
" start Allow backspacing over start of insertion
" indent Allow backspacing over autoindent
set backspace=eol,start,indent

" Remove the octal from the list of what Vim consider as number. Octal numbers
" are not really used anymore
set nrformats-=octal

" Set the maximum width of text that is being inserted.
set textwidth=100

" Copy indentation from current line when starting a new line
set autoindent

" Automatic indent after a line ending in { ...
set smartindent

" Auto formatting options
set formatoptions+=c " Only auto-wrap comments, insert comment leader automatically
set formatoptions+=r " Insert comment leader on <Enter> in insert mode
set formatoptions+=o " Insert comment leader after `o`
set formatoptions+=q " Allow formatting comments with gq
set formatoptions-=a " Automatically formatting paragraphs (comments only)
set formatoptions+=n " Recognize numbered lists from 'formatlistpat'
set formatoptions+=j " When it make sense, remove comment leader when joining lines
set formatoptions+=w " Use trailing space for the `a` option.

" Tabulation
set tabstop=4    " Number of spaces that a <Tab> in the file counts for
set expandtab    " Insert spaces instead of tabs
set shiftwidth=0 " Use the same value of 'tabstop' for autoindent and >>, <<
set smarttab     " <BS> delete a shiftwidth worth of space

" Use shift to start selection and a non-shifted key to stop selection
set keymodel=startsel,stopsel
set selection=exclusive

" Remove # and : from cinkeys to not reindent C preprocessor directives
" I feel it annoying when you want to indent your preprocessor directives or
" when you write dictionary in python.
set cinkeys-=0#
set cinkeys-=:

" Search/Find/Replace
" ===================
" Enable the interactive search. While typing a search command, show where the
" pattern, as it was typed so far, matches.
set incsearch

" Highlight the last search, and clear the last search highlight
set nohlsearch
let @/=""

" Use smart case search
set ignorecase
set smartcase

" VimGrep
if executable('ack')
    set grepprg=ack\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow\ $*
    set grepformat=%f:%l:%c:%m
endif
if executable('ag')
    set grepprg=ag\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow
    set grepformat=%f:%l:%c:%m
endif

" Enhancements
" ============
" Enhanced mode for the command-line completion
set wildmenu
cnoremap <Left> <Space><BS><Left>
cnoremap <Right> <Space><BS><Right>

" Performances
" ============
set ttimeoutlen=0       " Reduce the delay with <esc> when escaping from insert mode
set timeoutlen=200

" Indicates the terminal has a fast connection. More characters are sent to
" the screen for redrawing.
set ttyfast
set lazyredraw
set shortmess=aoA

if (has("termguicolors"))
    set termguicolors
endif

filetype plugin on
filetype indent on

set background=dark
colorscheme codedark
syntax on

" Mouse
" =====
" By default the mouse is only enabled on GUI, MS-DOS and Win32. Nowadays,
" there is no issues to have the mouse in SSH or on a terminal. This allow to
" use the mouse to move the cursor elsewhere on the screen
set mouse=a

" Allow to directly see the selection when dragging using the mouse. Otherwise,
" with xterm, the selection is displayed only when the mouse button is released.
set ttymouse=xterm2

" Prefer the select mode over the visual mode for the mouse
set selectmode=mouse,key

" Tmux
" ====
if &term =~ '256color' && exists('$TMUX')
    set ttymouse=xterm2
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
    execute "set <xHome>=\e[1;*H"
    execute "set <xEnd>=\e[1;*F"
    execute "set <Insert>=\e[2;*~"
    execute "set <Delete>=\e[3;*~"
    execute "set <PageUp>=\e[5;*~"
    execute "set <PageDown>=\e[6;*~"
    execute "set <xF1>=\e[1;*P"
    execute "set <xF2>=\e[1;*Q"
    execute "set <xF3>=\e[1;*R"
    execute "set <xF4>=\e[1;*S"
    execute "set <F5>=\e[15;*~"
    execute "set <F6>=\e[17;*~"
    execute "set <F7>=\e[18;*~"
    execute "set <F8>=\e[19;*~"
    execute "set <F9>=\e[20;*~"
    execute "set <F10>=\e[21;*~"
    execute "set <F11>=\e[23;*~"
    execute "set <F12>=\e[24;*~"

    " To allow italic (https://github.com/tmux/tmux/issues/450)
    let &t_ZH="\e[3m"
    let &t_ZR="\e[23m"

    set t_ut=
endif


" Shortcuts Mapping
" =================
" These shortcuts mapping are simple remapping that make the use of Vim
" easier. For example, the leader is mapped on : which requires to use the
" shift key. The , char is more convenient.
let mapleader = ","

" The <space> key is large easily accessible and not very useful in normal
" mode. It's normal behavior is the same as the `l` key. However it is fairly
" useful to use it as the forward search trigger.
nmap <space> /

inoremap <silent> jj <C-c>:stopinsert<cr>l

noremap - :

" Faster to reach with a Swiss keyboard:
noremap '' ``

" Use Q for formatting the current paragraph (or selection)
vnoremap Q gq
nnoremap Q gqap

" In visual mode arrows don't work as expected
vmap <Up> gk
vmap <Down> gj
vmap <Left> h
vmap <Right> l

" Less Confusing Mapping
" ======================
" Correct the cursor movement for long lines. When a long line is wrapped, `j` and `k` move across
" the real line, not the wrapped parts. With this, the cursor always move to the character right
" above or below the current one.
noremap j gj
noremap k gk

" Home and End go across the line
noremap <Home> ^
noremap <End> g_l
inoremap <Home> <C-o>^
inoremap <End>  <C-o>g_<C-o>l

" Backspace acts the same as `h` in normal mode. I think <BS> should work the
nnoremap <silent> <BS> :call Backspace()<cr>
vnoremap <BS> <Delete>
function! Backspace()
    if virtcol('.') == 1
        normal! ddk$l
    else
        normal! X
    endif
endfunction

" For the same reason as above, the enter key should work in the same way as other editors. There
" is no point to use it as `j`. When I hit enter that mean I quickly want to insert a new line and
" start inserting.
"
" /!\ Conflict with quickfix...
"noremap <cr> i<cr>

" The <End> key moves the cursor at the end of the line, so the cursor is on the last character,
" not the blank char right after it. This behavior is perfectly correct, but confusing regarding
" other editors. When virtualedit is enabled it is possible to trick <End> to move one char after
" the end of the line. So this requires virtualedit to be set to all.
map <C-Up> ddkP

" Although the arrow keys should not be used in vim, their usage can be enhanced by using Ctrl +
" Up/Down to bubble the line up and down. And of course this enhancement has to work in all modes,
" and for multiline too.
nnoremap <End> $l

" Line bubbling. When you want to move the current line or selection below or after the
" surrounding lines.
nmap <silent> <C-Down> :call BubbleDown()<cr>
nmap <silent> <C-Up>   :call BubbleUp()<cr>
imap <silent> <C-Up>   <C-o>:call BubbleUp()<cr>
imap <silent> <C-Down> <C-o>:call BubbleDown()<cr>
vmap <silent> <C-Up> xkP`[V`]
vmap <silent> <C-Down> xp`[V`]

function! BubbleUp()
    let l:col = virtcol('.')
    normal! ddkP
    execute 'normal! '.l:col.'|'
endfunction

function! BubbleDown()
    let l:col = virtcol('.')
    normal! ddp
    execute 'normal! '.l:col.'|'
endfunction

" In Select mode arrows keys cancel the selection. This is the expected behavior in a modern text
" editor.
snoremap <Up>    <esc><Up>
snoremap <Down>  <esc><Down>
snoremap <Left>  <esc><Left>
snoremap <Right> <esc>
snoremap <End>   <esc>
snoremap <Home>  <esc>

" Use <tab> and <C-Tab> to indent the current line or selection.
nnoremap <Tab>   >>
nnoremap <S-Tab> <<
xnoremap <Tab>   >gv
xnoremap <S-Tab> <gv
snoremap <Tab>   <C-g>>gv<C-g>
snoremap <S-Tab> <C-g><gv<C-g>

" Control + char mappings
" =======================

" <C-a> Select all
" default: Add count to number at or after the cursor
" This default mapping is not used very often an can easily be remapped to a more complex
" mapping sequence.
inoremap <C-a> <C-c>ggVG$
noremap <C-a> <C-c>ggVG$

" <C-b>
" default: back (up) one screen

" <C-c> Copy/Yank word/selection
" default: Interrupt current command
inoremap <C-c> <esc>m`viw"+y``a
nnoremap <C-c> m`viw"+y``
vnoremap <C-c> "+y

" <C-d> Replace the word under cursor and do not yank it
" default: delete one shiftwidth of indent on the current line
" As indent/deindent is mapped to <C-Tab> <C-S-Tab> as most text editors,
" this mapping can be remapped to something else.
"
" I feel very useful to quickly delete a word and replace it with something else
" typing <C-o>ciw is much longer than use one CTRL + char
inoremap <C-d> <C-c>ciw
nnoremap <C-d> ciw

" <C-e>
" default: insert the character which is below the cursor
" I never used this mapping and I don't know where it can be useful.
inoremap <C-e> <C-o>vwx
nnoremap <C-e> vwx

" <C-f> Find word under cursor or selection
" default: Scroll window forward (page-down button)
" Scrolling page-up/down is quicker by using the Page-Up/Page-Down keys.
" Most of the editors uses <C-f> to start the find/search dialog. As there is no
" find selection or find word under cursor default mapping, this is a good one.
nnoremap <c-f> /<C-u><C-r>=Escape(expand('<cword>'))<CR>
inoremap <c-f> <esc>/<C-u><C-r>=Escape(expand('<cword>'))<CR>
vnoremap <c-f> /<C-u><C-r>=GetVisualSelection=()<CR>

function! GetVisualSelection()
    let old_reg = @v
    normal! gv"vy
    let raw_search = @v
    let @v = old_reg
    return substitute(escape(raw_search, '\/.*$^~[]'), "\n", '\\n', "g")
endfunction

function! Escape(stuff)
    return substitute(escape(a:stuff, '\/.*$^~[]'), "\n", '\\n', "g")
endfunction

" <C-g> Fill until the end of the previous line with the char before cursor
" default: print the current filename or line down to column where inserting started
" inoremap <C-g> <Esc>ylm`k$j

" <C-h> Scroll one line up
" default: same as backspace
noremap <C-h> <C-y>
inoremap <C-h> <C-c><C-y>

" <C-i> (cannot be mapped, restriction of Vim)

" <C-j> Page Down
noremap <C-j> <C-f>
inoremap <C-j> <C-c><C-f>

" <C-k> Page Up
noremap <C-k> <C-b>
inoremap <C-k> <C-c><C-b>

" <C-l> Next cursor location
noremap <C-l> <C-e>
inoremap <C-l> <C-c><C-e>

" <C-m> (cannot bemapped, restriction of Vim)

" <C-n>
" default: Keyword completion for character in front of the cursor

" <C-p> CtrlP Files
" default: Find previous match in front of the cursor (inverse of C-n)

" <C-q>
" default: Insert non-digit literally

" <C-r>
" default: Redo in normal mode or insert the content of a register in insert mode

" <C-s> Save the current buffer if it was modified
noremap  <C-s> :update!<CR>
vnoremap <C-s> <C-c>:update!<CR>
inoremap <C-s> <C-o>:update!<CR>

" <C-t> Tag completion (Ctags)
inoremap <C-t> <C-x><C-]>

" <C-u> Next cursor location
" default: Delete all entered characters in the current line
nnoremap <C-u> <C-i>
inoremap <C-u> <C-i>


" <C-v> Paste content of "+ (clipboard)
" default: insert next non-digit literally
" The default value can be remapped because it is the same as <C-q>
noremap  <C-v> "+gP
cnoremap <C-v> <C-R>+
exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']

" <C-x> Cut word/selection
inoremap <C-x> <C-c>diw
nnoremap <C-x> diw
vnoremap <C-x> "+x

" <C-z> default: Suspend Vim
" Suspend and goes to the shell. Can come back with `fg`.

" <C-Home> Real start of the line
inoremap <C-Home> <C-c>0i
nnoremap <C-Home> 0
vnoremap <C-Home> 0

" <C-Tab>, <C-S-Tab> Next/Previous buffer
if s:is_cygwin
    " <C-Tab> Next buffer
    set <f26>=[1;5I
    map <silent> <f26> :bn!<cr>
    imap <silent> <f26> <esc>:bn!<cr>a
    vmap <silent> <f26> <c-c>:bn!<cr>

    " <C-S-Tab> Previous buffer
    set <f27>=[1;6I
    map <silent> <f27> :bp!<cr>
    imap <silent> <f27> <esc>:bp!<cr>a
    vmap <silent> <f27> <c-c>:bp!<cr>
else

    " For Xterm, the .Xresources must contain:
    " xterm*VT100.Translations: #override \
    "   Ctrl ~Shift <Key>Tab: string(0x1b) string("[27;5;9~") \n\
    "   Ctrl Shift <Key>Tab: string(0x1b) string("[27;6;9~")

    " <C-Tab> Next buffer
    set <f26>=[27;5;9~
    map <silent> <f26> :bn!<cr>
    imap <silent> <f26> <esc>:bn!<cr>a
    vmap <silent> <f26> <c-c>:bn!<cr>

    " <C-S-Tab> Previous buffer
    set <f27>=[27;6;9~
    map <silent> <f27> :bp!<cr>
    imap <silent> <f27> <esc>:bp!<cr>a
    vmap <silent> <f27> <c-c>:bp!<cr>
endif

" Meta + char mappings
" ====================
" <A-j> Move screen down one line
set <f32>=j
noremap <f32> <C-y>j
inoremap <f32> <C-y><C-o>j

" <A-k> Move screen up one line
set <f33>=k
noremap <f33> <C-e>k
inoremap <f33> <C-e><C-o>k

" Function keys
" =============

" <F1> File explorer (NERD Tree)
noremap  <silent> <F1> :NERDTreeToggle<CR>
inoremap <silent> <F1> <c-O>:NERDTreeToggle<CR>

" <F4> Tagbar
noremap  <silent> <F4> :TagbarToggle<CR>
vnoremap <silent> <F4> <c-C>:TagbarToggle<CR>
inoremap <silent> <F4> <c-O>:TagbarToggle<CR>

" Leader mappings
" ===============

" <leader>d Delete and close the current buffer
noremap <leader>d :BD<cr>
inoremap <leader>d <C-c>:BD<cr>

" <leader>s Toggle Spelling
noremap <leader>s :setlocal spell! spelllang=en_us<CR>
inoremap <leader>s <C-\><C-O>:setlocal spelllang=en_us spell! spell?<CR>

" <leader>v Edit my .vimrc
noremap <silent> <leader>v :edit ~/.vimrc<cr>

" <leader>V Reload my .vimrc
noremap <silent> <leader>V :source ~/.vimrc<cr>

" <leader>w Toggle word wrap
noremap <silent> <leader>w :set wrap!<cr>

" <leader>u Underline the current line
noremap <silent> <leader>u yyp<C-v>$r-
inoremap <silent> <leader>u <Esc>yyp<C-v>$r-A

" <leader><Space> Skip trailing spaces
noremap <silent> :call <SID>StripTrailingWhitespaces()<CR>
inoremap <silent> :call <Esc><SID>StripTrailingWhitespaces()<CR>a

" Mouse binding
" =============

"mouse visual block (ala MS Word)
nmap <C-LeftMouse> <LeftMouse><C-Q>
vmap <C-LeftDrag> <LeftDrag>
imap <C-LeftMouse> <LeftMouse><C-O><C-Q>
vmap <C-LeftMouse> <Esc><LeftMouse><C-Q>

noremap <silent> <2-RightMouse> :let @/='\V\<'.escape(expand('<cword>'), '\').'\>'<cr>:set hls<cr>

" Dynamic abbreviations
" =====================

" xxfile
" Automatically insert the filename
ab xxfile <C-r>=Filename()<CR>
fun! Filename()
    return expand("%:t")
endfun

" xxdate
" Automatically insert the current date
ab xxdate <C-r>=DateTime(0)<CR>

" xxtodo
ab xxtodo <C-r>TODO: <YCH =DateTime(1)><CR>

fun! DateTime(short)
    if a:short
        return strftime("%Y%m%d")
    else
        return strftime("%Y-%m-%d %a %I:%M %p")
    endif
endfun

" File specific
" =============
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
        let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd FileType vim,c,cpp,java,php,ruby,python,asm,yml,ini
    \ autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" ## Insert Gates {{{2
function! s:insert_gates()
  let gatename = substitute(toupper(expand("%:t")), "\\.", "_", "g")
  execute "normal! i#ifndef " . gatename
  execute "normal! o#define " . gatename . " "
  execute "normal! Go#endif /* " . gatename . " */"
  normal! kk
endfunction
autocmd BufNewFile *.{h,hpp} call <SID>insert_gates()

" Close vim if NERDTree is the last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

augroup configgroup
    autocmd!
    autocmd BufEnter *.{asm,inc} setlocal filetype=asmsharc
    autocmd BufEnter *.{def,cseq} setlocal filetype=c
augroup END

" Cusror change (block, line)
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

" Improve escape time when using with mintty
" /!\ The following causes some weird errors when exiting from some modes such as multiple cursor
"let &t_ti.="\e[?7727h"
"let &t_te.="\e[?7727l"
"noremap <Esc>O[ <Esc>
"noremap! <Esc>O[ <Esc>

map <Leader> <Plug>(easymotion-prefix)
