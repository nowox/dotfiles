"      ___  _____  ____  _  _
"   ()/ __)(  _  )(_  _)( \( )()
"    ( (__  )(_)(  _)(_  )  (
" ()()\___)(_____)(____)(_)\_)()()
" An ultimate .vimrc
" Optimized to bring Vim closer to other modern editors.

"---------------------------------
" Plateform selection            |
"---------------------------------

" On which OS are we are ?
let s:is_windows = has("win16") || has("win32") || has("win64")|| has("win95")
let s:is_cygwin  = has('win32unix')
let s:is_macvim  = has('gui_macvim')

"---------------------------------
" Plugins                        |
"---------------------------------

" Start Vundle the package manager
filetype off                           " Required for Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'

" Easymotion
Plugin 'Lokaltog/vim-easymotion'        " Allow to move quickly using shortcuts
let g:EasyMotion_startofline = 0        " Keep cursor colum when JK motion
let g:EasyMotion_smartcase = 1          " Same as smartcase in vim
let g:EasyMotion_do_shade = 1           " Shade text to better see the keys
let g:EasyMotion_enter_jump_first = 1   " When search, jump directly on enter
let g:EasyMotion_do_special_mapping = 1 " {operator}<leader>l (select, yank, paste ...)
let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyz123456789'

Plugin 'bling/vim-airline'             " Best status line ever (needs Powerline Consolas font)
let g:airline_theme = 'coin'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

Plugin 'kien/ctrlp.vim'                " Sublime's <C-P> feature
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_cache_dir         = '~/.cache/ctrlp'
let g:ctrlp_switch_buffer     = 'e'
let g:ctrlp_cmd               = 'CtrlPMixed'
let g:ctrlp_match_window      = 'bottom,order:ttb,min:1,max:20,results:20'
let g:ctrlp_show_hidden       = 1
let g:ctrlp_max_files         = 2000
let g:ctrlp_max_depth         = 20
let g:ctrlp_follow_symblinks  = 1
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git|hg|svn)$',
            \ 'file': '\v\.(exe|so|dll|doj|bin|zip|tar|gz|iso|class|rar|swp|ldr|dpj|stk)$',
            \ 'link': 'some_bad_symbolic_links',
            \ }

Plugin 'scrooloose/nerdtree'           " File explorer
let g:NERDTreeDirArrows  = 1           " Show nice arrows instead of |+
let g:NERDTreeShowHidden = 1           " Show hidden files
let g:NERDTreeWinPos     = "left"      " Window position
let g:NERDTreeWinSize    = 50          " Width of the NERDTree sidebar

"Plugin 'xolox/vim-notes'               " Note taking
"Plugin 'xolox/vim-misc'                " Needed by vim-notes
"let g:notes_directories = ['~/.notes/']
"let g:notes_suffix      = '.txt'

Plugin 'terryma/vim-multiple-cursors'  " Sublime's multiple selection feature
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key  = '<C-m>'
let g:multi_cursor_start_key = '<C-m>'
let g:multi_cursor_quit_key  = '<Esc>'

Plugin 'nathanaelkane/vim-indent-guides'
let g:indent_guides_auto_colors = 1
let g:indent_guides_start_level = 2
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']
if s:is_windows
    let g:indent_guides_enable_on_vim_startup = 0
else
    let g:indent_guides_enable_on_vim_startup = 0
endif

Plugin 'dbakker/vim-projectroot'       " Set default path to root project by detecting .git for instance
au BufEnter * if &ft != 'help' | call ProjectRootCD() | endif

Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/vimshell.vim'
Plugin 'tpope/vim-fugitive'            " Git wrapper for vim

Plugin 'vim-scripts/LanguageTool'
let g:languagetool_jar='$HOME/languagetool/languagetool-commandline.jar'

Plugin 'fisadev/vim-ctrlp-cmdpalette'  " Command palette for ctrlp
Plugin 'chrisbra/NrrwRgn'              " Focus on selected regions, making the rest inaccessible
Plugin 'scrooloose/syntastic'          " Syntax checker
Plugin 'godlygeek/tabular'             " Select, then :Tabularize /= to align to equal sign
Plugin 'ervandew/supertab'
Plugin 'flazz/vim-colorschemes'        " A lot of colorschemes (including hybrid)

Plugin 'vim-scripts/VOoM'

