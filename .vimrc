"" File:        .vimrc
"" Maintainer:  Yves Chevallier <nowox@x0x.ch>
"" Last Change: 2015-04-01
"" Source:      https://github.com/nowox/dotfiles/.vimrc
" #Another .vimrc
"
" ##Motivations
" I am not convinced traditional vim users are more efficient than sublime's or atom's
" users. However, I am truly convinced that vim can be configured to be used in a more
" modern way. For instance, I feel using `<C-c>` and `<C-v>` for copy/paste is the first
" step in this tiny revolution. Almost every terminal emulators can now capture Ctrl + key
" Why not to start using them extensively?
"
" The Markdown output is generated with vim2doc Perl script:
" 
"     ~/.scripts/vim2doc ~/.vimrc > ~/.doc/vimrc.md
"
" ##Table of contents
"
" [TOC]
"
" ##At first {{{1
" We reset all the previous settings and enter in no-compatible mode. We stop using vim
" in legacy mode.
"
set all&                                    "<! Reset all settings
set nocompatible                            "<! be Vi iMproved

" Depending on the architecure, one has setup vim differently. Let's discover which is
" the used architecture. I am mainly using Vim on Windows, Cygwin and Linux.

let s:is_windows = has("win16") || has("win32") || has("win64")|| has("win95")
let s:is_cygwin  = has('win32unix')
let s:is_macvim  = has('gui_macvim')

" Start Vundle our package manager.
" Vundle is like Pathogen, it's a package manager for vim. Packages can be easily
" installed, removed and updated.
"
" To install a new package just type `:BundleInstall` and for update `:BundleUpdate`.
"
" Before anything, we need to disable `filetype`.
"
filetype off
set  runtimepath +=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

" ##Plugins {{{1
" This section contains all the plugins I am using with Vim.

" ###Lorem Ipsum {{{2
" (LoremIpsum)[http://lipsum.com/] is simply dummy text of the printing and typesetting 
" industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, 
" when an unknown printer took a galley of type and scrambled it to make a type specimen 
" book. It has survived not only five centuries, but also the leap into electronic 
" typesetting, remaining essentially unchanged. It was popularised in the 1960s with the
" release of Letraset sheets containing Lorem Ipsum passages, and more recently with 
" desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
"
" Usage is
"
"     :Loremipsum[!] [WORDCOUNT] [PARAGRAPH_TEMPLATE] [PREFIX POSTFIX]
"
" For example you can use `:Loremipsum 42` to generate 42 words.
"
Plugin 'loremipsum'

" ###Zoomwin {{{2
" When working with windows (splits), it is sometime nice to go in full screen. This 
" plugin provide this with `<C-w>o` to enable/disable the full screen mode.
"
" - Files are made hidden during zoom-in and restored upon zoom-out
" - All windows' file contents will be restored during zoomouts.
" - ZoomWin will clean up any temporary files it generates upon exit.
"
Plugin 'ZoomWin'

" ## Mark by Ingo Karkat {{{2
" This plugin adds mappings and a `:Mark` command to highlight several words in 
" different colors simultaneously, similar to the built-in `hlsearch`
" highlighting of search results and the `*` command. For example, when you 
" are browsing a big program file, you could highlight multiple identifiers in 
" parallel. This will make it easier to trace the source code. 
"
" `<Leader>m` Mark the word under the cursor, similar to the star command. The next free
" highlight group is used. If already on a mark: Clear the mark, like `<Leader>n`.
" Works also with visual selection in visual mode
"
" `[N]<Leader>m` With `[N]`, mark the word under the cursor with the named highlight 
" group `[N]`. When that group is not empty, the word is added as an alternative match, 
" so you can highlight multiple words with the same color. When the word is already 
" contained in the list of alternatives, it is removed. 
"
Plugin 'Mark'

" Colorschemes collection {{{2
" Flazz provide a nice collection of colorschemes
Plugin 'flazz/vim-colorschemes'

" Bufkill (improve buffers navigation) {{{2
" ------------------------------------
"
" When a buffer is deleted, the current window is also deleted. This can be avoided with
" :BD instead of :bd
" <Leader>bd            Delete a buffer
"
" If you change your mind you can still cancel the deletion
" <Leader>bundo         Undo kill buffer
"
" To move backwards/forwards through recently accessed buffers, use:
" :BB/:BF
" <Leader>bb            Previous buffer (with cursor preserve position)
" <Leader>bf            Next buffer (with cursor preserve position)
"
" To move to the alternate buffer whilst preserving cursor column use:
" :BA
" <Leader>ba
Plugin 'bufkill.vim'

