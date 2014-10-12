
" File:   .vimrc
" Author: Yves Chevallier <nowox@x0x.ch>
" Date:   2014-10-03
" Source: https://github.com/nowox/dotfiles

" First things to do {{{1
" Reset all settings
set all&

" Not on Vi anymore
set nocompatible                       " be Vi iMproved

" Plateform {{{1
" On which OS are we are ?
let s:is_windows = has("win16") || has("win32") || has("win64")|| has("win95")
let s:is_cygwin  = has('win32unix')
let s:is_macvim  = has('gui_macvim')

" Plugins {{{1
" ------------

" Init Bundle {{{2
filetype off                           " Required for Vundle

" Start Vundle the package manager
set  runtimepath +=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'

" Plugins {{{2


" A lot of colorschemes (including hybrid)
Plugin 'flazz/vim-colorschemes'

"Plugin 'dbakker/vim-projectroot'       " Set default path to root project by detecting .git for instance
"au BufEnter * if &ft != 'help' | call ProjectRootCD() | endif

"Plugin 'Shougo/vimproc.vim'
"Plugin 'Shougo/vimshell.vim'


"Plugin 'vim-scripts/LanguageTool'
"let g:languagetool_jar='$HOME/languagetool/languagetool-commandline.jar'

"Plugin 'airblade/vim-gitgutter'        " Show changed
"let g:gitgutter_enabled = 0            " BufEnter much slower with gitgutter. I disabled it !
"let $GIT_DISCOVERY_ACROSS_FILESYSTEM=1 " Require on Windows/Cygwin to avoid :system() error




Plugin 'tpope/vim-surround'            " Easy delete, change on surroundings in pairs
Plugin 'tpope/vim-unimpaired'


"Plugin 'vim-scripts/Txtfmt-The-Vim-Highlighter'
Plugin 'vim-scripts/ccase.vim'

Plugin 'vim-scripts/loremipsum'        " Insert Lipsum text



Plugin 'vim-scripts/ZoomWin'           " <C-w>o get full screen then <C-w>o again will restore the windows.

Plugin 'milkypostman/vim-togglelist'   " Allow to toggle quickfix and location list window
let g:toggle_list_no_mappings = 1
" Togglequickfix called by <F10>

"Plugin 'xolox/vim-easytags'            " To test

"Plugin 'skammer/vim-css-color'         " Very slow plugin not usable
Plugin 'vim-scripts/bufkill.vim'

" Plugin: Prompt Airline {{{2
Plugin 'edkolev/promptline.vim'
let g:promptline_theme = 'nowox'
let g:promptline_preset = {
      \'a'    : [ '$(hostname)' ],
      \'b'    : [ '$(whoami)' ],
      \'c'    : [ '$(pwd)' ],
      \'options': {
          \'left_sections' : [ 'b', 'a' ],
          \'right_sections' : [ 'c' ],
          \'left_only_sections' : [ 'b', 'a', 'c' ]}}
" Plugin: Fakeclip {{{2
" Allow to use clipboard under cygwin
" Fakeclip is a Vim plugin to provide a pseudo |clipboard| register for
" several versions of Vim without |+clipboard| support, especially for non-GUI
" version of Vim on the following platforms:
" - Cygwin
" - Mac OS X
" - X Window System
Plugin 'kana/vim-fakeclip'
let g:fakeclip_terminal_multiplexer_type="tmux"

" Plugin: LaTeX-Box {{{2

Plugin 'LaTeX-Box-Team/LaTeX-Box'
let g:LatexBox_latexmk_options='-xelatex'

" Plugin: Vim-fugitive {{{2
" View any blob, tree, commit, or tag in the repository with :Gedit (and
" :Gsplit, :Gvsplit, :Gtabedit, ...). Edit a file in the index and write to it
" to stage the changes. Use :Gdiff to bring up the staged version of the file
" side by side with the working tree version and use Vim's diff handling
" capabilities to stage a subset of the file's changes.
Plugin 'tpope/vim-fugitive'

" Plugin: Taglist {{{2

