"      ___  _____  ____  _  _
"   ()/ __)(  _  )(_  _)( \( )()
"    ( (__  )(_)(  _)(_  )  (
" ()()\___)(_____)(____)(_)\_)()()
" My Own Ultimate .vimrc

"---------------------------------
" Plateform selection            |
"---------------------------------

" On which OS are we are ?
let s:is_windows = has('win32') || has('win64')
let s:is_cygwin  = has('win32unix')
let s:is_macvim  = has('gui_macvim')

if s:is_windows && !s:is_cygwin
    cd ~/
    set shell=c:\windows\system32\cmd.exe
    set runtimepath^=~/.vim
endif

"---------------------------------
" Plugins                        |
"---------------------------------

" Start Vundle the package manager
filetype off                           " Required for Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'

" Load other vim extensions
Plugin 'Lokaltog/vim-easymotion'       " Allow to move quickly using shortcuts
Plugin 'haya14busa/vim-easyoperator-line'
Plugin 'godlygeek/tabular'             " Align to = for example
Plugin 'bling/vim-airline'             " Best status line ever (needs Powerline Consolas font)
Plugin 'ervandew/supertab'
Plugin 'fisadev/vim-ctrlp-cmdpalette'  " Command palette for ctrlp
Plugin 'flazz/vim-colorschemes'        " A lot of colorschemes (including hybrid)
Plugin 'honza/vim-snippets'            " Snippets files for various programming languages
"    Plugin 'sirver/ultisnips'              " Snipper plugin
Plugin 'dbakker/vim-projectroot'       " Set default path to root project by detecting .git for instance
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'airblade/vim-gitgutter'        " Show changed
Plugin 'kana/vim-fakeclip'             " Allow to use clipboard under cygwin
Plugin 'kien/ctrlp.vim'                " Sublime's <c-P> feature
Plugin 'majutsushi/tagbar'             " File tags browsing
Plugin 'mileszs/ack.vim'               " Use the Perl module App::Ack
Plugin 'scrooloose/nerdcommenter'      " Un/Comment lines
Plugin 'scrooloose/nerdtree'           " File explorer
Plugin 'sjl/gundo.vim'                 " Visualize your Vim undo tree
Plugin 'terryma/vim-expand-region'     " Allow to visually select increasingly larger region of text
Plugin 'terryma/vim-multiple-cursors'  " Sublime's multiple selection feature
Plugin 'tpope/vim-fugitive'            " Git wrapper for vim
Plugin 'tpope/vim-surround'            " Easy delete, change on surroundings in pairs
Plugin 'vim-scripts/Align'             " Alignment at equal sign
Plugin 'vim-scripts/Txtfmt-The-Vim-Highlighter'
Plugin 'vim-scripts/ccase.vim'
Plugin 'mihaifm/bufstop'               " Easy way to switch buffers
Plugin 'vim-scripts/loremipsum'        " Insert Lipsum text
Plugin 'vim-scripts/taglist.vim'
Plugin 'vim-scripts/a.vim'             " Alternate quickly between .c <--> .h
Plugin 'vim-scripts/ZoomWin'           " <c-w>o full screen split
Plugin 'milkypostman/vim-togglelist'   " Allow to toggle quickfix and location list window

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

"---------------------------------
" Graphical interface            |
"---------------------------------
behave mswin

if s:is_windows
  set guifont=Powerline_Consolas:h9:cANSI
  winpos 0 0                           " Always start vim form the top left corner of the screen
  win 120 75                           " Windows size
  set guioptions=                      " No menu, no toolbar, no scrollbars
else
  set guifont=Powerline\ Consolas\ 10
endif

syntax on                              " Enable Syntax
colorscheme hybrid                     " My colorscheme

"---------------------------------
" Standard settings              |
"---------------------------------

" Encoding and filetypes
set encoding=utf-8
set ffs=unix,dos,mac                   " Default type UNIX then DOS then MAC
setglobal fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,latin1
if &termencoding == ""
    let &termencoding = &encoding
endif

" Mouse configuration
set mouse=a                            " Use mouse in All modes
set mousefocus                         " Activate windows on mouseover

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
set hlsearch                           " Highlight search results
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

" <2-LeftMouse> Allow to select a word with a double click in cygwin
if !has('gui')
    inoremap <2-LeftMouse> <esc>viw<right>
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
map <c-j> <c-W>j
map <c-k> <c-W>k
map <c-h> <c-W>h
map <c-l> <c-W>l

" In the case sudo is needed
cmap w!! w !sudo tee % >/dev/null

" Dupplicate current line above or below
nnoremap <silent> [<space> :pu! _<cr>:']+1<cr>
nnoremap <silent> ]<space> :pu _<cr>:'[-1<cr>