"Plugin 'honza/vim-snippets'            " Snippets files for various programming languages
"Plugin 'sirver/ultisnips'              " Snipper plugin

Plugin 'airblade/vim-gitgutter'        " Show changed
let $GIT_DISCOVERY_ACROSS_FILESYSTEM=1

Plugin 'kana/vim-fakeclip'             " Allow to use clipboard under cygwin

Plugin 'majutsushi/tagbar'             " File tags browsing
let g:tarbar_left=1                    " I prefer having the Tagbar window to the left

" Binded to <F4>
Plugin 'mileszs/ack.vim'               " Use the Perl module App::Ack
Plugin 'scrooloose/nerdcommenter'      " Un/Comment lines

Plugin 'sjl/gundo.vim'                 " Visualize your Vim undo tree
Plugin 'terryma/vim-expand-region'     " Allow to visually select increasingly larger region of text

Plugin 'tpope/vim-surround'            " Easy delete, change on surroundings in pairs
Plugin 'tpope/vim-unimpaired'

Plugin 'vim-scripts/Align'             " Alignment at equal sign
Plugin 'vim-scripts/Txtfmt-The-Vim-Highlighter'
Plugin 'vim-scripts/ccase.vim'
Plugin 'mihaifm/bufstop'               " Easy way to switch buffers
Plugin 'vim-scripts/loremipsum'        " Insert Lipsum text
Plugin 'vim-scripts/taglist.vim'
Plugin 'vim-scripts/a.vim'             " Alternate quickly between .c <--> .h
Plugin 'vim-scripts/ZoomWin'           " <C-w>o get full screen then <C-w>o again will restore the windows. 

Plugin 'milkypostman/vim-togglelist'   " Allow to toggle quickfix and location list window
" Togglequickfix called by <F10>

"Plugin 'ciaranm/detectindent'          " Automatically detect indentation

"Plugin 'xolox/vim-easytags'            " To test

Plugin 'skammer/vim-css-color'
Plugin 'vim-scripts/bufkill.vim'

call vundle#end()

"---------------------------------
" Most important settings        |
"---------------------------------

" Not on Vi anymore
set nocompatible                       " be Vi iMproved

" Reenable filetypes
filetype plugin on                     " Enable Plugins
filetype indent on                     " Enable Automatic Indent

" Remap leader
let mapleader = ","                    " Use a more convenient leader key

" Vim's language
if s:is_windows && has('gui')
language messages en
endif

"---------------------------------
" Graphical interface            |
"---------------------------------

if s:is_windows
  set guifont=Powerline_Consolas:h9:cANSI
  set guioptions=                      " No menu, no toolbar, no scrollbars
else
  set guifont=Powerline\ Consolas\ 10
endif

syntax on                              " Enable Syntax
colorscheme hybrid                     " Best colorscheme ever

"---------------------------------
" Standard settings              |
"---------------------------------

" Shell, runtime and enviromnent
if s:is_windows && !s:is_cygwin
    set shell=c:\windows\system32\cmd.exe
    set runtimepath^=~/.vim
    cd ~
endif

" Encoding and filetypes
set encoding=utf-8
set ffs=unix,dos,mac                   " Default type UNIX then DOS then MAC
setglobal fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,latin1
if &termencoding == ""
    let &termencoding = &encoding
endif

" Mouse/Selection configuration (behave)
set mouse=a                            " Use mouse in All modes
set mousefocus                         " Activate windows on mouseover
set selectmode=mouse,key
set mousemodel=popup
set keymodel=startsel,stopsel
set selection=exclusive

" Interface (behavior)
set history=1000                       " Remember more commands and search history
set undolevels=1000                    " Keep a raisonnable undo
set scrolloff=7                        " Set the number of context lines to see above and below the cursor
set autoread                           " Set to auto read when a file is changed from the outside
set wildmenu                           " Command-line menu
set ruler                              " See number of lines
set cmdheight=2                        " Height of the command-line
set wildignore=*.o,*~,*.pyc,*.doj      " Ignore some files for wildmenu
set hidden                             " Not unload buffer when it is abandoned
set number                             " Show line number on the left
set whichwrap+=<,>,h,l                 " Allow to use arrow keys to move in Visual Mode
set virtualedit=all                    " Allow to place cursor at any location
set cursorline                         " Highlight current line
set writeany                           " Allow writing to any file with no need for "!" override
set backspace=eol,start,indent         " Allow backspacing over CR autoindent and start of insert
set helpheight=999
set winminheight=0