" Toggle quickfix (vim-togglelist) {{{2
" --------------------------------
"
" A simple plugin for vim that allows you to bind a key to toggle the Location List and
" the Quickfix List.
"
" <Leader>l             Toggle location list
" <Leader>q             Toggle Quickfix list
"
Plugin 'milkypostman/vim-togglelist'
let g:toggle_list_no_mappings = 1

let mapleader = ","                    " Use a more convenient leader key

" Fakeclip {{{2
" --------
"
" Allow to use clipboard under Cygwin, X Window and Mac OS X
" Fakeclip is a Vim plugin to provide a pseudo |clipboard| register for
" several versions of Vim without |+clipboard| support, especially for non-GUI
" version of Vim.
"
" Vim has 26 normal registers "a .. z. The blackhole register _ is not touched by this
" plugin.
"
" Under Windows, the * and + registers are equivalent. For X11 systems, though, they
" differ. For X11 systems, * is the selection, and + is the cut buffer (like clipboard).
"
Plugin 'kana/vim-fakeclip'
let g:fakeclip_terminal_multiplexer_type="tmux"

" Taglist {{{2
" -------
"
" The "Tag List" plugin is a source code browser for the Vim editor. It provides an
" overview of the structure of source code files and allows you to efficiently browse
" through source code files in different programming languages.
"
" The taglist plugin groups and displays the functions, classes, structures,
" enumerations, macro definitions and other parts of a source code file in a Vim window.
" The taglist plugin will automatically highlight the current tag. You can jump to the
" definition of a tag by selecting the tag name from the taglist window.
Plugin 'taglist.vim'
let g:Tlist_Auto_Highlight_Tag = 1
let g:Tlist_Auto_Update = 1
let g:Tlist_WinWidth = 50

" Tagbar {{{2
" ------
"
" Tagbar is a vim plugin for browsing the tags of source code files. It provides
" a sidebar that displays the ctags-generated tags of the current file, ordered
" by their scope. This means that for example methods in C++ are displayed under
" the class they are defined in.
"
" It is a promising alternative to Taglist.
"
Plugin 'majutsushi/tagbar'
let g:tarbar_left = 1
let g:tagbar_iconchars = ['►', '▼'] " Set for consolas powerline

" Jedi Python {{{2
" -----------
"
" jedi-vim is a VIM binding to the autocompletion library.
"
" <C-Space>             Completion                                             (jedi-vim)
" <Leader>g             Goto assignment                                        (jedi-vim)
" <Leader>d             Goto definitions                                       (jedi-vim)
" <Leader>r             Renaming                                               (jedi-vim)
" <Leader>n             Usages                                                 (jedi-vim)
"
Plugin 'davidhalter/jedi-vim'

" Autochmodx {{{2
" ----------
"
" If a current file looks like an executable script, make it executable by running
" "chmod +x %".
"
" It works perfectly with bash, perl, python scripts. It also detects shebang tag.
"
Plugin 'tyru/autochmodx.vim'
let g:autochmodx_scriptish_file_patterns = [
\  '\c.*\.pl$',
\  '\c.*\.rb$',
\  '\c.*\.py$',
\  '\c.*\.sh$',
\ ]

" CtrlP (<C-p>) {{{2
" -------------
"
" Inspired from Sublime. Provide a nice solution to navigate and load files.
"
" Regex mode can be toggled on/off by pressing <c-r> inside the prompt.
Plugin 'kien/ctrlp.vim'

" c     Directory of the current file
" r     Nearest ancestor that contains .git, .hg, .svn
" a     like c but only if the current wd ouside of ctrp is not a direct ancestor
" 0     Disable this feature
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_cache_dir         = '~/.cache/ctrlp'

" Jump when <cr> is pressed
let g:ctrlp_switch_buffer     = 'e'