" Switch to previous active buffer
nnoremap <silent> <c-l> :e #<cr>
inoremap <silent> <c-l> <esc>mO<c-C>:e #<cr>

" Current word highlight
noremap * mP*N`P

" Tag completion
inoremap <c-t> <c-x><c-]>

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

"---------------------------------
" Control + Char mapping         |
"---------------------------------

" <c-Tab> Next buffer
nnoremap           <c-Tab> :bn<cr>
inoremap           <c-Tab> <c-o>:bn<cr>
cnoremap           <c-Tab> <c-c>:bn<cr>
onoremap           <c-Tab> <c-c>:bn<cr>

" <c-s-Tab> Previous buffer
nnoremap           <c-s-Tab> :bp<cr>
inoremap           <c-s-Tab> <c-o>:bp<cr>
cnoremap           <c-s-Tab> <c-c>:bp<cr>
onoremap           <c-s-Tab> <c-c>:bp<cr>

" <c-a> Select all (like every modern editor)
inoremap           <c-a>   <esc>ggVG
nnoremap           <c-a>        ggVG

" <c-b> Vim-ctrlP Buffer explorer with Ctrl-B
noremap            <c-b>        :CtrlPBuffer<cr>
inoremap           <c-b>   <c-o>:CtrlPBuffer<cr>
vnoremap           <c-b>   <c-c>:CtrlPBuffer<cr>

" <c-c> Copy
"  - Copy word under cursor if no selection
"  - Copy selection
inoremap <silent>  <c-c> <esc>m`viw"+y``a
nnoremap <silent>  <c-c> <esc>m`viw"+y``
vnoremap           <c-c> "+y

" <c-d> Replace word under cursor (Delete A word)
inoremap <silent>  <c-d>   <c-c>"_ciw
nnoremap <silent>  <c-d>   "_ciw

" <c-e> Decrement the next number on the line
nnoremap <silent>  <c-e>   :<c-u>call AddSubtract("\<c-x>", '')<CR>

" <c-f> Search
nnoremap           <c-f>   /<C-u><C-r>=Escape(expand('<cword>'))<CR>
inoremap           <c-f>   <esc>/<C-u><C-r>=Escape(expand('<cword>'))<CR>
vnoremap           <c-f>   /<C-u><C-r>=GetVisualSelection()<CR>

" <c-g> Buffer switch (Previous buffer)
nnoremap <c-g> :bn<cr>
inoremap <c-g> <c-o>:bn<cr>
vnoremap <c-g> <c-c>:bn<cr>

" <c-h> Replacement
nnoremap <c-h> :<C-u>%s/<C-r>=Escape(expand('<cword>'))<CR>//g<left><left>
inoremap <c-h> <esc>:%s/<C-r>=Escape(expand('<cword>'))<CR>//g<left><left>
vnoremap <c-h> :<C-u>%s/<C-r>=GetVisualSelection()<CR>//g<left><left>

" <c-j> Add an empty line below the cursor
nnoremap <silent> <c-j> m`o<esc>``
inoremap <silent> <c-j> <esc>m`o<esc>``a

" <c-k> Add an empty line above the cursor
nnoremap <silent> <c-k> m`O<esc>``
inoremap <silent> <c-k> <esc>m`O<esc>``a

" <c-s-p> Vim-CtrlP-CmdPalette to immitate Sublime's behaviour
nnoremap           <c-s-p>  :CtrlPCmdPalette<cr>
inoremap           <c-s-p>  <c-O>:CtrlPCmdPalette<cr>
vnoremap           <c-s-p>  <c-C>:CtrlPCmdPalette<cr>

" <c-s> Save
noremap            <c-s>    :update!<CR>
vnoremap           <c-s>    <c-C>:update!<CR>
inoremap           <c-s>    <c-O>:update!<CR>

" <c-v> Paste
noremap            <c-v>    "+gP
cnoremap           <c-v>    <c-R>+
exe 'inoremap <script> <c-v> <c-g>u' . paste#paste_cmd['i']
exe 'vnoremap <script> <c-v> ' . paste#paste_cmd['v']

" <c-x> Cut
vnoremap <c-X>   "+x

" <c-y> Increment closest number
nnoremap <silent> <c-y> :<c-u>call AddSubtract("\<c-a>", '')<CR>



"---------------------------------
" F Function mapping             |
"---------------------------------

" Toggle Menu bar
nnoremap <c-F1> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>

" File explorer (NERD Tree)
noremap  <silent> <F2> :NERDTreeToggle<CR>
inoremap <silent> <F2> <c-O>:NERDTreeToggle<CR>

" Taglist pane
noremap  <silent> <F3> :TlistToggle<CR>
vnoremap <silent> <F3> <c-C>:TlistToggle<CR>
inoremap <silent> <F3> <c-O>:TlistToggle<CR>

" Tagbar
noremap  <silent> <F4> :TagbarToggle<CR>
vnoremap <silent> <F4> <c-C>:TagbarToggle<CR>
inoremap <silent> <F4> <c-O>:TagbarToggle<CR>

nnoremap <F6> :call ToggleFlag('guioptions','mrT')<cr>
inoremap <F6> <c-C>:call ToggleFlag('guioptions','mrT')<cr>

" Change colorscheme
nnoremap <F7> :call NextColor(1)<CR>
nnoremap <S-F7> :call NextColor(-1)<CR>
nnoremap <A-F7> :call NextColor(0)<CR>

" Insert Lopsum Text
noremap  <silent> <F9> :Loremipsum 200<CR>
vnoremap <silent> <F9> <c-C>:Loremipsum 200<CR>
inoremap <silent> <F9> <c-O>:Loremipsum 200<CR>

" Close quickfix window
noremap  <silent> <F10> :ccl<CR>
vnoremap <silent> <F10> <c-C>:ccl<CR>
inoremap <silent> <F10> <c-O>:ccl<CR>

" Toggle numbers
noremap  <silent> <F11> :set nonu!<CR>
vnoremap <silent> <F11> <c-C>:set nonu!<CR>
inoremap <silent> <F11> <c-O>:set nonu!<CR>

" Remove trailing spaces
noremap  <silent> <F12> :FixWhitespace<CR>
vnoremap <silent> <F12> <c-C>:FixWhitespace<CR>
inoremap <silent> <F12> <c-O>:FixWhitespace<CR>

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
noremap <leader>a  :Ack! <c-R><c-W><cr>
noremap <leader>A  :Ack! <c-R><c-W><cr>

" Use CTRL-Q to do what CTRL-V used to do
noremap <c-q> <c-v>

" Leader Shortcuts
nmap <leader>w :w!<cr>

" Remap interrupt search command
noremap <c-u> <c-c>

" GitGutter
noremap <leader>gh  :GitGutterLineHighlightsToggle<cr>
noremap <leader>gg  :GitGutterToggle<cr>
noremap <leader>gj  :GitGutterNextHunk<cr>
noremap <leader>gk  :GitGutterPrevHunk<cr>
noremap <leader>ga  :GitGutterStageHunk<cr>
noremap <leader>gu  :GitGutterReverHunk<cr>
noremap <leader>gv  :GitGutterPreviewHunk<cr>

" ---------------------------------------------------------
" Plugins settings
" ---------------------------------------------------------

" Vim-indent-guides
" -----------------
let g:indent_guides_auto_colors = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size  = 1
let g:indent_guides_enable_on_vim_startup = 0
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey

" Easymotion
" ----------
nmap s <Plug>(easymotion-s)
nmap t <Plug>(easymotion-t)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyz'
let g:EasyMotion_smartcase = 1
let g:EasyMotion_do_special_mapping = 1

" CtrlP
" -----
let g:ctrlp_working_path_mode = 'a'   " Change current directory if file is outside
let g:ctrlp_match_window = 'bottom,order:ttb,min:5,max:30,result:30'
let g:ctrlp_cache_dir = '~/.cache/ctrlp'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:20,results:20'
let g:ctrlp_show_hidden = 1  " Match dotfiles
let g:ctrlp_max_files = 2000
let g:ctrlp_max_depth = 20
let g:ctrlp_follow_symblinks = 1
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git|hg|svn)$',
            \ 'file': '\v\.(exe|so|dll|doj|bin|zip|tar|gz|iso|class|rar|swp|ldr|dpj|stk)$',
            \ 'link': 'some_bad_symbolic_links',
            \ }

" Taglist
" -------
let g:Tlist_Auto_Highlight_Tag = 1
let g:Tlist_Auto_Update = 1
let g:Tlist_WinWidth = 50

" Airline
" -------
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme             = 'wombat'
let g:airline_powerline_fonts = 1

" Utilsnips
" ---------
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-g>"

" NERDTree
" --------
let g:NERDTreeDirArrows=1           " Show nice arrows instead of |+
let g:NERDTreeShowHidden=1          " Show hidden files
let g:NERDTreeWinPos="left"         " Window position
let g:NERDTreeWinSize=50            " Width of the NERDTree sidebar

" Calendar
" --------
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1

" Vim Multiple cursor
" -------------------
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key  = '<c-m>'
let g:multi_cursor_start_key = '<c-m>'
let g:multi_cursor_quit_key  = '<Esc>'

" Ultisnips
" ---------
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

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

" Get Visual Selection
" --------------------
function! GetVisualSelection()
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