" Performances
set ttyfast                            " Send more chars to redraw in CTERM
set lazyredraw                         " Buffer screen updates instead of updating al the time
let loaded_matchparen = 1

" Alerts
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Search/Find/Replace
set hlsearch                           " No Highlight search results
let @/=""

set incsearch                          " Interactive search
set magic                              " Simplify usage of Regex
set showmatch                          " Show matching brackets
set ignorecase                         " Ignore case when searching
set smartcase                          " Override ignorecase if search contains upper chars
set mat=2                              " How many tenth of a second to blink when matching brackets

" Linebreak auto formatting
set linebreak                          " Break at a char in "breakat"
set autoindent                         " Copy indent form current line when starting a new line
set smartindent                        " Automatic indent after a line ending in { ...
set wrap                               " Automatic wrap long lines
set textwidth=100                      " A paragraph has a width of 100 chars
set formatoptions+=c                   " Auto-wrap comments using 'textwidth'
set formatoptions+=r                   " Automatically insert comment leader after <Enter> in insert mode
set formatoptions+=o                   " Automatically insert comment leader after "o"
set formatoptions+=q                   " Allow to reformat comments with "gq"
set formatoptions-=a                   " Automatically formatting paragraph
set formatoptions+=n                   " Recognize numbered lists and wrap correctly
set formatoptions+=j                   " Remove comment leader when joining lines.

" Indentation and tabs
set tabstop=4                          " How many spaces a tab worth
set expandtab                          " Insert spaces instead of tabs
set shiftwidth=4                       " Used for reindent operations
set softtabstop=4                      " How many columns are used when <Tab> is hit in insert mode
set smarttab                           " A <BS> will delete a space not a tab

" Enable folding
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent

" Split Windows
set splitright                         " New vertical split always at the right of the current window
set splitbelow                         " New horizontal split always at the bottom of the current window

" Backup behaviour
set nobackup                           " Disable backup
set noswapfile                         " Disable swap because sometime swapfile is in readonly

" Status line
set fillchars=vert:│                   " Separator for status window
set laststatus=2                       " Always the status of the last window
set showcmd                            " Show commands being typed in the bottom right corner

" Display unprintable chars
set list
set listchars=tab:▸\ "
set listchars+=extends:›
set listchars+=precedes:‹
set listchars+=nbsp:˽
set showbreak=⌐

" Auto complete setting
set completeopt=menuone,longest

"---------------------------------
" Mouse mapping                  |
"---------------------------------
if s:is_cygwin
    " <2-LeftMouse> Allow to select a word with a double click in cygwin
    inoremap <2-LeftMouse> <esc>viw

    " <3-LeftMouse> Allow to select the whole line
    inoremap <3-LeftMouse> <esc>V
endif