" By default set searching by filename (as opposed to full path)
let g:ctrlp_by_filename       = 1
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_cmd               = 'CtrlPMixed'
let g:ctrlp_match_window      = 'bottom,order:ttb,min:5,max:30,results:30'
let g:ctrlp_show_hidden       = 1
let g:ctrlp_max_files         = 1000
let g:ctrlp_max_depth         = 5
let g:ctrlp_follow_symblinks  = 1
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(contrib|keep|sbn|ovl|s|html|d|exe|so|dll|doj|bin|zip|tar|gz|iso|class|rar|swp|ldr|dpj|stk)$',
    \ 'link': 'some_bad_symbolic_links',
    \ }

" CtrlP Command Palette {{{2
" ---------------------
"
" This is an extension for the awesome vim CtrlP plugin.
"
" This extension adds a new CtrlP command, the :CtrlPCmdPalette, which allows you to
" find and run vim commands (internal or custom).
"
" Now you can call :CtrlPCmdPalette, or map it to a keybinding
Plugin 'fisadev/vim-ctrlp-cmdpalette'  " Command palette for ctrlp
let g:ctrlp_cmdpalette_execute=1

" NERDTree {{{2
" --------
"
" File Explorer
"
Plugin 'scrooloose/nerdtree'           " File explorer
let g:NERDTreeDirArrows  = 1           " Show nice arrows instead of |+
let g:NERDTreeShowHidden = 1           " Show hidden files
let g:NERDTreeWinPos     = "left"      " Window position
let g:NERDTreeWinSize    = 50          " Width of the NERDTree sidebar