Plugin 'vim-scripts/taglist.vim'
let g:Tlist_Auto_Highlight_Tag = 1
let g:Tlist_Auto_Update = 1
let g:Tlist_WinWidth = 50

" Plugin: Tagbar {{{2
" Tagbar is a vim plugin for browsing the tags of source code files. It provides
" a sidebar that displays the ctags-generated tags of the current file, ordered
" by their scope. This means that for example methods in C++ are displayed under
" the class they are defined in.
Plugin 'majutsushi/tagbar'
let g:tarbar_left=1
let g:tagbar_iconchars = ['►', '▼'] " Set for consolas powerline

" Plugin: Autochmodx {{{2
" If a current file looks like an executable script, make it executable by running "chmod +x %"
Plugin 'tyru/autochmodx.vim'

" Plugin: Ultisnip {{{2

" Track the engine.
"Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
"Plugin 'honza/vim-snippets'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<A-d>"
let g:UltiSnipsJumpBackwardTrigger="<A-a>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Plugin: Vim-Airline {{{2
" Fancy status and tab bar, very good plugin
Plugin 'bling/vim-airline'                        " Best status line ever (needs Powerline Consolas font)
let g:airline_theme                      = 'wombat' " With brighter split separators
let g:airline#extensions#tabline#enabled = 1      " Allows to view windows/tabs
let g:airline_powerline_fonts            = 1      " Fancy fonts
let g:airline#extensions#tabline#enabled = 1
" Plugin: edkolev/tmuxline.vim {{{2
Plugin 'edkolev/tmuxline.vim'
" Plugin: Easymotion {{{2
" A revolutionary new way to navigate in a file. EasyMotion provides a much simpler way
" to use some motions in vim.
Plugin 'Lokaltog/vim-easymotion'       " Allow to move quickly using shortcuts
let g:EasyMotion_startofline        = 0 " Keep cursor colum when JK motion
let g:EasyMotion_smartcase          = 1 " Same as smartcase in vim
let g:EasyMotion_do_shade           = 1 " Shade text to better see the keys
let g:EasyMotion_enter_jump_first   = 1 " When search, jump directly on enter
let g:EasyMotion_do_special_mapping = 1 " {operator}<leader>l (select, yank, paste ...)
let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyz123456789éà$,.-è<'
" Plugin: CtrlP <C-p> {{{2
" Inspired from Sublime. Provide a nice solution to navigate and load files.
Plugin 'kien/ctrlp.vim'                           " Sublime's <C-P> feature
let g:ctrlp_working_path_mode = 'ra'    " was just a before !
let g:ctrlp_cache_dir         = '~/.cache/ctrlp'
let g:ctrlp_switch_buffer     = 'e'    " was 0
let g:ctrlp_cmd               = 'CtrlPMixed'
let g:ctrlp_match_window      = 'bottom,order:ttb,min:5,max:30,results:30'
let g:ctrlp_show_hidden       = 1
let g:ctrlp_max_files         = 1000
let g:ctrlp_max_depth         = 10
let g:ctrlp_follow_symblinks  = 1
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git|hg|svn)$',
            \ 'file': '\v\.(sbn|ovl|s|html|d|exe|so|dll|doj|bin|zip|tar|gz|iso|class|rar|swp|ldr|dpj|stk)$',
            \ 'link': 'some_bad_symbolic_links',
            \ }
" Plugin: CtrlP Command Palette {{{2
Plugin 'fisadev/vim-ctrlp-cmdpalette'  " Command palette for ctrlp
let g:ctrlp_cmdpalette_execute=1
" Plugin: CtrlP Yankround {{{2
Plugin 'LeafCage/yankround.vim'

" Plugin: CtrlP Extensions (Menu) {{{2
Plugin 'sgur/ctrlp-extensions.vim'