" <2-LeftMouse> Highlight the word under cursor
nnoremap <silent> <2-LeftMouse> :let @/='\V\<'.escape(expand('<cword>'), '\').'\>'<cr>:set hls<cr>

"---------------------------------
" Vim advanced mapping           |
"---------------------------------
" <c-6> Alternate file

" Correct cursor movement for long lines
noremap j gj
noremap k gk

" Disable highlight search
map     <silent> <leader><cr> :noh<cr>

" Backspace in Visual deletes selection
vnoremap <BS> d

" Backspace in Normal mode deletes a char
nnoremap <BS> X

" Shortcuts that put vim into insert mode
nnoremap <end> i<end>

" jk is back to normal mode
inoremap jk <esc><right>

map <c-space> ?

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" In the case sudo is needed
cmap w!! w !sudo tee % >/dev/null

" Dupplicate current line above or below
nnoremap <silent> [<space> :pu! _<cr>:']+1<cr>
nnoremap <silent> ]<space> :pu _<cr>:'[-1<cr>

" Switch to previous active buffer
nnoremap <silent> <C-l> :e #<cr>
inoremap <silent> <C-l> <esc>mO<C-C>:e #<cr>

" Current word highlight
noremap * mP*N`P

" Tag completion
inoremap <C-t> <C-x><c-]>

"---------------------------------
" Single char mapping            |
"---------------------------------

" <tab> Tabbing visual selection
vnoremap           <tab>   >gv
nnoremap           <tab>   >>
vnoremap           <s-tab> <gv
vnoremap           <s-tab> <<

" Search with <space>
map <space> /

" Use Q for formatting the current paragraph (or selection)
vnoremap           Q       gq
nnoremap           Q       gqap

" Go back to marker position (the swiss french keyboard sucks)
noremap            '       `

" Terminal redraw
noremap            §       :redraw<cr>

" Easymotion
nmap s <Plug>(easymotion-s)
vmap s <Plug>(easymotion-s)
nmap t <Plug>(easymotion-t)

"---------------------------------
" Control + Char mapping         |
"---------------------------------

" <c-Tab> Next buffer
nnoremap           <c-Tab> :bn<cr>
inoremap           <c-Tab> <C-o>:bn<cr>
cnoremap           <c-Tab> <C-c>:bn<cr>
onoremap           <c-Tab> <C-c>:bn<cr>

" <c-s-Tab> Previous buffer
"nnoremap           <c-s-Tab> :bp<cr>
"inoremap           <c-s-Tab> <C-o>:bp<cr>
"cnoremap           <c-s-Tab> <C-c>:bp<cr>
"onoremap           <c-s-Tab> <C-c>:bp<cr>

" <C-a> Select all (like every modern editor)
inoremap           <C-a>   <esc>ggVG
nnoremap           <C-a>        ggVG

" <C-b> Vim-ctrlP Buffer explorer with Ctrl-B
noremap            <C-b>        :CtrlPBuffer<cr>
inoremap           <C-b>   <C-o>:CtrlPBuffer<cr>
vnoremap           <C-b>   <C-c>:CtrlPBuffer<cr>

" <C-c> Copy
inoremap <silent>  <C-c> <esc>m`viw"+y``a
nnoremap <silent>  <C-c> <esc>m`viw"+y``
vnoremap           <C-c> "+y

" <C-d> Replace word under cursor (Delete A word)
inoremap <silent>  <C-d>   <C-c>"_ciw
nnoremap <silent>  <C-d>   "_ciw

" <C-e> Decrement the next number on the line
nnoremap <silent>  <C-e>   :<C-u>call AddSubtract("\<C-x>", '')<CR>

" <C-f> Search
nnoremap           <C-f>   /<C-u><C-r>=Escape(expand('<cword>'))<CR>
inoremap           <C-f>   <esc>/<C-u><C-r>=Escape(expand('<cword>'))<CR>
vnoremap           <C-f>   /<C-u><C-r>=GetVisualSelection()<CR>

" <C-g> Buffer switch (Previous buffer)
nnoremap <C-g> :bn<cr>
inoremap <C-g> <C-o>:bn<cr>


" <C-h> Replacement
nnoremap <C-h> :<C-u>%s/<C-r>=Escape(expand('<cword>'))<CR>//g<left><left>
inoremap <C-h> <esc>:%s/<C-r>=Escape(expand('<cword>'))<CR>//g<left><left>
vnoremap <C-h> :<C-u>%s/<C-r>=GetVisualSelection()<CR>//g<left><left>

" <C-i>
"-----------

" <C-j> Add an empty line below the cursor
nnoremap <silent> <C-j> m`o<esc>``
inoremap <silent> <C-j> <esc>m`o<esc>``a

" <C-k> Add an empty line above the cursor
nnoremap <silent> <C-k> m`O<esc>``
inoremap <silent> <C-k> <esc>m`O<esc>``a

" <C-l>

" <C-m> Multiple cursor
" [Mapping already set with the multiple-cursor plugin]

" <C-n>

" <C-o>

" <c-s-p> Vim-CtrlP-CmdPalette to immitate Sublime's behaviour
nnoremap           <c-s-p>  :CtrlPCmdPalette<cr>
inoremap           <c-s-p>  <C-O>:CtrlPCmdPalette<cr>
vnoremap           <c-s-p>  <C-C>:CtrlPCmdPalette<cr>

" <C-q> Blockwise visual mode
noremap            <C-q>    <C-v>

" <C-r>

" <C-s> Save
noremap            <C-s>    :update!<CR>
vnoremap           <C-s>    <C-c>:update!<CR>
inoremap           <C-s>    <C-o>:update!<CR>

" <C-S-s> Save as with gvim
"noremap            <C-S-s>    :browse w<CR>
"vnoremap           <C-S-s>    <C-c>:browse w<CR>
"inoremap           <C-S-s>    <C-o>:browse w<CR>

" <C-t>

" <C-u>

" <C-v> Paste
noremap            <C-v>    "+gP
cnoremap           <C-v>    <C-R>+
exe 'inoremap <script> <C-v> <C-g>u' . paste#paste_cmd['i']
exe 'vnoremap <script> <C-v> ' . paste#paste_cmd['v']

" <C-w> Window command (Split)
" Used to split vim's environmnent in multiple workspaces called windows.
"       <C-w>v   Vertical Split
"       <C-w>s   Horizontal Split
"       <C-w>o   Zoom (from plugin vim-zoom)
"       <C-w>n   New vertical split with an empty buffer
"       <C-w>^   Veritcal split with alternate buffer #
"       <C-w>q   Quit current window and exit vim if last window
"       <C-w>c   Close current window
"
"       <C-w>[jklh]  Move cursor to Nth window down/left/right/up
"       <C-w>j   Move cursor to Nth window below
"       :help split

"noremap  <C-w>     :BD<CR>

" <C-x> Cut
vnoremap <C-x>   "+x

" <C-y> Increment closest number
nnoremap <silent> <C-y> :<C-u>call AddSubtract("\<C-a>", '')<CR>

" <C-z> Undo
noremap           <C-z>    u
inoremap          <C-z>    <C-o>u

"---------------------------------
" F Function mapping             |
"---------------------------------

" Help in full screen
noremap  <F1>       :help<cr>:only<cr>
inoremap <F1>      <esc>:help<cr>:only<cr>

" File explorer (NERD Tree)
noremap  <silent> <F2> :NERDTreeToggle<CR>
inoremap <silent> <F2> <C-O>:NERDTreeToggle<CR>

" Taglist pane
noremap  <silent> <F3> :TlistToggle<CR>
vnoremap <silent> <F3> <C-C>:TlistToggle<CR>
inoremap <silent> <F3> <C-O>:TlistToggle<CR>

" Tagbar
noremap  <silent> <F4> :TagbarToggle<CR>
vnoremap <silent> <F4> <C-C>:TagbarToggle<CR>
inoremap <silent> <F4> <C-O>:TagbarToggle<CR>

" Toggle colorscheme
nnoremap <F8> :call NextColor(1)<CR>
nnoremap <S-F8> :call NextColor(-1)<CR>
nnoremap <A-F8> :call NextColor(0)<CR>

" Toggle menu
nnoremap <F9> :call ToggleFlag('guioptions','mrT')<cr>
inoremap <F9> <C-C>:call ToggleFlag('guioptions','mrT')<cr>

" Close quickfix window
noremap  <silent> <F10> :call ToggleQuickfixList()<CR>
vnoremap <silent> <F10> <C-C>:call ToggleQuickfixList()<CR>
inoremap <silent> <F10> <C-O>:call ToggleQuickfixList()<CR>

" Toggle numbers
noremap  <silent> <F11> :set nonu!<CR>
vnoremap <silent> <F11> <C-C>:set nonu!<CR>
inoremap <silent> <F11> <C-O>:set nonu!<CR>

" Remove trailing spaces
noremap  <silent> <F12> :FixWhitespace<CR>
vnoremap <silent> <F12> <C-C>:FixWhitespace<CR>
inoremap <silent> <F12> <C-O>:FixWhitespace<CR>

"---------------------------------
" Leader mapping                 |
"---------------------------------

" Save session
nnoremap <leader>s :mksession<cr>

" Edit vimrc
noremap <leader>v :edit ~/.vimrc<cr>
noremap <leader>V :source ~/.vimrc<cr>

" Close current buffer
map <leader>bd :Bclose<cr>

" Buffer mapping
noremap <leader>bn :bn<cr>
noremap <leader>bp :bp<cr>

" Useful mapping
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove<cr>

" Set path of current file
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" Switch between source files and beader files quickly
noremap <leader>h   :A<cr>

nmap <leader>d :bprevious<CR>:bdelete! #<CR>
" CtrlP Tag search
nnoremap <leader>. :CtrlPTag<cr>

" Ack search
noremap <leader>a  :Ack! <C-R><C-W><cr>
noremap <leader>A  :Ack! <C-R><C-W><cr>


" Leader Shortcuts
nmap <leader>w :w!<cr>

" Remap interrupt search command
noremap <C-u> <C-c>

" GitGutter
noremap <leader>gh  :GitGutterLineHighlightsToggle<cr>
noremap <leader>gg  :GitGutterToggle<cr>
noremap <leader>gj  :GitGutterNextHunk<cr>
noremap <leader>gk  :GitGutterPrevHunk<cr>
noremap <leader>ga  :GitGutterStageHunk<cr>
noremap <leader>gu  :GitGutterReverHunk<cr>
noremap <leader>gv  :GitGutterPreviewHunk<cr>

map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)


