
<center> <h1>Another .vimrc</h1> </center>


<a name="Motivations"></a>
#1. Motivations
I am not convinced traditional vim users are more efficient than sublime's or atom's
users. However, I am truly convinced that vim can be configured to be used in a more
modern way. For instance, I feel using `<C-c>` and `<C-v>` for copy/paste is the first
step in this tiny revolution. Almost every terminal emulators can now capture Ctrl + key
Why not to start using them extensively?

The Markdown output is generated with vim2doc Perl script:

    ~/.scripts/vim2doc ~/.vimrc > ~/.doc/vimrc.md


<a name="Table_of_contents"></a>
#2. Table of contents


- - -

1. [Motivations](#Motivations)
2. [Table of contents](#Table_of_contents)
3. [At first](#At_first)
4. [Plugins](#Plugins)
4.1. [Lorem Ipsum](#Lorem_Ipsum)
4.2. [Zoomwin](#Zoomwin)
4.3. [Mark by Ingo Karkat](#Mark_by_Ingo_Karkat)
4.4. [Colorschemes collection](#Colorschemes_collection)
4.5. [Bufkill (improve buffers navigation)](#Bufkill__improve_buffers_navigation_)
4.6. [Toggle quickfix (vim-togglelist)](#Toggle_quickfix__vim_togglelist_)
4.7. [Fakeclip](#Fakeclip)
4.8. [Taglist](#Taglist)
4.9. [Tagbar](#Tagbar)
4.10. [Jedi Python](#Jedi_Python)
4.11. [Autochmodx](#Autochmodx)
4.12. [CtrlP](#CtrlP)
4.13. [CtrlP Command Palette](#CtrlP_Command_Palette)
4.14. [NERDTree](#NERDTree)
4.15. [Multiple-cursors](#Multiple_cursors)
4.16. [Ag/Ack](#Ag_Ack)
4.17. [Goyo](#Goyo)
4.18. [PCRE regex for Vim](#PCRE_regex_for_Vim)
4.19. [Voom](#Voom)
4.20. [Eunuch (Rename buffer)](#Eunuch__Rename_buffer_)
4.21. [Markdown conceal](#Markdown_conceal)
5. [Settings](#Settings)
5.1. [Misc options](#Misc_options)
5.2. [Alerts](#Alerts)
5.3. [Search/Find/Replace](#Search_Find_Replace)
5.4. [Format/Linebreak](#Format_Linebreak)
5.5. [Indentation/Tabs](#Indentation_Tabs)
5.6. [Folds](#Folds)
5.7. [Backup](#Backup)
5.8. [Conceal](#Conceal)
5.9. [Split Windows](#Split_Windows)
5.10. [Diff](#Diff)
5.11. [Status line](#Status_line)
5.12. [Display unprintable chars](#Display_unprintable_chars)
5.13. [Auto complete setting](#Auto_complete_setting)
5.14. [Vim's language](#Vim_s_language)
5.15. [Default font and encoding](#Default_font_and_encoding)
5.15.1. [Default font](#Default_font)
5.15.2. [Encoding](#Encoding)
5.15.3. [Filetypes](#Filetypes)
5.16. [Default shell and directories](#Default_shell_and_directories)
5.17. [Colorscheme](#Colorscheme)
5.18. [Terminal](#Terminal)
5.19. [Mouse](#Mouse)
6. [Mapping](#Mapping)
6.1. [Improve vim's behavior, get rid of legacies](#Improve_vim_s_behavior__get_rid_of_legacies)
6.2. [<C-?> Control + key](#_C____Control___key)
6.2.1. [<C-Tab> <C-S-Tab> Next/Previous buffer](#_C_Tab___C_S_Tab__Next_Previous_buffer)
6.2.2. [<C-a> Select all](#_C_a__Select_all)
6.2.3. [<C-b> Reserved for Tmux prefix](#_C_b__Reserved_for_Tmux_prefix)
6.2.4. [<C-c> Copy word/selection](#_C_c__Copy_word_selection)
6.2.5. [<C-d> Replace word under cursor (Delete a word with no yank)](#_C_d__Replace_word_under_cursor__Delete_a_word_with_no_yank_)
6.2.6. [<C-e> Decrement the next number on current line](#_C_e__Decrement_the_next_number_on_current_line)
6.2.7. [<C-f> Search for work/selection](#_C_f__Search_for_work_selection)
6.2.8. [<C-g> Alternate buffer](#_C_g__Alternate_buffer)
6.2.9. [<C-h> Replacement](#_C_h__Replacement)
6.2.10. [<C-i>](#_C_i_)
6.2.11. [<C-j> Add an empty line below the cursor [Disabled]](#_C_j__Add_an_empty_line_below_the_cursor__Disabled_)
6.2.12. [<C-k> Add an empty line above the cursor [Disabled]](#_C_k__Add_an_empty_line_above_the_cursor__Disabled_)
6.2.13. [<C-l> (free)](#_C_l___free_)
6.2.14. [<C-m>](#_C_m_)
6.2.15. [<C-n> Multiple cursors start](#_C_n__Multiple_cursors_start)
6.2.16. [<C-o>](#_C_o_)
6.2.17. [<C-P> CtrlP](#_C_P__CtrlP)
6.2.18. [<C-q> Blockwise visual mode](#_C_q__Blockwise_visual_mode)
6.2.19. [<C-q> what did <C-v> before](#_C_q__what_did__C_v__before)
6.2.20. [<C-r> Redo](#_C_r__Redo)
6.2.21. [<C-s> Save](#_C_s__Save)
6.2.22. [<C-t> Tag completion (Ctags)](#_C_t__Tag_completion__Ctags_)
6.2.23. [<C-u> Interrupt current search](#_C_u__Interrupt_current_search)
6.2.24. [<c-v> Paste](#_c_v__Paste)
6.2.25. [<C-w> Window command (Split)](#_C_w__Window_command__Split_)
6.2.26. [<C-x> Cut word/selection](#_C_x__Cut_word_selection)
6.2.27. [<C-y> Increment closest number](#_C_y__Increment_closest_number)
6.2.28. [<C-z> Suspend vim](#_C_z__Suspend_vim)
6.2.29. [<C-Home> Real start of a line](#_C_Home__Real_start_of_a_line)
6.3. [<A-?> Alt + key](#_A____Alt___key)
6.3.1. [<A-j> Move screen down](#_A_j__Move_screen_down)
6.3.2. [<A-k> Move screen up](#_A_k__Move_screen_up)
6.4. [<F?> Function number](#_F___Function_number)
6.4.1. [<F1> Help](#_F1__Help)
6.4.2. [<C-F1> Help in full screen](#_C_F1__Help_in_full_screen)
6.4.3. [<F2> File explorer (NERD Tree)](#_F2__File_explorer__NERD_Tree_)
6.4.4. [<F3> Taglist pane](#_F3__Taglist_pane)
6.4.5. [<F4> Tagbar](#_F4__Tagbar)
6.4.6. [<F6> Toggle Voom](#_F6__Toggle_Voom)
6.4.7. [<F7> Toggle GUI options (menu, tools, scrollbars)](#_F7__Toggle_GUI_options__menu__tools__scrollbars_)
6.4.8. [<F8> Toggle colorscheme](#_F8__Toggle_colorscheme)
6.4.9. [<F10> Toggle quickfix window](#_F10__Toggle_quickfix_window)
6.4.10. [<F11> Toggle numbers](#_F11__Toggle_numbers)
6.4.11. [<F12> Remove trailing spaces](#_F12__Remove_trailing_spaces)
6.5. [<Leader> Vim's prefix](#_Leader__Vim_s_prefix)
6.5.1. [<Leader>v Edit .vimrc](#_Leader_v_Edit__vimrc)
6.5.2. [<Leader>vd Generate the .vimrc documentation](#_Leader_vd_Generate_the__vimrc_documentation)
6.5.3. [<Leader>V Reload .vimrc](#_Leader_V_Reload__vimrc)
6.5.4. [<Leader>w Wrap/Nowrap toggle](#_Leader_w_Wrap_Nowrap_toggle)
6.6. [<Mouse> Mouse key binding](#_Mouse__Mouse_key_binding)
6.6.1. [<2-RightMouse> Highlight the word under cursor](#_2_RightMouse__Highlight_the_word_under_cursor)
7.6. [Tmux](#Tmux)
8.6. [Abbreviation](#Abbreviation)
8.7. [xxfile](#xxfile)
8.8. [xxdate](#xxdate)
9. [Functions](#Functions)
10. [Autocommands](#Autocommands)
10.1. [Config group](#Config_group)
10.2. [Vimrc](#Vimrc)
10.3. [Shebang](#Shebang)
10.4. [GPG Encryption](#GPG_Encryption)
11. [Functions](#FunctionsW)
11.1. [Folding text format](#Folding_text_format)
12. [Keyboard mapping summary](#Keyboard_mapping_summary)
12.1. [Any modes](#Any_modes)
12.2. [Normal mode](#Normal_mode)
12.3. [Command Mode](#Command_Mode)





<a name="At_first"></a>
#3. At first
We reset all the previous settings and enter in no-compatible mode. We stop using vim
in legacy mode.

`set all&`  Reset all settings
`set nocompatible`  be Vi iMproved
Depending on the architecure, one has setup vim differently. Let's discover which is
the used architecture. I am mainly using Vim on Windows, Cygwin and Linux.
Start Vundle our package manager.

```vimscript
let s:is_windows = has("win16") || has("win32") || has("win64")|| has("win95")
let s:is_cygwin  = has('win32unix')
let s:is_macvim  = has('gui_macvim')
```

Vundle is like Pathogen, it's a package manager for vim. Packages can be easily
installed, removed and updated.

To install a new package just type `:BundleInstall` and for update `:BundleUpdate`.

Before anything, we need to disable `filetype`.


<a name="Plugins"></a>
#4. Plugins

```vimscript
filetype off
set  runtimepath +=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
```

This section contains all the plugins I am using with Vim.

<a name="Lorem_Ipsum"></a>
##4.1. Lorem Ipsum
[LoremIpsum](http://lipsum.com/) is simply dummy text of the printing and typesetting 
industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, 
when an unknown printer took a galley of type and scrambled it to make a type specimen 
book. It has survived not only five centuries, but also the leap into electronic 
typesetting, remaining essentially unchanged. It was popularised in the 1960s with the
release of Letraset sheets containing Lorem Ipsum passages, and more recently with 
desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.

Usage is

    :Loremipsum[!] [WORDCOUNT] [PARAGRAPH_TEMPLATE] [PREFIX POSTFIX]

For example you can use `:Loremipsum 42` to generate 42 words.


<a name="Zoomwin"></a>
##4.2. Zoomwin

```vimscript
Plugin 'loremipsum'
```

When working with windows (splits), it is sometime nice to go in full screen. This 
plugin provide this with `<C-w>o` to enable/disable the full screen mode.

- Files are made hidden during zoom-in and restored upon zoom-out
- All windows' file contents will be restored during zoomouts.
- ZoomWin will clean up any temporary files it generates upon exit.


<a name="Mark_by_Ingo_Karkat"></a>
##4.3. Mark by Ingo Karkat

```vimscript
Plugin 'ZoomWin'
```

This plugin adds mappings and a `:Mark` command to highlight several words in 
different colors simultaneously, similar to the built-in `hlsearch`
highlighting of search results and the `*` command. For example, when you 
are browsing a big program file, you could highlight multiple identifiers in 
parallel. This will make it easier to trace the source code. 

`<Leader>m` Mark the word under the cursor, similar to the star command. The next free
highlight group is used. If already on a mark: Clear the mark, like `<Leader>n`.
Works also with visual selection in visual mode

`[N]<Leader>m` With `[N]`, mark the word under the cursor with the named highlight 
group `[N]`. When that group is not empty, the word is added as an alternative match, 
so you can highlight multiple words with the same color. When the word is already 
contained in the list of alternatives, it is removed. 


<a name="Colorschemes_collection"></a>
##4.4. Colorschemes collection

```vimscript
Plugin 'Mark'
```

(Flazz)[https://github.com/flazz/vim-colorschemes] provide a nice collection of 
colorschemes. I personnally like base16 and monokai.

<a name="Bufkill__improve_buffers_navigation_"></a>
##4.5. Bufkill (improve buffers navigation)

```vimscript
Plugin 'flazz/vim-colorschemes'
```

When a buffer is deleted, the current window is also deleted is this was the last 
buffer into it. This can be avoided with `:BD` instead of `:bd`

    <Leader>bd            " Delete a buffer

If you change your mind you can still cancel the deletion

    <Leader>bundo         " Undo kill buffer

To move backwards/forwards through recently accessed buffers, use `:BB` or `:BF`

    <Leader>bb            " Previous buffer (with cursor preserve position)
    <Leader>bf            " Next buffer (with cursor preserve position)

To move to the alternate buffer whilst preserving cursor column use `:BA`

    <Leader>ba            " Alternate buffer

<a name="Toggle_quickfix__vim_togglelist_"></a>
##4.6. Toggle quickfix (vim-togglelist)

```vimscript
Plugin 'bufkill.vim'
```

A simple plugin for vim that allows you to bind a key to toggle the Location List and
the Quickfix List.

    <Leader>l            " Toggle location list
    <Leader>q            " Toggle Quickfix list


<a name="Fakeclip"></a>
##4.7. Fakeclip

```vimscript
Plugin 'milkypostman/vim-togglelist'
```

Allow to use clipboard under Cygwin, X Window and Mac OS X
Fakeclip is a Vim plugin to provide a pseudo `clipboard` register for
several versions of Vim without `+clipboard` support, especially for non-GUI
version of Vim.

Vim has 26 normal registers `"a` .. `"z`. The blackhole register `_` is not touched 
by this plugin.

Under Windows, `*` and `+` registers are equivalent. For X11 systems, though, they
differ. For X11 systems, `*` is the selection, and `+` is the cut buffer.


<a name="Taglist"></a>
##4.8. Taglist

```vimscript
Plugin 'kana/vim-fakeclip'
let g:fakeclip_terminal_multiplexer_type="tmux"
```

The "Tag List" plugin is a source code browser for the Vim editor. It provides an
overview of the structure of source code files and allows you to efficiently browse
through source code files in different programming languages.

The taglist plugin groups and displays the functions, classes, structures,
enumerations, macro definitions and other parts of a source code file in a Vim window.
The taglist plugin will automatically highlight the current tag. You can jump to the
definition of a tag by selecting the tag name from the taglist window.

<a name="Tagbar"></a>
##4.9. Tagbar

```vimscript
Plugin 'taglist.vim'
let g:Tlist_Auto_Highlight_Tag = 1
let g:Tlist_Auto_Update = 1
let g:Tlist_WinWidth = 50
```

Tagbar is a vim plugin for browsing the tags of source code files. It provides
a sidebar that displays the ctags-generated tags of the current file, ordered
by their scope. This means that for example methods in C++ are displayed under
the class they are defined in.

It is a promising alternative to Taglist.

With `Powerline Consolas` font, I can use `►` and `▼` to display a folded/unfolded
section.


<a name="Jedi_Python"></a>
##4.10. Jedi Python

```vimscript
Plugin 'majutsushi/tagbar'
let g:tarbar_left = 1
let g:tagbar_iconchars = ['►', '▼'] " Set for consolas powerline
```

jedi-vim is a VIM binding to the autocompletion library.

    <C-Space>             " Completion       
    <Leader>g             " Goto assignment  
    <Leader>d             " Goto definitions 
    <Leader>r             " Renaming         
    <Leader>n             " Usages           

-

<a name="Autochmodx"></a>
##4.11. Autochmodx

```vimscript
Plugin 'davidhalter/jedi-vim'
```

If a current file looks like an executable script, make it executable by running
`chmod +x %`. It works perfectly with bash, perl, python scripts. It also detects 
the shebang.


<a name="CtrlP"></a>
##4.12. CtrlP

```vimscript
Plugin 'tyru/autochmodx.vim'
let g:autochmodx_scriptish_file_patterns = [
\  '\c.*\.pl$',
\  '\c.*\.rb$',
\  '\c.*\.py$',
\  '\c.*\.sh$',
\ ]
```

Inspired from SublimeText. Provide a nice solution to navigate and load files.

Regex mode can be toggled on/off by pressing <c-r> inside the prompt.
c     Directory of the current file

```vimscript
Plugin 'kien/ctrlp.vim'
```

r     Nearest ancestor that contains .git, .hg, .svn
a     like c but only if the current wd ouside of ctrp is not a direct ancestor
0     Disable this feature
ctrlp database will be stored by default here:

```vimscript
let g:ctrlp_working_path_mode = 'ra'
```

Jump when `<cr>` is pressed

```vimscript
let g:ctrlp_cache_dir         = '~/.cache/ctrlp'
```

By default set searching by filename (as opposed to full path)

```vimscript
let g:ctrlp_switch_buffer     = 'e'
```

And some other options

```vimscript
let g:ctrlp_by_filename       = 1
```


<a name="CtrlP_Command_Palette"></a>
##4.13. CtrlP Command Palette

```vimscript
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
```

This is an extension for the awesome vim CtrlP plugin.

This extension adds a new CtrlP command, the `:CtrlPCmdPalette`, which allows you to
find and run vim commands (internal or custom).

Now you can call `:CtrlPCmdPalette`, or map it to a keybinding

<a name="NERDTree"></a>
##4.14. NERDTree

```vimscript
Plugin 'fisadev/vim-ctrlp-cmdpalette'  " Command palette for ctrlp
let g:ctrlp_cmdpalette_execute=1
```

THE File Explorer, a must to have...

Close vim if NERDTree is the last window

```vimscript
Plugin 'scrooloose/nerdtree'           " File explorer
let g:NERDTreeDirArrows  = 1           " Show nice arrows instead of |+
let g:NERDTreeShowHidden = 1           " Show hidden files
let g:NERDTreeWinPos     = "left"      " Window position
let g:NERDTreeWinSize    = 50          " Width of the NERDTree sidebar
```


<a name="Multiple_cursors"></a>
##4.15. Multiple-cursors

```vimscript
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
```

There have been many attempts at bringing Sublime Text's awesome multiple selection
feature into Vim, but none so far have been in my opinion a faithful port that is
simplistic to use, yet powerful and intuitive enough for an existing Vim user.
vim-multiple-cursors is yet another attempt at that.

    <C-n>                 " Select cursor under cursor

-

<a name="Ag_Ack"></a>
##4.16. Ag/Ack

```vimscript
Plugin 'terryma/vim-multiple-cursors'
```

Ag the silver searcher is a faster alternative to ack which is better than grep.
Depending on your installation. Load the corresponding plugin.

<a name="Goyo"></a>
##4.17. Goyo

```vimscript
if executable('ag')
    Plugin 'rking/ag.vim'                  " Better than Ack
else
    Plugin 'mileszs/ack.vim'               " Use the Perl module App::Ack
endif
```

Distraction-free writing in Vim.

<a name="PCRE_regex_for_Vim"></a>
##4.18. PCRE regex for Vim

```vimscript
Plugin 'junegunn/goyo.vim'
```

Will remap the default `/` search with `:M/`

<a name="Voom"></a>
##4.19. Voom

```vimscript
Plugin 'othree/eregex.vim'
let g:eregex_default_enable = 1
```

An outliner for vim. It works like Tagbar or Taglist but without ctags.

The main supported format are:

| Language | Description                                        
|----------|----------------------------------------------------|
| rest     | reStructuredText section titles;                   |
| markdown | Markdown headers, both Setext-style and Atx-style; |
| pandoc   | Pandoc Markdown;                                   |
| latex    | LaTeX sectioning and some other commands;          |
| html     | HTML heading tags, single line only;               |
| python   | Python code browser                                |


<a name="Eunuch__Rename_buffer_"></a>
##4.20. Eunuch (Rename buffer)

```vimscript
Plugin 'vim-scripts/VOoM'
```

Vim sugar for the UNIX shell commands that need it the most. Features include:

| Command     | Description                                                          |
|-------------|----------------------------------------------------------------------|
| :Remove:    | Delete a buffer and the file on disk simultaneously.                 |
| :Unlink:    | Like :Remove, but keeps the now empty buffer.                        |
| :Move:      | Rename a buffer and the file on disk simultaneously.                 |
| :Rename:    | Like :Move, but relative to the current file's containing directory. |
| :Chmod:     | Change the permissions of the current file.                          |
| :Mkdir:     | Create a directory, defaulting to the parent of the current file.    |
| :Find:      | Run find and load the results into the quickfix list.                |
| :Locate:    | Run locate and load the results into the quickfix list.              |
| :Wall:      | Write every open window. Handy for kicking off tools like guard.     |
| :SudoWrite: | Write a privileged file with sudo.                                   |
| :SudoEdit:  | Edit a privileged file with sudo.                                    |


<a name="Markdown_conceal"></a>
##4.21. Markdown conceal

```vimscript
Plugin 'tpope/vim-eunuch'
```

A variation of the vim-markdown syntax highlighting, matching rules and mappings for
the original Markdown and extensions for viewing Markdown. This version cleans up
Markdown syntax for easier reading using the conceal feature available in Vim 7.3 or
later, and seems to make the most sense in use alongside things like less.vim and
vimpager.

End of Bundle. We load all the plugins and re-enable the indentation

```vimscript
Plugin 'prurigro/vim-markdown-concealed'
```



```vimscript
call vundle#end()
filetype plugin on
filetype indent on
```


<a name="Settings"></a>
#5. Settings

<a name="Misc_options"></a>
##5.1. Misc options

<a name="Alerts"></a>
##5.2. Alerts

```vimscript
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
```


<a name="Search_Find_Replace"></a>
##5.3. Search/Find/Replace

```vimscript
set noerrorbells
set novisualbell
set t_vb=
set tm=500
```


<a name="Format_Linebreak"></a>
##5.4. Format/Linebreak

```vimscript
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
```


<a name="Indentation_Tabs"></a>
##5.5. Indentation/Tabs

```vimscript
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
```


<a name="Folds"></a>
##5.6. Folds

```vimscript
set tabstop=4                          " How many spaces a tab worth
set expandtab                          " Insert spaces instead of tabs
set shiftwidth=4                       " Used for reindent operations
set softtabstop=4                      " How many columns are used when <Tab> is hit in insert mode
set smarttab                           " A <BS> will delete a space not a tab
```


<a name="Backup"></a>
##5.7. Backup

```vimscript
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent
set foldcolumn=0
```


<a name="Conceal"></a>
##5.8. Conceal

```vimscript
set nobackup                           " Disable backup
set noswapfile                         " Disable swap because sometime swapfile is in readonly
```


<a name="Split_Windows"></a>
##5.9. Split Windows

```vimscript
if has('conceal')
    set conceallevel=2        " Hide conceal chars
    set concealcursor="nvic"    " Show conceal chars on cursorline for all modes
    set listchars+=conceal:Δ
endif
```


<a name="Diff"></a>
##5.10. Diff

```vimscript
set splitright                         " New vertical split always at the right of the current window
set splitbelow                         " New horizontal split always at the bottom of the current window
```


<a name="Status_line"></a>
##5.11. Status line

```vimscript
set diffopt+=filler,iwhite,icase,vertical
```


<a name="Display_unprintable_chars"></a>
##5.12. Display unprintable chars

```vimscript
set fillchars=fold:─,vert:│            " Separator for status window
set laststatus=2                       " Always the status of the last window
set showcmd                            " Show commands being typed in the bottom right corner
set viminfo='1000,<50,f100,s10,:1000,@10,h
```


<a name="Auto_complete_setting"></a>
##5.13. Auto complete setting

```vimscript
set list
set listchars=tab:▸\ "
set listchars+=extends:›
set listchars+=precedes:‹
set listchars+=nbsp:˽
set showbreak=⌐
```


<a name="Vim_s_language"></a>
##5.14. Vim's language

```vimscript
set completeopt=menuone,longest
```


<a name="Default_font_and_encoding"></a>
##5.15. Default font and encoding

```vimscript
if s:is_windows && has('gui')
    language messages en
endif
```


<a name="Default_font"></a>
###5.15.1. Default font

<a name="Encoding"></a>
###5.15.2. Encoding

```vimscript
if s:is_windows
    set guifont=Powerline_Consolas:h9:cANSI
    set guioptions=                      " No menu, no toolbar, no scrollbars
else
    set guifont=Powerline\ Consolas\ 10
endif
```


<a name="Filetypes"></a>
###5.15.3. Filetypes

```vimscript
set encoding=utf8
setglobal fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,latin1
set termencoding=utf-8
```


<a name="Default_shell_and_directories"></a>
##5.16. Default shell and directories

```vimscript
set ffs=unix,dos,mac
```


<a name="Colorscheme"></a>
##5.17. Colorscheme

```vimscript
if s:is_windows
    set shell=c:\windows\system32\cmd.exe
    set runtimepath^=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
    cd ~
endif
```


<a name="Terminal"></a>
##5.18. Terminal

```vimscript
syntax on
colorscheme nowox
```

Prefer using pipe instead of temp files for shell commands.

```vimscript
if exists("$TMUX")
    set term=screen-256color
endif
```


<a name="Mouse"></a>
##5.19. Mouse

```vimscript
set noshelltemp
```



```vimscript
set mouse      =a                     " Use mouse in All modes
set mousefocus                         " Activate windows on mouseover
set selectmode =mouse,key
set mousemodel =popup
set keymodel   =startsel,stopsel
set selection  =exclusive
set ttymouse=xterm2
```


<a name="Mapping"></a>
#6. Mapping

<a name="Improve_vim_s_behavior__get_rid_of_legacies"></a>
##6.1. Improve vim's behavior, get rid of legacies
Some default behavior of vim that is not logical anymore in our modern and
technological world.

Use a more convenient leader key
Correct cursor movement for long lines

```vimscript
let mapleader = ","                    
```

Backspace will delete the char before cursor

```vimscript
noremap j gj
noremap k gk
```

Use `$` to move physically at the end of the line (Virtualedit must be enabled)

```vimscript
nnoremap <BS> X
```

Insertion mode on enter

```vimscript
nmap <End>    $l
```

In visual mode arrows don't work as expected

```vimscript
nmap <cr> i<cr>
```

In Select mode arrows keys cancel the selection

```vimscript
vmap <Up> k
vmap <Down> j
vmap <Left> h
vmap <Right> l
```

`jj` is back to normal mode since no words have `jj` in it

```vimscript
smap <Up> <esc><Up>
smap <Down> <esc><Down>
smap <Left> <esc><Left>
smap <Right> <esc><Right>
```

Insertion mode on enter

```vimscript
inoremap <silent> jj <C-O>:stopinsert<CR>
```

Current word highlight

```vimscript
noremap <cr> i<cr>
```

Disable highlight search

```vimscript
noremap <silent> à mP*N`P
```

Displacement using arrows

```vimscript
noremap <silent> é :noh<cr>
```

<tab> Tabbing visual selection

```vimscript
vnoremap <Down> j
vnoremap <Up> k
vnoremap <Left> h
vnoremap <Right> l
snoremap <Down> <Esc>
snoremap <Up> <Esc>
snoremap <Right> <Esc>
snoremap <Left> <Esc>
snoremap <Bs>  <Bs>
```

Search with <space>

```vimscript
nnoremap           <Tab>        >>
nnoremap           <S-Tab>      <<
inoremap           <S-Tab> <c-o><<
vnoremap           <Tab>        >gv
vnoremap           <S-Tab>      <gv
```

Home goes to the first non white space of the line

```vimscript
map                <space> /
```

Ag/Ack search

```vimscript
noremap <Home> ^
inoremap <silent> <Home> <C-c>^i
```

Use Q for formatting the current paragraph (or selection)

```vimscript
nnoremap           Z            :Ag!<space>
vnoremap           Z            :Ag!<space><C-u><C-r>=GetVisualSelection()<CR>
```

Go back to marker position (the swiss french keyboard sucks)

```vimscript
vnoremap           Q       gq
nnoremap           Q       gqap
```

`-` is `:`

```vimscript
noremap            '       `
```

Bubble single lines

```vimscript
noremap            -       :
```

Bubble multiple lines

```vimscript
nmap <C-Up> ddkP
nmap <C-Down> ddp
```

Delete words in insert mode

```vimscript
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]
```


<a name="_C____Control___key"></a>
##6.2. <C-?> Control + key

```vimscript
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
```


<a name="_C_Tab___C_S_Tab__Next_Previous_buffer"></a>
###6.2.1. <C-Tab> <C-S-Tab> Next/Previous buffer

<a name="_C_a__Select_all"></a>
###6.2.2. <C-a> Select all

```vimscript
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
```


<a name="_C_b__Reserved_for_Tmux_prefix"></a>
###6.2.3. <C-b> Reserved for Tmux prefix

```vimscript
inoremap           <C-a>   <esc>ggVG
nnoremap           <C-a>        ggVG
```


Nothing here


<a name="_C_c__Copy_word_selection"></a>
###6.2.4. <C-c> Copy word/selection
 - Copy word under cursor if no selection
 - Copy selection

<a name="_C_d__Replace_word_under_cursor__Delete_a_word_with_no_yank_"></a>
###6.2.5. <C-d> Replace word under cursor (Delete a word with no yank)

```vimscript
inoremap <silent>  <c-c> <esc>m`viw"+y``a
nnoremap <silent>  <c-c> <esc>m`viw"+y``
vnoremap           <c-c> "+y
```


<a name="_C_e__Decrement_the_next_number_on_current_line"></a>
###6.2.6. <C-e> Decrement the next number on current line

```vimscript
inoremap <silent>  <c-d>   <c-c>"_ciw
nnoremap <silent>  <c-d>   "_ciw
```


<a name="_C_f__Search_for_work_selection"></a>
###6.2.7. <C-f> Search for work/selection

```vimscript
nnoremap <silent>  <c-e>   :<c-u>call AddSubtract("\<c-x>", '')<CR>
function! AddSubtract(char, back)
    let pattern = &nrformats =~ 'alpha' ? '[[:alpha:][:digit:]]' : '[[:digit:]]'
    call search(pattern, 'cw' . a:back)
    execute 'normal! ' . v:count1 . a:char
    silent! call repeat#set(":\<C-u>call AddSubtract('" .a:char. "', '" .a:back. "')\<CR>")
endfunction
```


<a name="_C_g__Alternate_buffer"></a>
###6.2.8. <C-g> Alternate buffer

```vimscript
nnoremap           <c-f>   /<C-u><C-r>=Escape(expand('<cword>'))<CR>
inoremap           <c-f>   <esc>/<C-u><C-r>=Escape(expand('<cword>'))<CR>
vnoremap           <c-f>   /<C-u><C-r>=GetVisualSelection()<CR>
```


<a name="_C_h__Replacement"></a>
###6.2.9. <C-h> Replacement

```vimscript
nnoremap <c-g> <C-^>
inoremap <c-g> <C-^>
vnoremap <c-g> <C-^>
```


<a name="_C_i_"></a>
###6.2.10. <C-i>

```vimscript
nnoremap <c-h> :<C-u>%s/<C-r>=Escape(expand('<cword>'))<CR>//g<left><left>
inoremap <c-h> <esc>:%s/<C-r>=Escape(expand('<cword>'))<CR>//g<left><left>
vnoremap <c-h> :<C-u>%s/<C-r>=GetVisualSelection()<CR>//g<left><left>
```


Cannot be mapped, already binded to `<Tab>`


<a name="_C_j__Add_an_empty_line_below_the_cursor__Disabled_"></a>
###6.2.11. <C-j> Add an empty line below the cursor [Disabled]
nnoremap <silent> <C-j> m`o<esc>``
inoremap <silent> <C-j> <esc>m`o<esc>``a

<a name="_C_k__Add_an_empty_line_above_the_cursor__Disabled_"></a>
###6.2.12. <C-k> Add an empty line above the cursor [Disabled]
nnoremap <silent> <c-k> m`O<esc>``
inoremap <silent> <c-k> <esc>m`O<esc>``a

<a name="_C_l___free_"></a>
###6.2.13. <C-l> (free)

<a name="_C_m_"></a>
###6.2.14. <C-m>

Cannot be mapped, same as `<CR>`


<a name="_C_n__Multiple_cursors_start"></a>
###6.2.15. <C-n> Multiple cursors start

Start multiple cursor mode


<a name="_C_o_"></a>
###6.2.16. <C-o>

<a name="_C_P__CtrlP"></a>
###6.2.17. <C-P> CtrlP

```vimscript
noremap            <C-o>    :CtrlPBuffer<CR>
vnoremap           <C-o>    <C-c>:CtrlPBuffer<CR>
inoremap           <C-o>    <C-o>:CtrlPBuffer<CR>
```


Previously loaded with ctrlp plugin


<a name="_C_q__Blockwise_visual_mode"></a>
###6.2.18. <C-q> Blockwise visual mode

<a name="_C_q__what_did__C_v__before"></a>
###6.2.19. <C-q> what did <C-v> before

```vimscript
noremap            <C-q>    <C-v>
```


<a name="_C_r__Redo"></a>
###6.2.20. <C-r> Redo

```vimscript
inoremap           <C-q>    <c-v>
```


<a name="_C_s__Save"></a>
###6.2.21. <C-s> Save

<a name="_C_t__Tag_completion__Ctags_"></a>
###6.2.22. <C-t> Tag completion (Ctags)

```vimscript
noremap            <C-s>    :update!<CR>
vnoremap           <C-s>    <C-c>:update!<CR>
inoremap           <C-s>    <C-o>:update!<CR>
```


<a name="_C_u__Interrupt_current_search"></a>
###6.2.23. <C-u> Interrupt current search

```vimscript
inoremap <c-t> <c-x><c-]>
```


<a name="_c_v__Paste"></a>
###6.2.24. <c-v> Paste

```vimscript
noremap <c-u> <c-c>
```

Pasting blockwise and linewise selections is not possible in Insert and

```vimscript
noremap            <C-v>    "+gP
cmap               <C-v>    <C-R>+
```

Visual mode without the +virtualedit feature.  They are pasted as if they
were characterwise instead.
Uses the paste.vim autoload script.
Also map the old way to copy `<S-Insert>`

```vimscript
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
```


<a name="_C_w__Window_command__Split_"></a>
###6.2.25. <C-w> Window command (Split)

```vimscript
imap <S-Insert>     <C-v>
vmap <S-Insert>     <C-v>
```

Used to split vim's environmnent in multiple workspaces called windows.
      `<C-w>v`   Vertical Split
      `<C-w>s`   Horizontal Split
      `<C-w>o`   Zoom (from plugin vim-zoom)
      `<C-w>n`   New vertical split with an empty buffer
      `<C-w>^`   Veritcal split with alternate buffer #
      `<C-w>q`   Quit current window and exit vim if last window
      `<C-w>c`   Close current window

      `<C-w>[jklh]`  Move cursor to Nth window down/left/right/up
      `<C-w>j`   Move cursor to Nth window below
      `:help split`
noremap  <C-w>     :BD<CR>

<a name="_C_x__Cut_word_selection"></a>
###6.2.26. <C-x> Cut word/selection

<a name="_C_y__Increment_closest_number"></a>
###6.2.27. <C-y> Increment closest number

```vimscript
inoremap <C-x> <esc>m`viw"+y``"_diwa
nnoremap <silent>  <C-x> <esc>m`viw"+y``"_diw
vnoremap <C-x> "+x
```


<a name="_C_z__Suspend_vim"></a>
###6.2.28. <C-z> Suspend vim

```vimscript
nnoremap <silent> <c-y> :<c-u>call AddSubtract("\<c-a>", '')<CR>
```


Suspend and goes to shell. Can come back with |fg|


<a name="_C_Home__Real_start_of_a_line"></a>
###6.2.29. <C-Home> Real start of a line

<a name="_A____Alt___key"></a>
##6.3. <A-?> Alt + key

```vimscript
inoremap <C-Home>   <C-c>0i
nnoremap <C-Home>   0
inoremap <C-End>    <C-c>$gea
nnoremap <C-End>    $gel
```


<a name="_A_j__Move_screen_down"></a>
###6.3.1. <A-j> Move screen down

<a name="_A_k__Move_screen_up"></a>
###6.3.2. <A-k> Move screen up

```vimscript
set <f32>=j
noremap <f32> <C-y>j
inoremap <f32> <C-y><C-o>j
```


<a name="_F___Function_number"></a>
##6.4. <F?> Function number

```vimscript
set <f33>=k
noremap <f33> <C-e>k
inoremap <f33> <C-e><C-o>k
```


<a name="_F1__Help"></a>
###6.4.1. <F1> Help

Already mapped by default


<a name="_C_F1__Help_in_full_screen"></a>
###6.4.2. <C-F1> Help in full screen

<a name="_F2__File_explorer__NERD_Tree_"></a>
###6.4.3. <F2> File explorer (NERD Tree)

```vimscript
nnoremap <c-F1> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>
```


<a name="_F3__Taglist_pane"></a>
###6.4.4. <F3> Taglist pane

```vimscript
noremap  <silent> <F2> :NERDTreeToggle<CR>
inoremap <silent> <F2> <c-O>:NERDTreeToggle<CR>
```


<a name="_F4__Tagbar"></a>
###6.4.5. <F4> Tagbar

```vimscript
noremap  <silent> <F3> :TlistToggle<CR>
vnoremap <silent> <F3> <c-C>:TlistToggle<CR>
inoremap <silent> <F3> <c-O>:TlistToggle<CR>
```


<a name="_F6__Toggle_Voom"></a>
###6.4.6. <F6> Toggle Voom

```vimscript
noremap  <silent> <F4> :TagbarToggle<CR>
vnoremap <silent> <F4> <c-C>:TagbarToggle<CR>
inoremap <silent> <F4> <c-O>:TagbarToggle<CR>
```


<a name="_F7__Toggle_GUI_options__menu__tools__scrollbars_"></a>
###6.4.7. <F7> Toggle GUI options (menu, tools, scrollbars)

```vimscript
nnoremap <silent> <F6> :VoomToggle<CR>
vnoremap <silent> <F6> <c-C>:VoomToggle<CR>
inoremap <silent> <F6> <c-O>:VoomToggle<CR>
```


<a name="_F8__Toggle_colorscheme"></a>
###6.4.8. <F8> Toggle colorscheme

```vimscript
nnoremap <F7> :call ToggleFlag('guioptions','mrT')<cr>
inoremap <F7> <c-C>:call ToggleFlag('guioptions','mrT')<cr>
```


<a name="_F10__Toggle_quickfix_window"></a>
###6.4.9. <F10> Toggle quickfix window

```vimscript
nnoremap <F8> :call NextColor(1)<CR>
nnoremap <S-F8> :call NextColor(-1)<CR>
nnoremap <A-F8> :call NextColor(0)<CR>
```


<a name="_F11__Toggle_numbers"></a>
###6.4.10. <F11> Toggle numbers

```vimscript
noremap  <silent> <F10> :call ToggleQuickfixList()<CR>
vnoremap <silent> <F10> <C-C>:call ToggleQuickfixList()<CR>
inoremap <silent> <F10> <C-O>:call ToggleQuickfixList()<CR>
```

Here I allow looping aound number style

```vimscript
noremap  <silent> <F11> :call ToggleNumber()<CR>
vnoremap <silent> <F11> <c-C>:call ToggleNumber()<CR>
inoremap <silent> <F11> <c-O>:call ToggleNumber()<CR>
```

- Nonu
- Nu
- RelativeNumber

<a name="_F12__Remove_trailing_spaces"></a>
###6.4.11. <F12> Remove trailing spaces

```vimscript
function! ToggleNumber()
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
```


<a name="_Leader__Vim_s_prefix"></a>
##6.5. <Leader> Vim's prefix

```vimscript
noremap  <silent> <F12> :FixWhitespace<CR>
vnoremap <silent> <F12> <c-C>:FixWhitespace<CR>
inoremap <silent> <F12> <c-O>:FixWhitespace<CR>
function! s:FixWhitespace(line1,line2)
    let l:save_cursor = getpos(".")
    silent! execute ':' . a:line1 . ',' . a:line2 . 's/\s\+$//'
    call setpos('.', l:save_cursor)
endfunction
command! -range=% FixWhitespace call <SID>FixWhitespace(<line1>,<line2>)
```


<a name="_Leader_v_Edit__vimrc"></a>
###6.5.1. <Leader>v Edit .vimrc

<a name="_Leader_vd_Generate_the__vimrc_documentation"></a>
###6.5.2. <Leader>vd Generate the .vimrc documentation

```vimscript
noremap <leader>v :edit ~/.vimrc<cr>
```


<a name="_Leader_V_Reload__vimrc"></a>
###6.5.3. <Leader>V Reload .vimrc

```vimscript
noremap <leader>vd :! ~/.scripts/vim2doc ~/.vimrc > ~/.doc/vimrc.md<cr>
```


<a name="_Leader_w_Wrap_Nowrap_toggle"></a>
###6.5.4. <Leader>w Wrap/Nowrap toggle

```vimscript
noremap <leader>V :source ~/.vimrc<cr>
```


<a name="_Mouse__Mouse_key_binding"></a>
##6.6. <Mouse> Mouse key binding

```vimscript
noremap <silent>    <leader>w       :set wrap!<cr>
```


<a name="_2_RightMouse__Highlight_the_word_under_cursor"></a>
###6.6.1. <2-RightMouse> Highlight the word under cursor


```vimscript
noremap <silent> <2-RightMouse> :let @/='\V\<'.escape(expand('<cword>'), '\').'\>'<cr>:set hls<cr>
```


<a name="Tmux"></a>
#7.6. Tmux


```vimscript
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
```


<a name="Abbreviation"></a>
#8.6. Abbreviation

<a name="xxfile"></a>
##8.7. xxfile

<a name="xxdate"></a>
##8.8. xxdate

```vimscript
ab xxfile <C-R>=Filename()<cr>
fun! Filename()
    return expand("%:t")
endfun
```


<a name="Functions"></a>
#9. Functions

```vimscript
ab xxdate <C-R>=DateTime()<cr>
fun! DateTime()
    return strftime("%Y-%m-%d %a %I:%M %p")
endfun
```

Present Colorscheme (light) 

<a name="Autocommands"></a>
#10. Autocommands

```vimscript
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
```


<a name="Config_group"></a>
##10.1. Config group

<a name="Vimrc"></a>
##10.2. Vimrc

```vimscript
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
```

Here I set foldmethod for my .vimrc


<a name="Shebang"></a>
##10.3. Shebang

```vimscript
augroup vimrc
    autocmd!
    autocmd BufEnter .vimrc setlocal foldmethod=marker | set foldlevel=0
augroup END
```

Automatically add shebang to specific filetypes.

 autocmd BufNewFile *.py 0put =\"#!/usr/bin/env python\<nl># Author: Yves Chevallier<nl># Date:\".strftime("%d/%m/%y %H:%M:%S")|$

```vimscript
augroup shebang
```


<a name="GPG_Encryption"></a>
##10.4. GPG Encryption

```vimscript
  autocmd BufNewFile *.rb 0put =\"#!/usr/bin/env ruby\<nl># Author: Yves Chevallier\<nl>Date: \<nl>\"|$
  autocmd BufNewFile *.pl 0put =\"#!/usr/bin/env perl\<nl># Author: Yves Chevallier\<nl>Date: \<nl>\"|$
  autocmd BufNewFile *.tex 0put =\"%&plain\<nl>\"|$
augroup END
```

Transparent editing of gpg encrypted files (by Wouter Hanegraaff)


<a name="FunctionsW"></a>
#11. Functions

```vimscript
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
```



<a name="Folding_text_format"></a>
##11.1. Folding text format


```vimscript
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
```



<a name="Keyboard_mapping_summary"></a>
#12. Keyboard mapping summary


<a name="Any_modes"></a>
##12.1. Any modes

|    Mapping     |     Description                                       |   Plugin   |
|:---------------|:------------------------------------------------------|:----------:|
| `<Leader>bb`   | Previous buffer (with cursor preserve position)       | bufkill    |
| `<Leader>bf`   | Next buffer (with cursor preserve position)           | bufkill    |
| `<Leader>bd`   | Delete a buffer                                       | bufkill    |
| `<Leader>bundo`| Undo kill buffer                                      | bufkill    |
| `<Leader>ba`   | Alternate buffer                                      | bufkill    |
| `<Leader>l`    | Toggle location list                                  | togglelist |
| `<Leader>m`    | Highlight current word/selection with new color group | mark       |
| `<Leader>n`    | Remove mark on word/selection                         | mark       |
| `<Leader>q`    | Toggle Quickfix list                                  | togglelist |


<a name="Normal_mode"></a>
##12.2. Normal mode

|    Mapping     |     Description                                       |   Plugin   |
|:---------------|:------------------------------------------------------|:----------:|
| `à`            | Highlight current word                                |            |
| `é`            | Disable word highlight                                |            |
| `<Tab>`        | Indent line/selection                                 |            |
| `<S-Tab>`      | Unindent line/selection                               |            |
| `<Space>`      | Search                                                |            |
| `Q`            | Format selected paragraph                             |            |
| `Z`            | Ag search                                             |            |

<C-a>                 Select all
<C-n>                 Select cursor under cursor                     (multiple-cursors)
<C-p>                 Full path fuzzy file finder                               (ctrlp)
<C-Up>                Bubble up line/selection
<C-Down>              Bubble down line/selection
<C-Tab>               Next bufofber
<C-S-Tab>             Previous fbuffer


<a name="Command_Mode"></a>
##12.3. Command Mode

<C-r>                 Regex search                                              (ctrlp)
<C-d>                 Search by filename enable/disable                         (ctrlp)