" Plugin: NERDTree <F2> {{{2
" Files Explorer
Plugin 'scrooloose/nerdtree'           " File explorer
let g:NERDTreeDirArrows  = 1           " Show nice arrows instead of |+
let g:NERDTreeShowHidden = 1           " Show hidden files
let g:NERDTreeWinPos     = "left"      " Window position
let g:NERDTreeWinSize    = 50          " Width of the NERDTree sidebar
" Plugin: vim-multiple-cursors {{{2
Plugin 'terryma/vim-multiple-cursors'  " Sublime's multiple selection feature
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key  = '<C-b>'
let g:multi_cursor_start_key = '<C-b>'
let g:multi_cursor_quit_key  = '<Esc>'
" Plugin: Indent-guides {{{2

"Plugin 'nathanaelkane/vim-indent-guides'
"let g:indent_guides_auto_colors = 1
"let g:indent_guides_start_level = 2
"let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']
"if s:is_windows
"    let g:indent_guides_enable_on_vim_startup = 0
"else
"    let g:indent_guides_enable_on_vim_startup = 0
"endif

let g:indent_guides_auto_colors = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size  = 1
let g:indent_guides_enable_on_vim_startup = 0
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey

" Plugin: vim-notes {{{2

"Plugin 'xolox/"vim-notes'               " Note taking
"Plugin 'xolox/vim-misc'                " Needed by vim-notes
"let g:notes_directories = ['~/notes/']
"let g:notes_suffix      = '.txt'

" Plugin: NERDCommenter {{{2
" [count]<leader>cb |NERDComAlignedComment|  ( Comment lines )
" [count]<leader>cu |NERDComUncommentLine|   ( Uncomment lines )
Plugin 'scrooloose/nerdcommenter'

" Plugin: SuperTab {{{2
" Supertab is a vim plugin which allows you to use <Tab> for all your insert
" completion needs (:help ins-completion).
Plugin 'ervandew/supertab'
let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabMappingForward = '<C-@>'
let g:SuperTabMappingBackward = '<S-C-@>'
" Plugin: Ag/Ack {{{2

if executable('ag')
    Plugin 'rking/ag.vim'                  " Better than Ack
else
    Plugin 'mileszs/ack.vim'               " Use the Perl module App::Ack
endif

" Plugin: Eregex (Perl regex style in vim) {{{2
Plugin 'othree/eregex.vim'
let g:eregex_default_enable = 0

" Plugin: Mark--Karkat {{{2
Plugin 'vim-scripts/Mark--Karkat'
" Plugin: Voom {{{2
Plugin 'vim-scripts/VOoM'
" Plugin: Gundo {{{2
Plugin 'sjl/gundo.vim'                 " Visualize your Vim undo tree
let g:voom_tree_width=40
" Plugin: A (Alternate .c <--> .h) {{{2
"A few of quick commands to swtich between source files and header files quickly.
" :A switches to the header file corresponding to the current file being edited (or vise versa)
" :AS splits and switches
" :AV vertical splits and switches
" :AT new tab and switches
" :AN cycles through matches
" :IH switches to file under cursor
" :IHS splits and switches
" :IHV vertical splits and switches
" :IHT new tab and switches
" :IHN cycles through matches
" <Leader>ih switches to file under cursor
" <Leader>is switches to the alternate file of file under cursor (e.g. on  <foo.h> switches to foo.cpp)
" <Leader>ihn cycles through matches
Plugin 'vim-scripts/a.vim'             " Alternate quickly between .c <--> .h

" Plugin: Bufstop (Easy way to switch buffers) {{{2
Plugin 'mihaifm/bufstop'               " Easy way to switch buffers
" Plugin: Tabular {{{2
" :Tabularize /=
" :Tabularize /=\ \d
Plugin 'godlygeek/tabular'             " Select, then :Tabularize /= to align to equal sign
" Plugin: Goyo (Distraction free) {{{2
Plugin 'junegunn/goyo.vim'

" Plugin: Expand-region (ö: expand ä: shrink) {{{2
Plugin 'terryma/vim-expand-region'  " Allow to visually select increasingly larger region of text 

" Plugin: Markdown fold {{{2
"Plugin 'nelstrom/vim-markdown-folding'
"Plugin 'plasticboy/vim-markdown'
" Plugin: Markdown conceal {{{2
Plugin 'prurigro/vim-markdown-concealed'

" Plugin: Improve f F T {{{2
Plugin 'chrisbra/improvedft'