" ---------------------------------------------------------
" Plugins settings
" ---------------------------------------------------------


" Expand-region
" -------------
let g:expand_region_use_select_mode = 1


" Taglist
" -------
let g:Tlist_Auto_Highlight_Tag = 1
let g:Tlist_Auto_Update = 1
let g:Tlist_WinWidth = 50

" Utilsnips
" ---------
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<C-g>"

" Ultisnips
" ---------
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<C-b>"
let g:UltiSnipsJumpBackwardTrigger="<C-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" ---------------------------------------------------------
" Functions
" ---------------------------------------------------------
func! paste#Paste()
    let ove = &ve
    set ve=all
    normal! `^
    if @+ != ''
        normal! "+gP
    endif
    let c = col(".")
    normal! i
    if col(".") < c " compensate for i<ESC> moving the cursor left
        normal! l
    endif
    let &ve = ove
endfunc
"------------------------------------------------------------
" Autocommands
"------------------------------------------------------------

augroup configgroup
autocmd!
autocmd VimEnter * highlight clear SignColumn
autocmd FileType java setlocal noexpandtab
autocmd FileType java setlocal list
autocmd FileType java setlocal listchars=tab:+\ ,eol:-
autocmd FileType java setlocal formatprg=par\ -w80\ -T4
autocmd FileType php setlocal expandtab
autocmd FileType php setlocal list
autocmd FileType php setlocal listchars=tab:+\ ,eol:-
autocmd FileType php setlocal formatprg=par\ -w80\ -T4
autocmd FileType ruby setlocal tabstop=2
autocmd FileType ruby setlocal shiftwidth=2
autocmd FileType ruby setlocal softtabstop=2
autocmd FileType ruby setlocal commentstring=#\ %s
autocmd FileType python setlocal commentstring=#\ %s
autocmd BufEnter *.cls setlocal filetype=java
autocmd BufEnter *.zsh-theme setlocal filetype=zsh
autocmd BufEnter Makefile setlocal noexpandtab
autocmd BufEnter *.sh setlocal tabstop=2
autocmd BufEnter *.sh setlocal shiftwidth=2
autocmd BufEnter *.sh setlocal softtabstop=2
autocmd BufEnter *.asm setlocal filetype=asmsharc
autocmd BufEnter *.inc setlocal filetype=asmsharc
autocmd BufEnter *.mac setlocal filetype=asmsharc
autocmd BufEnter *.ldf setlocal filetype=c
autocmd BufEnter *.def setlocal filetype=c
augroup END
"------------------------------------------------------------
" Inline plugins
"------------------------------------------------------------

" Preserve cursor position when switch buffer
" -------------------------------------------
if v:version >= 700
    au BufLeave * let b:winview = winsaveview()
    au BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif
endif

" Show and remove extra trailing spaces
" -------------------------------------
highlight ExtraWhitespace ctermbg=55 guibg=#382424
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=55 guibg=red
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/

" The above flashes annoyingly while typing, be calmer in insert mode
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/

function! s:FixWhitespace(line1,line2)
    let l:save_cursor = getpos(".")
    silent! execute ':' . a:line1 . ',' . a:line2 . 's/\s\+$//'
    call setpos('.', l:save_cursor)
endfunction

" Run :FixWhitespace to remove end of line white space
command! -range=% FixWhitespace call <SID>FixWhitespace(<line1>,<line2>)

" Add/Substract value to a number
" -------------------------------
function! AddSubtract(char, back)
  let pattern = &nrformats =~ 'alpha' ? '[[:alpha:][:digit:]]' : '[[:digit:]]'
  call search(pattern, 'cw' . a:back)
  execute 'normal! ' . v:count1 . a:char
  silent! call repeat#set(":\<C-u>call AddSubtract('" .a:char. "', '" .a:back. "')\<CR>")
endfunction

" Automatic adjust quickfix window height
" ---------------------------------------
au FileType qf call AdjustWindowHeight(3, 20)
function! AdjustWindowHeight(minheight, maxheight)
    let l = 1
    let n_lines = 0
    let w_width = winwidth(0)
    while l <= line('$')
        " number to float for division
        let l_len = strlen(getline(l)) + 0.0
        let line_width = l_len/w_width
        let n_lines += float2nr(ceil(line_width))
        let l += 1
    endw
    exe max([min([n_lines, a:maxheight]), a:minheight]) . "wincmd _"
endfunction

" Toggle mouse between terminal and vim mode
" ------------------------------------------
fun! s:ToggleMouse()
    if !exists("s:old_mouse")
        let s:old_mouse = "a"
    endif

    if &mouse == ""
        let &mouse = s:old_mouse
        echo "Mouse is for Vim (" . &mouse . ")"
    else
        let s:old_mouse = &mouse
        let &mouse=""
        echo "Mouse is for terminal"
    endif
endfunction

let s:mycolors     = ['hybrid', 'eclipse', 'automation']
let s:airlinetheme = ['wombat', 'base16', 'base16']

" Improved Yank Mode
" ------------------
"nnoremap <expr> <C-c> MyYank()
"inoremap <expr> <C-c> MyYank()
"vnoremap <expr> <C-c> MyYank()

"nnoremap <expr> <C-v> MyPaste('n')
"nnoremap <C-v>    "+gP
"cnoremap           <C-v>    <C-R>+

" Not using numbered registers because they get rotated due to quote_number
" Instead. A indexed string is used to map <count> to a letter
let s:mapping = 'qwertzuiop'

fu! MyYank(...)
    " Get the register to yank in
    let l:count = v:count > len(s:mapping) ? 0 : v:count
    let l:regs = l:count ? l:mapping[l:count - 1] : '+'

    " Action depends on the current mode
    let l:currentmode = a:0 > 0 ? a:1 : mode()
    if l:currentmode == 'n'
        return 'm`viw"' . l:regs . 'y``'
    elseif l:currentmode == 'i'
        return "\e" . 'm`viw"' . l:regs . 'y``a'
    elseif l:currentmode == 'v'
        return '"' . l:regs . 'y'
    endif