" Open NERDTree automatically when vim starts up if no files were specified
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close vim if NERDTree is the last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Multiple-cursors {{{2
" ----------------
"
" There have been many attempts at bringing Sublime Text's awesome multiple selection
" feature into Vim, but none so far have been in my opinion a faithful port that is
" simplistic to use, yet powerful and intuitive enough for an existing Vim user.
" vim-multiple-cursors is yet another attempt at that.
"
" <C-n>                 Select cursor under cursor
"
Plugin 'terryma/vim-multiple-cursors'  " Sublime's multiple selection feature
"let g:multi_cursor_use_default_mapping=1
"let g:multi_cursor_next_key  = '<C-b>'
"let g:multi_cursor_start_key = '<C-b>'
"let g:multi_cursor_quit_key  = '<Esc>'


" Ag/Ack {{{2
"
" Ag the silver searcher is a faster alternative to ack which is better than grep.
" Depending on your installation. Load the corresponding plugin.
if executable('ag')
    Plugin 'rking/ag.vim'                  " Better than Ack
else
    Plugin 'mileszs/ack.vim'               " Use the Perl module App::Ack
endif

" Goyo {{{2
"
" Distraction-free writing in Vim.
"
Plugin 'junegunn/goyo.vim'

" PCRE regex for Vim {{{2
" ------------------
"
" Will remap the default / search with :M/
"
Plugin 'othree/eregex.vim'
let g:eregex_default_enable = 1

" Voom {{{2
" ----
"
" An outliner for vim. It works like Tagbar or Taglist but without ctags.
"
" The supported format are:
" rest  -- reStructuredText section titles;
" markdown  -- Markdown headers, both Setext-style and Atx-style;
" pandoc    -- Pandoc Markdown;
" latex  -- LaTeX sectioning and some other commands;
" html  -- HTML heading tags, single line only;
" python  -- Python code browser, blocks between 'class' and 'def' are also nodes.
Plugin 'vim-scripts/VOoM'

" Eunuch (Rename buffer) {{{2
" ----------------------
"
" Vim sugar for the UNIX shell commands that need it the most. Features include:
"
" :Remove: Delete a buffer and the file on disk simultaneously.
" :Unlink: Like :Remove, but keeps the now empty buffer.
" :Move: Rename a buffer and the file on disk simultaneously.
" :Rename: Like :Move, but relative to the current file's containing directory.
" :Chmod: Change the permissions of the current file.
" :Mkdir: Create a directory, defaulting to the parent of the current file.
" :Find: Run find and load the results into the quickfix list.
" :Locate: Run locate and load the results into the quickfix list.
" :Wall: Write every open window. Handy for kicking off tools like guard.
" :SudoWrite: Write a privileged file with sudo.
" :SudoEdit: Edit a privileged file with sudo.
Plugin 'tpope/vim-eunuch'



" Markdown conceal {{{2
" ----------------
"
" A variation of the vim-markdown syntax highlighting, matching rules and mappings for
" the original Markdown and extensions for viewing Markdown. This version cleans up
" Markdown syntax for easier reading using the conceal feature available in Vim 7.3 or
" later, and seems to make the most sense in use alongside things like less.vim and
" vimpager.
"
Plugin 'prurigro/vim-markdown-concealed'


call vundle#end()
filetype plugin on
filetype indent on
" }}}1
" Settings {{{1
" =========

" Misc options
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
set number
set whichwrap+=<,>,h,l                 " Allow to use arrow keys to move in Visual Mode
set virtualedit=all                    " Allow to place cursor at any location
set cursorline                         " Highlight current line
autocmd WinLeave * setlocal nocursorline
autocmd WinEnter * setlocal cursorline
set colorcolumn=90
autocmd WinLeave * setlocal colorcolumn=0
autocmd WinEnter * setlocal colorcolumn=90
set writeany                           " Allow writing to any file with no need for "!" override
set backspace=eol,start,indent         " Allow backspacing over CR autoindent and start of insert
set helpheight=999
set winminheight=0
set ttimeoutlen=0                      " Reduce the delay with <esc> when escaping from insert mode
set timeoutlen=200
set shortmess=aoA
set nrformats-=octal
set ttyfast                            " Send more chars to redraw in CTERM
set lazyredraw                         " Buffer screen updates instead of updating al the time
set cryptmethod=blowfish

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

if executable('ack')
    set grepprg=ack\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow\ $*
    set grepformat=%f:%l:%c:%m
endif
if executable('ag')
    set grepprg=ag\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow
    set grepformat=%f:%l:%c:%m
endif

" Format/Linebreak {{{2
set linebreak                          " Break at a char in "breakat"
set autoindent                         " Copy indent form current line when starting a new line
set smartindent                        " Automatic indent after a line ending in { ...
set nowrap                             " Not Automatic wrap long lines
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
set foldcolumn=0
" Settings: Backup {{{2
set nobackup                           " Disable backup
set noswapfile                         " Disable swap because sometime swapfile is in readonly
" Settings: Conceal {{{2
if has('conceal')
    set conceallevel=2        " Hide conceal chars
    set concealcursor="nvic"    " Show conceal chars on cursorline for all modes
    set listchars+=conceal:Δ
endif

" Split Windows
set splitright                         " New vertical split always at the right of the current window
set splitbelow                         " New horizontal split always at the bottom of the current window

" Diff
set diffopt+=filler,iwhite,icase,vertical

" Status line
set fillchars=fold:─,vert:│            " Separator for status window
set laststatus=2                       " Always the status of the last window
set showcmd                            " Show commands being typed in the bottom right corner
set viminfo='1000,<50,f100,s10,:1000,@10,h

" Display unprintable chars
set list
set listchars=tab:▸\ "
set listchars+=extends:›
set listchars+=precedes:‹
set listchars+=nbsp:˽
set showbreak=⌐

" Auto complete setting
set completeopt=menuone,longest

" Vim's language
if s:is_windows && has('gui')
    language messages en
endif

" Default font and encoding {{{2
" -------------------------

" Default font
if s:is_windows
    set guifont=Powerline_Consolas:h9:cANSI
    set guioptions=                      " No menu, no toolbar, no scrollbars
else
    set guifont=Powerline\ Consolas\ 10
endif

" Encoding
set encoding=utf8
setglobal fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,latin1
set termencoding=utf-8

" Filetypes
set ffs=unix,dos,mac

" Default shell and directories {{{2
" -----------------------------
if s:is_windows
    set shell=c:\windows\system32\cmd.exe
    set runtimepath^=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
    cd ~
endif

" Colorscheme {{{2
" -----------
syntax on
colorscheme nowox

" Terminal {{{2
" --------
if exists("$TMUX")
    set term=screen-256color
endif

" Prefer using pipe instead of temp files for shell commands.
set noshelltemp

" Mouse {{{2
" -----
set mouse      =a                     " Use mouse in All modes
set mousefocus                         " Activate windows on mouseover
set selectmode =mouse,key
set mousemodel =popup
set keymodel   =startsel,stopsel
set selection  =exclusive
set ttymouse=xterm2


" }}}1
" Mapping {{{1
" =======

" Improve vim's behavior, get rid of legacies {{{2
" -------------------------------------------
"
" Some default behavior of vim that is not logical anymore in our modern and
" technological world.
"

" Correct cursor movement for long lines
noremap j gj
noremap k gk

" Backspace will delete the char before cursor
"vnoremap <BS> X
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

" jj is back to normal mode
inoremap <silent> jj <C-O>:stopinsert<CR>

" Insertion mode on enter
noremap <cr> i<cr>

" Current word highlight
noremap <silent> à mP*N`P

" Disable highlight search
noremap <silent> é :noh<cr>

" $ to move physically at the end of the line
" (Virtualedit must be enabled)
noremap <End>    $l

" Displacement using arrows
vnoremap <Down> j
vnoremap <Up> k
vnoremap <Left> h
vnoremap <Right> l
snoremap <Down> <Esc>
snoremap <Up> <Esc>
snoremap <Right> <Esc>
snoremap <Left> <Esc>
snoremap <Bs>  <Bs>

" <tab> Tabbing visual selection
nnoremap           <Tab>        >>
nnoremap           <S-Tab>      <<
inoremap           <S-Tab> <c-o><<
vnoremap           <Tab>        >gv
vnoremap           <S-Tab>      <gv

" Search with <space>
map                <space> /

" Home goes to the first non white space of the line
noremap <Home> ^
inoremap <silent> <Home> <C-c>^i

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

" Bubble single lines
nmap <C-Up> ddkP
nmap <C-Down> ddp

" Bubble multiple lines
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]

" Delete words in insert mode
inoremap dda <C-c>dv1bi
inoremap ddb <C-c>dv2bi
inoremap ddc <C-c>dv3bi
inoremap ddd <C-c>dv4bi
inoremap dde <C-c>dv5bi
inoremap ddf <C-c>dv6bi
inoremap ddg <C-c>dv7bi
inoremap ddh <C-c>dv8bi
inoremap ddi <C-c>dv9bi

inoremap dd1 <C-c>dv1bi
inoremap dd2 <C-c>dv2bi
inoremap dd3 <C-c>dv3bi
inoremap dd4 <C-c>dv4bi
inoremap dd5 <C-c>dv5bi
inoremap dd6 <C-c>dv6bi
inoremap dd7 <C-c>dv7bi
inoremap dd8 <C-c>dv8bi
inoremap dd9 <C-c>dv9bi

" Mappings: CTRL {{{2

" <C-Tab> <C-S-Tab> Next/Previous buffer {{{3
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
    " <C-Tab> Next buffer
    map <silent> <C-Tab> :bn!<cr>
    imap <silent> <C-Tab> <esc>:bn!<cr>a
    vmap <silent> <C-Tab> <c-c>:bn!<cr>

    " <C-S-Tab> Previous buffer
    map <silent> <C-S-Tab> :bp!<cr>
    imap <silent> <C-S-Tab> <esc>:bp!<cr>a
    vmap <silent> <C-S-Tab> <c-c>:bp!<cr>
endif

" <C-a> Select all {{{3
inoremap           <C-a>   <esc>ggVG
nnoremap           <C-a>        ggVG

" <C-b> Reserved for Tmux prefix {{{3
"
" Nothing here
"

" <C-c> Copy word/selection {{{3
"  - Copy word under cursor if no selection
"  - Copy selection
inoremap <silent>  <c-c> <esc>m`viw"+y``a
nnoremap <silent>  <c-c> <esc>m`viw"+y``
vnoremap           <c-c> "+y

" <C-d> Replace word under cursor (Delete a word with no yank) {{{3
inoremap <silent>  <c-d>   <c-c>"_ciw
nnoremap <silent>  <c-d>   "_ciw

" <C-e> Decrement the next number on current line {{{3
nnoremap <silent>  <c-e>   :<c-u>call AddSubtract("\<c-x>", '')<CR>
function! AddSubtract(char, back)
    let pattern = &nrformats =~ 'alpha' ? '[[:alpha:][:digit:]]' : '[[:digit:]]'
    call search(pattern, 'cw' . a:back)
    execute 'normal! ' . v:count1 . a:char
    silent! call repeat#set(":\<C-u>call AddSubtract('" .a:char. "', '" .a:back. "')\<CR>")
endfunction

" <C-f> Search for work/selection {{{3
nnoremap           <c-f>   /<C-u><C-r>=Escape(expand('<cword>'))<CR>
inoremap           <c-f>   <esc>/<C-u><C-r>=Escape(expand('<cword>'))<CR>
vnoremap           <c-f>   /<C-u><C-r>=GetVisualSelection()<CR>

" <C-g> Alternate buffer {{{3
nnoremap <c-g> <C-^>
inoremap <c-g> <C-^>
vnoremap <c-g> <C-^>

" <C-h> Replacement {{{3
nnoremap <c-h> :<C-u>%s/<C-r>=Escape(expand('<cword>'))<CR>//g<left><left>
inoremap <c-h> <esc>:%s/<C-r>=Escape(expand('<cword>'))<CR>//g<left><left>
vnoremap <c-h> :<C-u>%s/<C-r>=GetVisualSelection()<CR>//g<left><left>

" <C-i> {{{3
"
" Cannot be mapped, already binded to <Tab>
"

" <C-j> Add an empty line below the cursor [Disabled] {{{3
"nnoremap <silent> <C-j> m`o<esc>``
"inoremap <silent> <C-j> <esc>m`o<esc>``a

" <C-k> Add an empty line above the cursor [Disabled] {{{3
"nnoremap <silent> <c-k> m`O<esc>``
"inoremap <silent> <c-k> <esc>m`O<esc>``a

" <C-l> (free) {{{3


" <C-m> {{{3
"
" Cannot be mapped, same as <CR>
"

" <C-n> Multiple cursors start {{{3
"
" Start multiple cursor mode
"

" <C-o> {{{3
noremap            <C-o>    :CtrlPBuffer<CR>
vnoremap           <C-o>    <C-c>:CtrlPBuffer<CR>
inoremap           <C-o>    <C-o>:CtrlPBuffer<CR>

" <C-P> CtrlP {{{3
"
" Previously loaded with ctrlp plugin
"

" <C-q> Blockwise visual mode {{{3
noremap            <C-q>    <C-v>

" <C-q> what did <C-v> before {{{3
inoremap           <C-q>    <c-v>

" <C-r> Redo {{{3

" <C-s> Save {{{3
noremap            <C-s>    :update!<CR>
vnoremap           <C-s>    <C-c>:update!<CR>
inoremap           <C-s>    <C-o>:update!<CR>

" <C-t> Tag completion (Ctags) {{{3
inoremap <c-t> <c-x><c-]>

" <C-u> Interrupt current search {{{3
noremap <c-u> <c-c>

" <c-v> Paste {{{3
noremap            <C-v>    "+gP
cmap               <C-v>    <C-R>+

" Pasting blockwise and linewise selections is not possible in Insert and
" Visual mode without the +virtualedit feature.  They are pasted as if they
" were characterwise instead.
" Uses the paste.vim autoload script.

exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']
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

" <C-x> Cut word/selection {{{3
inoremap <C-x> <esc>m`viw"+y``"_diwa
nnoremap <silent>  <C-x> <esc>m`viw"+y``"_diw
vnoremap <C-x> "+x

" <C-y> Increment closest number {{{3
nnoremap <silent> <c-y> :<c-u>call AddSubtract("\<c-a>", '')<CR>

" <C-z> Suspend vim {{{3
"
" Suspend and goes to shell. Can come back with |fg|
"

" <C-Home> Real start of a line {{{3
inoremap <C-Home>   <C-c>0i
nnoremap <C-Home>   0
inoremap <C-End>    <C-c>$gea
nnoremap <C-End>    $gel

" <A-?> {{{2
" -----

" <A-j> Move screen down {{{3
set <f32>=j
noremap <f32> <C-y>j
inoremap <f32> <C-y><C-o>j

" <A-k> Move screen up {{{3
set <f33>=k
noremap <f33> <C-e>k
inoremap <f33> <C-e><C-o>k

" <F?> {{{2
" ----

" <F1> Help {{{3
"
" Already mapped by default
"

" <C-F1> Help in full screen {{{3
nnoremap <c-F1> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>

" <F2> File explorer (NERD Tree) {{{3
noremap  <silent> <F2> :NERDTreeToggle<CR>
inoremap <silent> <F2> <c-O>:NERDTreeToggle<CR>

" <F3> Taglist pane {{{3
noremap  <silent> <F3> :TlistToggle<CR>
vnoremap <silent> <F3> <c-C>:TlistToggle<CR>
inoremap <silent> <F3> <c-O>:TlistToggle<CR>

" <F4> Tagbar {{{3
noremap  <silent> <F4> :TagbarToggle<CR>
vnoremap <silent> <F4> <c-C>:TagbarToggle<CR>
inoremap <silent> <F4> <c-O>:TagbarToggle<CR>

" <F6> Toggle Voom {{{3
nnoremap <silent> <F6> :VoomToggle<CR>
vnoremap <silent> <F6> <c-C>:VoomToggle<CR>
inoremap <silent> <F6> <c-O>:VoomToggle<CR>

" <F7> Toggle GUI options (menu, tools, scrollbars) {{{3
nnoremap <F7> :call ToggleFlag('guioptions','mrT')<cr>
inoremap <F7> <c-C>:call ToggleFlag('guioptions','mrT')<cr>

" <F8> Toggle colorscheme {{{3
nnoremap <F8> :call NextColor(1)<CR>
nnoremap <S-F8> :call NextColor(-1)<CR>
nnoremap <A-F8> :call NextColor(0)<CR>

" <F10> Toggle quickfix window {{{3
noremap  <silent> <F10> :call ToggleQuickfixList()<CR>
vnoremap <silent> <F10> <C-C>:call ToggleQuickfixList()<CR>
inoremap <silent> <F10> <C-O>:call ToggleQuickfixList()<CR>

" <F11> Toggle numbers {{{3
noremap  <silent> <F11> :call ToggleNumber()<CR>
vnoremap <silent> <F11> <c-C>:call ToggleNumber()<CR>
inoremap <silent> <F11> <c-O>:call ToggleNumber()<CR>
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

" <F12> Remove trailing spaces {{{3
noremap  <silent> <F12> :FixWhitespace<CR>
vnoremap <silent> <F12> <c-C>:FixWhitespace<CR>
inoremap <silent> <F12> <c-O>:FixWhitespace<CR>
function! s:FixWhitespace(line1,line2)
    let l:save_cursor = getpos(".")
    silent! execute ':' . a:line1 . ',' . a:line2 . 's/\s\+$//'
    call setpos('.', l:save_cursor)
endfunction
command! -range=% FixWhitespace call <SID>FixWhitespace(<line1>,<line2>)

" <Leader> {{{2
" --------

" <Leader>v Edit .vimrc {{{3
noremap <leader>v :edit ~/.vimrc<cr>

" <Leader>V Reload .vimrc {{{3
noremap <leader>V :source ~/.vimrc<cr>

" <Leader>w Wrap/Nowrap toggle {{{3
noremap <silent>    <leader>w       :set wrap!<cr>

" <Mouse> {{{2

" <2-RightMouse> Highlight the word under cursor {{{3
noremap <silent> <2-RightMouse> :let @/='\V\<'.escape(expand('<cword>'), '\').'\>'<cr>:set hls<cr>


" }}}1

" Tmux {{{1
if &term =~ '^screen' && exists('$TMUX')
    set mouse+=a
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
    " tmux will send xterm-style keys when xterm-keys is on
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
endif
"}}}1
" Abbreviation {{{1

" xxfile {{{2
ab xxfile <C-R>=Filename()<cr>
fun! Filename()
    return expand("%:t")
endfun

" xxdate {{{2
ab xxdate <C-R>=DateTime()<cr>
fun! DateTime()
    return strftime("%Y-%m-%d %a %I:%M %p")
endfun

" Functions {{{1

" Present Colorscheme (light) {{{2
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

" ##Autocommands {{{1

" ###Config group {{{2
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
    autocmd BufEnter *.cseq setlocal filetype=c
    autocmd BufEnter *.ldf setlocal filetype=ldf
    autocmd BufEnter *.tex map <leader>ll :Latexmk<cr>
    autocmd BufEnter *.ldf setlocal foldmethod=marker | set foldlevel=0
    autocmd BufEnter *.c   setlocal foldmethod=syntax
augroup END

" ###Vimrc {{{2
" Here I set foldmethod for my .vimrc
"
augroup vimrc
    autocmd!
    autocmd BufEnter .vimrc setlocal foldmethod=marker | set foldlevel=0
augroup END

" ###Shebang {{{2
" Automatically add shebang to specific filetypes.
"
augroup shebang
"  autocmd BufNewFile *.py 0put =\"#!/usr/bin/env python\<nl># Author: Yves Chevallier<nl># Date:\".strftime("%d/%m/%y %H:%M:%S")|$
  autocmd BufNewFile *.rb 0put =\"#!/usr/bin/env ruby\<nl># Author: Yves Chevallier\<nl>Date: \<nl>\"|$
  autocmd BufNewFile *.pl 0put =\"#!/usr/bin/env perl\<nl># Author: Yves Chevallier\<nl>Date: \<nl>\"|$
  autocmd BufNewFile *.tex 0put =\"%&plain\<nl>\"|$
augroup END

" ###GPG Encryption {{{2
" Transparent editing of gpg encrypted files (by Wouter Hanegraaff)
"
augroup encrypted
  au!
  " First make sure nothing is written to ~/.viminfo while editing
  " an encrypted file.
  autocmd BufReadPre,FileReadPre *.gpg set viminfo=
  " We don't want a swap file, as it writes unencrypted data to disk
  autocmd BufReadPre,FileReadPre *.gpg set noswapfile
 
  " Switch to binary mode to read the encrypted file
  autocmd BufReadPre,FileReadPre *.gpg set bin
  autocmd BufReadPre,FileReadPre *.gpg let ch_save = &ch|set ch=2
  " (If you use tcsh, you may need to alter this line.)
  autocmd BufReadPost,FileReadPost *.gpg '[,']!gpg --decrypt 2> /dev/null
 
  " Switch to normal mode for editing
  autocmd BufReadPost,FileReadPost *.gpg set nobin
  autocmd BufReadPost,FileReadPost *.gpg let &ch = ch_save|unlet ch_save
  autocmd BufReadPost,FileReadPost *.gpg execute ":doautocmd BufReadPost " . expand("%:r")
 
  " Convert all text to encrypted text before writing
  " (If you use tcsh, you may need to alter this line.)
  autocmd BufWritePre,FileWritePre *.gpg '[,']!gpg --default-recipient-self -ae 2>/dev/null
  " Undo the encryption so we are back in the normal text, directly
  " after the file has been written.
  autocmd BufWritePost,FileWritePost *.gpg u
augroup END

" ##Functions {{{1
"
" ###Folding text format {{{2
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
"
"
" ##Keyboard mapping summary {{{1
"
" ###Any modes
"
" |    Mapping     |     Description                                       |   Plugin   |
" |:---------------|:------------------------------------------------------|:----------:|
" | `<Leader>bb`   | Previous buffer (with cursor preserve position)       | bufkill    |
" | `<Leader>bf`   | Next buffer (with cursor preserve position)           | bufkill    |
" | `<Leader>bd`   | Delete a buffer                                       | bufkill    |
" | `<Leader>bundo`| Undo kill buffer                                      | bufkill    |
" | `<Leader>ba`   | Alternate buffer                                      | bufkill    |
" | `<Leader>l`    | Toggle location list                                  | togglelist |
" | `<Leader>m`    | Highlight current word/selection with new color group | mark       |
" | `<Leader>n`    | Remove mark on word/selection                         | mark       |
" | `<Leader>q`    | Toggle Quickfix list                                  | togglelist |
"
" ###Normal mode
"
" |    Mapping     |     Description                                       |   Plugin   |
" |:---------------|:------------------------------------------------------|:----------:|
" | `à`            | Highlight current word                                |            |
" | `é`            | Disable word highlight                                |            |
" | `<Tab>`        | Indent line/selection                                 |            |
" | `<S-Tab>`      | Unindent line/selection                               |            |
" | `<Space>`      | Search                                                |            |
" | `Q`            | Format selected paragraph                             |            |
" | `Z`            | Ag search                                             |            |
"

" <C-a>                 Select all
" <C-n>                 Select cursor under cursor                     (multiple-cursors)
" <C-p>                 Full path fuzzy file finder                               (ctrlp)
" <C-Up>                Bubble up line/selection
" <C-Down>              Bubble down line/selection
" <C-Tab>               Next bufofber
" <C-S-Tab>             Previous fbuffer
"
" Command Mode:
" <C-r>                 Regex search                                              (ctrlp)
" <C-d>                 Search by filename enable/disable                         (ctrlp)