" Plugin: Color table xterm (256 colors) {{{2
Plugin 'guns/xterm-color-table.vim'
"}}}2
" Plugin: Unite {{{2
Plugin 'Shougo/unite.vim'

" Plugin: GoldenView {{{2
Plugin 'zhaocai/GoldenView.Vim'

" Colorizer (Cost too much in performances) {{{2
Plugin 'lilydjwg/colorizer'
let g:colorizer_startup = 0
let g:colorizer_nomap=1

" *** Disabled Plugins *** {{{2

" }}}2

" End Bundle {{{2

call vundle#end()
" }}}1

" Settings {{{1
" Important settings {{{2

" Reenable filetypes
filetype plugin on                     " Enable Plugins
filetype indent on                     " Enable Automatic Indent

" Remap leader
let mapleader = ","                    " Use a more convenient leader key

" Vim's language and vim
if s:is_windows && has('gui')
    language messages en
    set rtp+=~/.vim
endif
                                                                           

" Settings: GUI {{{2

if s:is_windows
    set guifont=Powerline_Consolas:h9:cANSI
    set guioptions=                      " No menu, no toolbar, no scrollbars
else
    set guifont=Powerline\ Consolas\ 10
endif

syntax on                              " Enable Syntax
colorscheme nowox                      " Best colorscheme ever

" Settings: Shell/System {{{2
" Shell, runtime and enviromnent
if s:is_windows && !s:is_cygwin
    set shell=c:\windows\system32\cmd.exe
    set runtimepath^=~/.vim
    set viminfo+=n~/.viminfo
    cd ~
endif
" Settings: Terminal {{{2
if exists("$TMUX") 
    set term=screen-256color
endif
set noshelltemp

" Settings: Encoding/Filetypes/EOL {{{2
set encoding=utf-8
set ffs=unix,dos,mac                   " Default type UNIX then DOS then MAC
setglobal fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,latin1
set termencoding=utf-8

" Settings: Mouse/Selection {{{2
set mouse      =a                     " Use mouse in All modes
set mousefocus                         " Activate windows on mouseover
set selectmode =mouse,key
set mousemodel =popup
set keymodel   =startsel,stopsel
set selection  =exclusive
set ttymouse=xterm2
" Settings: Interface {{{2
set title                              " Set window title automatically
set history=1000                       " Remember more commands and search history
set undolevels=1000                    " Keep a raisonnable undo
set scrolloff=2                        " Set the number of context lines to see above and below the cursor
set autoread                           " Set to auto read when a file is changed from the outside
set wildmenu                           " Command-line menu
set ruler                              " See number of lines
set cmdheight=2                        " Height of the command-line
set wildignore=*.o,*~,*.pyc,*.doj      " Ignore some files for wildmenu
set hidden                             " Not unload buffer when it is abandoned
set relativenumber                     " Show line number on the left
set whichwrap+=<,>,h,l                 " Allow to use arrow keys to move in Visual Mode
set virtualedit=all                    " Allow to place cursor at any location

set cursorline                         " Highlight current line
autocmd WinLeave * setlocal nocursorline
autocmd WinEnter * setlocal cursorline

"set cursorcolumn
"autocmd WinLeave * setlocal nocursorcolumn
"autocmd WinEnter * setlocal cursorcolumn

set colorcolumn=90
autocmd WinLeave * setlocal colorcolumn=0
autocmd WinEnter * setlocal colorcolumn=90

set writeany                           " Allow writing to any file with no need for "!" override
set backspace=eol,start,indent         " Allow backspacing over CR autoindent and start of insert
set helpheight=999
set winminheight=0
set ttimeoutlen=0                      " Reduce the delay with <esc> when escaping from insert mode
set shortmess=aoA
set nrformats-=octal

" Split Windows
set splitright                         " New vertical split always at the right of the current window
set splitbelow                         " New horizontal split always at the bottom of the current window

" Diff
set diffopt+=filler,iwhite,icase,vertical

" Status line
set fillchars=fold:─,vert:│            " Separator for status window
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