endfu

fu! MyPaste(...)
    " Get the register to yank in
    let l:count = v:count > len(s:mapping) ? 0 : v:count
    let l:regs = l:count ? s:mapping[l:count - 1] : '+'

    " Action depends on the current mode
    let l:currentmode = a:0 > 0 ? a:1 : mode()
    if l:currentmode == 'n'
        return '"' . l:regs . 'P'
    elseif l:currentmode == 'i'
        return "\e" . 'm`viw"' . l:regs . 'y``a'
    elseif l:currentmode == 'v'
        return '"' . l:regs . 'y'
    endif
endfun

" Get Visual Selection
" --------------------
fu! GetVisualSelection()
  let old_reg = @v
  normal! gv"vy
  let raw_search = @v
  let @v = old_reg
  return substitute(escape(raw_search, '\/.*$^~[]'), "\n", '\\n', "g")
endfunction

" Escape special chars for a regexp search
" ----------------------------------------
function! Escape(stuff)
  return substitute(escape(a:stuff, '\/.*$^~[]'), "\n", '\\n', "g")
endfunction

" Next colorscheme
" ----------------
function! NextColor(how)
    call s:NextColor(a:how, 1)
endfunction

function! s:NextColor(how, echo_color)
    if exists('g:colors_name')
        let current = index(s:mycolors, g:colors_name)
    else
        let current = -1
    endif
    let missing = []
    let how = a:how
    for i in range(len(s:mycolors))
        let current += how
        if !(0 <= current && current < len(s:mycolors))
            let current = (how>0 ? 0 : len(s:mycolors)-1)
        endif
        try
            execute 'colorscheme '.s:mycolors[current]
            execute 'AirlineTheme '.s:airlinetheme[current]
            break
        catch /E185:/
            call add(missing, s:mycolors[current])
        endtry
    endfor
    redraw
    if len(missing) > 0
        echo 'Error: colorscheme not found:' join(missing)
    endif
    if (a:echo_color)
        echo g:colors_name
    endif
endfunction

function! ToggleFlag(option,flag)
    exec ('let lopt = &' . a:option)
    if lopt =~ (".*" . a:flag . ".*")
        exec ('set ' . a:option . '-=' . a:flag)
    else
        exec ('set ' . a:option . '+=' . a:flag)
    endif
endfunction