" Settings: Performances {{{2
set ttyfast                            " Send more chars to redraw in CTERM
set lazyredraw                         " Buffer screen updates instead of updating al the time
"let loaded_matchparen = 1
" Settings: Alerts {{{2
set noerrorbells
set novisualbell
set t_vb=
set tm=500
" Settings: Search/Find/Replace {{{2
set hlsearch                           " No Highlight search results
let @/=""

set incsearch                          " Interactive search
set magic                              " Simplify usage of Regex
set showmatch                          " Show matching brackets
set ignorecase                         " Ignore case when searching
set smartcase                          " Override ignorecase if search contains upper chars
set mat=2                              " How many tenth of a second to blink when matching brackets

if executable('ack')
    set grepprg=ack\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow\ $*
    set grepformat=%f:%l:%c:%m
endif
if executable('ag')
    set grepprg=ag\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow
    set grepformat=%f:%l:%c:%m
endif

" Settings: Format/Linebreak {{{2
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
" Settings: Indentation/Tabs {{{2
set tabstop=4                          " How many spaces a tab worth
set expandtab                          " Insert spaces instead of tabs
set shiftwidth=4                       " Used for reindent operations
set softtabstop=4                      " How many columns are used when <Tab> is hit in insert mode
set smarttab                           " A <BS> will delete a space not a tab
" Settings: Folds {{{2
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent
set foldcolumn=3
" Settings: Backup {{{2
set nobackup                           " Disable backup
set noswapfile                         " Disable swap because sometime swapfile is in readonly
" Settings: Conceal {{{2
if has('conceal')
    set conceallevel=2        " Hide conceal chars
    set concealcursor="nvic"    " Show conceal chars on cursorline for all modes
    set listchars+=conceal:Δ
endif

"let g:tex_conceal="abdmgsS"
" Settings: Encryption {{{2
set cryptmethod=blowfish
" }}}1

" Mappings {{{1

" Mappings: VIM Unconsistancies {{{2
" Some default behavior of vim that is not logical anymore in our modern and technological world. 

" Correct cursor movement for long lines
noremap j gj
noremap k gk

" Backspace will delete the char before cursor
vnoremap <BS> X
nnoremap <BS> X

" $ to move physically at the end of the line
" (Virtualedit must be enabled)
nmap <End>    $l

" Insertion mode on enter
nmap <cr> i<cr>

" In visual mode arrows don't work as expected
vmap <Up> k
vmap <Down> j
vmap <Left> h
vmap <Right> l

" In Select mode arrows keys cancel the selection
smap <Up> <esc><Up>
smap <Down> <esc><Down>
smap <Left> <esc><Left>
smap <Right> <esc><Right>

" zz center the current line and fold everything but the current fold
noremap zz       zMzvzz
noremap zt       zMzvzt
noremap zb       zMzvzb

" jk and jj is back to normal mode (try to use Ctrl-AltGr-è instead)
inoremap jk <esc>
inoremap jj <esc>

" In the case sudo is needed
cmap w!! w !sudo tee % >/dev/null

" Current word highlight
noremap <silent> à mP*N`P

" Disable highlight search
noremap <silent> é :noh<cr>


" Mappings: One char {{{2

" <tab> Tabbing visual selection
nnoremap           <Tab>        >>
nnoremap           <S-Tab>      <<
inoremap           <S-Tab> <c-o><<
vnoremap           <Tab>        >gv
vnoremap           <S-Tab>      <gv

" Search with <space>
map                <space> /

" Ag/Ack search
nnoremap           Z            :Ag!<space>
vnoremap           Z            :Ag!<space><C-u><C-r>=GetVisualSelection()<CR>

" Use Q for formatting the current paragraph (or selection)
vnoremap           Q       gq
nnoremap           Q       gqap

" Go back to marker position (the swiss french keyboard sucks)
noremap            '       `

" - is :
noremap            -       :

" Terminal redraw
noremap            §       :redraw<cr>

" Easymotion
map                s       <Plug>(easymotion-s)
"map                f       <Plug>(easymotion-bd-wl)
"map                F       <Plug>(easymotion-bd-el)
map                <c-j>   <Plug>(easymotion-j)
map                <c-k>   <Plug>(easymotion-k)

" Expand-region
map                ö       <Plug>(expand_region_expand)
map                ä       <Plug>(expand_region_shrink)

" Mappings: CTRL {{{2

" <C-Tab> <C-S-Tab> Next/Previous buffer
if s:is_cygwin
    " <C-Tab> Next buffer
    set <f26>=[1;5I
    map <silent> <f26> :bn!<cr>
    imap <silent> <f26> <c-o>:bn!<cr>
    vmap <silent> <f26> <c-c>:bn!<cr>

    " <C-S-Tab> Previous buffer
    set <f27>=[1;6I
    map <silent> <f27> :bp!<cr>
    imap <silent> <f27> <c-o>:bp!<cr>
    vmap <silent> <f27> <c-c>:bp!<cr>
else 
    " <C-Tab> Next buffer
    map <silent> <C-Tab> :bn!<cr>
    imap <silent> <C-Tab> <c-o>:bn!<cr>
    vmap <silent> <C-Tab> <c-c>:bn!<cr>

    " <C-S-Tab> Previous buffer
    set <f27>=[1;6I
    map <silent> <C-S-Tab> :bp!<cr>
    imap <silent> <C-S-Tab> <c-o>:bp!<cr>
    vmap <silent> <C-S-Tab> <c-c>:bp!<cr>
endif

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

" <C-i>
" Cannot be mapped, already binded to <Tab>

" <C-j> Add an empty line below the cursor
"nnoremap <silent> <C-j> m`o<esc>``
"inoremap <silent> <C-j> <esc>m`o<esc>``a

" <c-k> Add an empty line above the cursor
"nnoremap <silent> <c-k> m`O<esc>``
"inoremap <silent> <c-k> <esc>m`O<esc>``a

" <C-l> Old <C-v> behavior
inoremap <C-l> <C-v>

" <C-m> Multiple cursor
" Cannot be mapped, same as <CR>

" <C-n>

" <C-o>
noremap            <C-o>    :CtrlPBuffer<CR>
vnoremap           <C-o>    <C-c>:CtrlPBuffer<CR>
inoremap           <C-o>    <C-o>:CtrlPBuffer<CR>

" <C-P> CtrlP

" <C-q> Blockwise visual mode
noremap            <C-q>    <C-v>

" <C-r> Redo

" <C-s> Save
noremap            <C-s>    :update!<CR>
vnoremap           <C-s>    <C-c>:update!<CR>
inoremap           <C-s>    <C-o>:update!<CR>

" Tag completion
inoremap <c-t> <c-x><c-]>

" <C-u> Interrupt current search

" <c-v> Paste
noremap            <C-v>    "+gP
cmap               <C-v>    <C-R>+

" Pasting blockwise and linewise selections is not possible in Insert and
" Visual mode without the +virtualedit feature.  They are pasted as if they
" were characterwise instead.
" Uses the paste.vim autoload script.

exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']

imap <S-Insert>     <C-v>
vmap <S-Insert>     <C-v>

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

" <c-y> Increment closest number
nnoremap <silent> <c-y> :<c-u>call AddSubtract("\<c-a>", '')<CR>

" <C-,> [1;5l

" <C-.> [1;5n

" <C--> [1;5m

" Mappings: Alt {{{2
" <A-j> Move screen down
set <f32>=j
noremap <f32> <C-y>k
inoremap <f32> <C-y><C-o>k
" <A-k> Move screen up
set <f33>=k
noremap <f33> <C-e>j
inoremap <f33> <C-e><C-o>j
" }}}2
" Mappings: F Functions {{{2
" Help in full screen
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

" Clear CTRLP cache
noremap  <silent> <F5> :CtrlPClearAllCaches<CR>
vnoremap <silent> <F5> <c-C>:CtrlPClearAllCachesCR>
inoremap <silent> <F5> <c-O>:CtrlPClearAllCaches<CR>


nnoremap <F6> :call ToggleFlag('guioptions','mrT')<cr>
inoremap <F6> <c-C>:call ToggleFlag('guioptions','mrT')<cr>

" Toggle Voom
nnoremap <F7> :VoomToggle<CR>
nnoremap <S-F7> :VoomToggle<CR>
nnoremap <A-F7> :VoomToggle<CR>

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
noremap  <silent> <F11> :call ToggleNumber()<CR>
vnoremap <silent> <F11> <c-C>:call ToggleNumber()<CR>
inoremap <silent> <F11> <c-O>:set ToggleNumber()<CR>

" Remove trailing spaces
noremap  <silent> <F12> :FixWhitespace<CR>
vnoremap <silent> <F12> <c-C>:FixWhitespace<CR>
inoremap <silent> <F12> <c-O>:FixWhitespace<CR>

" Mappings: Leader {{{2
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

" Ag search
noremap <leader>a  :Ag! <c-R><c-W><cr>
noremap <leader>A  :Ag! <c-R><c-W><cr>

" Use CTRL-Q to do what CTRL-V used to do
noremap <c-q> <c-v>

" Disable highlight search
map     <silent> <leader><cr> :noh<cr>

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
" }}}2


" Tmux {{{1
if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif
"}}}1

" Abbreviattion
iab xxdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>
iab xxfile <c-r>=echo expand('%:t')<cr>
iab xxdir  <c-r>=echo expand('%:p:h')<cr>
iab xxpath <c-r>=echo expand('%:p')<cr>
iab shebang #!/usr/env perl

" Autocommands {{{1
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
    autocmd BufEnter *.def setlocal filetype=c
    autocmd BufEnter *.ldf setlocal filetype=ldf
    autocmd BufEnter *.tex map <leader>ll :Latexmk<cr>
augroup END

augroup vimrc
    autocmd!
    autocmd BufEnter .vimrc setlocal foldmethod=marker | set foldlevel=0
augroup END
"}}}1
" .vimrc Plugins {{{1
" Preserve cursor position when switch buffer
" -------------------------------------------
if v:version >= 700
    au BufLeave * let b:winview = winsaveview()
    au BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif
endif

" Show and remove extra trailing spaces
" -------------------------------------
highlight ExtraWhitespace ctermbg=235 guibg=#382424
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=235 guibg=red
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/

" The above flashes annoyingly while typing, be calmer in insert mode
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
" }}}1

" Functions {{{1
" paste#paste {{{2
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
" FixWhitespace {{{2
function! s:FixWhitespace(line1,line2)
    let l:save_cursor = getpos(".")
    silent! execute ':' . a:line1 . ',' . a:line2 . 's/\s\+$//'
    call setpos('.', l:save_cursor)
endfunction

command! -range=% FixWhitespace call <SID>FixWhitespace(<line1>,<line2>)

" AddSubstract (Add/Substract value to a number) {{{2
function! AddSubtract(char, back)
    let pattern = &nrformats =~ 'alpha' ? '[[:alpha:][:digit:]]' : '[[:digit:]]'
    call search(pattern, 'cw' . a:back)
    execute 'normal! ' . v:count1 . a:char
    silent! call repeat#set(":\<C-u>call AddSubtract('" .a:char. "', '" .a:back. "')\<CR>")
endfunction

" AdjustWindowHeight (Automatic adjust quickfix window height) {{{2
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
au FileType qf call AdjustWindowHeight(3, 20)

" ToggleMouse (Toggle mouse between terminal and vim mode) {{{2
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

" Present Colorscheme {{{2
function! Present()
    set background=light
    colorscheme summerfruit256
    AirlineTheme solarized
    AirlineToggle
    set nocursorline
    set nonu
    set colorcolumn=
    set foldcolumn=0
endfunction

" NextColor (Next colorscheme) {{{2
let s:mycolors     = ['hybrid', 'eclipse', 'automation','256-jungle', 'bvemu', '256-grayvim', 'bubblegum']
let s:airlinetheme = ['wombat', 'base16', 'base16', 'base16', 'base16', 'base16', 'base16']

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

" ToggleFlag {{{2
function! ToggleFlag(option,flag)
    exec ('let lopt = &' . a:option)
    if lopt =~ (".*" . a:flag . ".*")
        exec ('set ' . a:option . '-=' . a:flag)
    else
        exec ('set ' . a:option . '+=' . a:flag)
    endif
endfunction

" ToggleNumber {{{2
function! ToggleNumber()
    " Loop trough number style
    " - Nonu
    " - Nu
    " - RelativeNumber
    if (!&nu && !&relativenumber)
        " Nonu -> Nu
        set nu
    elseif (&nu && !&relativenumber)
        " Nu -> RelativeNumber
        set relativenumber
    else
        " RelativeNumber -> Nonu
        set nonu
        set norelativenumber
    endif
endfunction
" }}}1

" New Stuff {{{1
" This part concerns things that I recently added to vim. In this way I can
" easily revert things that don't work as expected.
hi link texBoldStyle Storage
hi link texItalStyle  Keyword
hi link htmlBold Storage
hi link htmlItalic Identifier
hi link htmlH2 Keyword
function! MarkdownFolds()
  let thisline = getline(v:lnum)
  if match(thisline, '^##') >= 0
    return ">2"
  elseif match(thisline, '^#') >= 0
    return ">1"
  else
    return "="
  endif
endfunction
setlocal foldmethod=expr
setlocal foldexpr=MarkdownFolds()

function! MarkdownFoldText()
  let foldsize = (v:foldend-v:foldstart)
  return getline(v:foldstart).' ('.foldsize.' lines)'
endfunction
setlocal foldtext=MarkdownFoldText()

" Fold text function {{{2
if has("folding")


  function! MyFoldText()
      if &foldmethod == 'syntax'
          let l:lpadding = &fdc
          redir => l:signs
          execute 'silent sign place buffer='.bufnr('%')
          redir End
          let l:lpadding += l:signs =~ 'id=' ? 2 : 0

          if exists("+relativenumber")
              if (&number)
                  let l:lpadding += max([&numberwidth, strlen(line('$'))]) + 1
              elseif (&relativenumber)
                  let l:lpadding += max([&numberwidth, strlen(v:foldstart - line('w0')), strlen(line('w$') - v:foldstart), strlen(v:foldstart)]) + 1
              endif
          else
              if (&number)
                  let l:lpadding += max([&numberwidth, strlen(line('$'))]) + 1
              endif
          endif

          " expand tabs
          let l:start = substitute(getline(v:foldstart), '\t', repeat(' ', &tabstop), 'g')
          let l:end = substitute(substitute(getline(v:foldend), '\t', repeat(' ', &tabstop), 'g'), '^\s*', '', 'g')

          let l:info = ' (' . (v:foldend - v:foldstart) . ')'
          let l:infolen = strlen(substitute(l:info, '.', 'x', 'g'))
          let l:width = winwidth(0) - l:lpadding - l:infolen

          let l:separator = ' … '
          let l:separatorlen = strlen(substitute(l:separator, '.', 'x', 'g'))
          let l:start = strpart(l:start , 0, l:width - strlen(substitute(l:end, '.', 'x', 'g')) - l:separatorlen)
          let l:text = l:start . ' … ' . l:end

          return l:text . repeat(' ', l:width - strlen(substitute(l:text, ".", "x", "g"))) . l:info          
      else
          let l:line = substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{{\d*\s*', '', 'g')
          if &ft == 'mkdc'
              let l:line = substitute(l:line, '^#\+', '', 'g')
          endif
          let l:line = ' ' .  l:line.' '

          let lines_count = v:foldend - v:foldstart + 1
          let lines_count_text = ' ' . printf("%10s", lines_count . ' lines') . ' '
          let foldchar = matchstr(&fillchars, 'fold:\zs.')
          let foldtextstart = strpart(repeat(foldchar, v:foldlevel*2) . l:line, 0, (winwidth(0)*2)/3)
          let foldtextend = lines_count_text . repeat(foldchar, 8)
          let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
          return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend

      endif
  endfunction
  set foldtext=MyFoldText()

endif       
" }}}2

" }}}1
