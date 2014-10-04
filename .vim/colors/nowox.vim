" File:       nowox.vim
" Maintainer: Yves Chevallier
" URL:        https://github.com/nowox/vim-nowox
" Modified:   1 Oct 2014 10:20 PM
" License:    MIT

" Theme colors:
" -------------

let s:background   = "#262626"
let s:foreground   = "#c5c8c6"

let s:darkcolumn   = "#1c1c1c"

let s:gray_dark    = "#303030"
let s:gray_middle  = "#313131"
let s:gray_light   = "#4e4e4e"

let s:selection    = "#303030"

let s:comment      = "#606060"    " This is a comment
let s:constant     = "#ff5f5f"
let s:red          = "#cc6666"
let s:orange       = "#de935f"
let s:typedef      = "#dfaf5f"
let s:apple        = "#dfdf5f"
let s:yellow       = "#f0c674"
let s:green        = "#b5bd68"
let s:character    = "#af875f"
let s:aqua         = "#8abeb7"
let s:blue         = "#81a2be"
let s:purple       = "#b294bb"


let s:addbg        = "#5F875F"
let s:addfg        = "#d7ffaf"
let s:changebg     = "#5F5F87"
let s:changefg     = "#d7d7ff"
let s:darkblue     = "#00005f"
let s:darkcyan     = "#005f5f"
let s:darkred      = "#5f0000"
let s:darkpurple   = "#5f005f"

let s:operator     = "#8787af"
let s:keyword      = "#5f87af"
let s:label        = "#5f875f"
let s:include      = "#5fafdf"
let s:cursorcolumn = "#303030"

" Theme preferences: {{{1
" ------------------
set background=dark
hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "nowox"

" Functions : {{{1
" ----------

if has("gui_running") || &t_Co == 88 || &t_Co == 256
	" Returns an approximate grey index for the given grey level
	fun! <SID>grey_number(x)
		if &t_Co == 88
			if a:x < 23
				return 0
			elseif a:x < 69
				return 1
			elseif a:x < 103
				return 2
			elseif a:x < 127
				return 3
			elseif a:x < 150
				return 4
			elseif a:x < 173
				return 5
			elseif a:x < 196
				return 6
			elseif a:x < 219
				return 7
			elseif a:x < 243
				return 8
			else
				return 9
			endif
		else
			if a:x < 14
				return 0
			else
				let l:n = (a:x - 8) / 10
				let l:m = (a:x - 8) % 10
				if l:m < 5
					return l:n
				else
					return l:n + 1
				endif
			endif
		endif
	endfun

	" Returns the actual grey level represented by the grey index
	fun! <SID>grey_level(n)
		if &t_Co == 88
			if a:n == 0
				return 0
			elseif a:n == 1
				return 46
			elseif a:n == 2
				return 92
			elseif a:n == 3
				return 115
			elseif a:n == 4
				return 139
			elseif a:n == 5
				return 162
			elseif a:n == 6
				return 185
			elseif a:n == 7
				return 208
			elseif a:n == 8
				return 231
			else
				return 255
			endif
		else
			if a:n == 0
				return 0
			else
				return 8 + (a:n * 10)
			endif
		endif
	endfun

	" Returns the palette index for the given grey index
	fun! <SID>grey_colour(n)
		if &t_Co == 88
			if a:n == 0
				return 16
			elseif a:n == 9
				return 79
			else
				return 79 + a:n
			endif
		else
			if a:n == 0
				return 16
			elseif a:n == 25
				return 231
			else
				return 231 + a:n
			endif
		endif
	endfun

	" Returns an approximate colour index for the given colour level
	fun! <SID>rgb_number(x)
		if &t_Co == 88
			if a:x < 69
				return 0
			elseif a:x < 172
				return 1
			elseif a:x < 230
				return 2
			else
				return 3
			endif
		else
			if a:x < 75
				return 0
			else
				let l:n = (a:x - 55) / 40
				let l:m = (a:x - 55) % 40
				if l:m < 20
					return l:n
				else
					return l:n + 1
				endif
			endif
		endif
	endfun

	" Returns the actual colour level for the given colour index
	fun! <SID>rgb_level(n)
		if &t_Co == 88
			if a:n == 0
				return 0
			elseif a:n == 1
				return 139
			elseif a:n == 2
				return 205
			else
				return 255
			endif
		else
			if a:n == 0
				return 0
			else
				return 55 + (a:n * 40)
			endif
		endif
	endfun

	" Returns the palette index for the given R/G/B colour indices
	fun! <SID>rgb_colour(x, y, z)
		if &t_Co == 88
			return 16 + (a:x * 16) + (a:y * 4) + a:z
		else
			return 16 + (a:x * 36) + (a:y * 6) + a:z
		endif
	endfun

	" Returns the palette index to approximate the given R/G/B colour levels
	fun! <SID>colour(r, g, b)
		" Get the closest grey
		let l:gx = <SID>grey_number(a:r)
		let l:gy = <SID>grey_number(a:g)
		let l:gz = <SID>grey_number(a:b)

		" Get the closest colour
		let l:x = <SID>rgb_number(a:r)
		let l:y = <SID>rgb_number(a:g)
		let l:z = <SID>rgb_number(a:b)

		if l:gx == l:gy && l:gy == l:gz
			" There are two possibilities
			let l:dgr = <SID>grey_level(l:gx) - a:r
			let l:dgg = <SID>grey_level(l:gy) - a:g
			let l:dgb = <SID>grey_level(l:gz) - a:b
			let l:dgrey = (l:dgr * l:dgr) + (l:dgg * l:dgg) + (l:dgb * l:dgb)
			let l:dr = <SID>rgb_level(l:gx) - a:r
			let l:dg = <SID>rgb_level(l:gy) - a:g
			let l:db = <SID>rgb_level(l:gz) - a:b
			let l:drgb = (l:dr * l:dr) + (l:dg * l:dg) + (l:db * l:db)
			if l:dgrey < l:drgb
				" Use the grey
				return <SID>grey_colour(l:gx)
			else
				" Use the colour
				return <SID>rgb_colour(l:x, l:y, l:z)
			endif
		else
			" Only one possibility
			return <SID>rgb_colour(l:x, l:y, l:z)
		endif
	endfun

	" Returns the palette index to approximate the 'rrggbb' hex string
	fun! <SID>rgb(rgb)
		let l:r = ("0x" . strpart(a:rgb, 0, 2)) + 0
		let l:g = ("0x" . strpart(a:rgb, 2, 2)) + 0
		let l:b = ("0x" . strpart(a:rgb, 4, 2)) + 0

		return <SID>colour(l:r, l:g, l:b)
	endfun

	" Sets the highlighting for the given group
	fun! <SID>X(group, fg, bg, attr) 
		if a:fg != ""
			exec "hi " . a:group . " guifg=" . a:fg . " ctermfg=" . <SID>rgb(strpart(a:fg,1))
		endif
		if a:bg != ""
			exec "hi " . a:group . " guibg=" . a:bg . " ctermbg=" . <SID>rgb(strpart(a:bg,1))
		endif
		if a:attr != ""
			exec "hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr
		endif
	endfun
" }}}

call <SID>X("ColorColumn"  , ""           , s:gray_dark  , "")
call <SID>X("Conceal"      , "#dfdf5f"    , ""           , "")

call <SID>X("Cursor"       , ""           , "#f9c674"    , "")
call <SID>X("CursorIM"     , ""           , "#f9c674"    , "")

call <SID>X("CursorLine"   , ""           , s:gray_dark  , "NONE")
call <SID>X("CursorColumn" , ""           , s:gray_dark  , "NONE")

call <SID>X("Directory"    , "#81a2be"    , ""           , "")

call <SID>X("ErrorMsg"     , s:background , "#cc6666"    , "standout")

call <SID>X("VertSplit"    , s:background , "#d7ffaf"    , "")

call <SID>X("Folded"       , "#8a8a8a"    , s:gray_dark  , "")
call <SID>X("FoldColumn"   , ""           , s:gray_dark  , "")
call <SID>X("SignColumn"   , ""           , s:darkcolumn , "")

call <SID>X("IncSearch"    , ""           , "#af875f"    , "")
call <SID>X("Search"       , s:background , "#af875f"    , "")

call <SID>X("LineNr"       , s:gray_light , s:gray_dark  , "")

call <SID>X("CursorLineNr" , "#f0c674"    , s:gray_dark  , "bold")
call <SID>X("MatchParen"   , s:background , s:changebg   , "")
call <SID>X("ModeMsg"      , s:green      , ""           , "")
call <SID>X("MoreMsg"      , s:green      , ""           , "")
call <SID>X("NonText"      , "#81a2be"    , ""           , "")
call <SID>X("Pmenu"        , s:foreground , s:selection  , "")
call <SID>X("PmenuSel"     , s:foreground , s:selection  , "reverse")

call <SID>X("PmenuSbar"    , s:foreground , s:selection  , "reverse")
call <SID>X("PmenuThumb"   , s:foreground , s:selection  , "reverse")

call <SID>X("Question"     , s:green      , ""           , "")

call <SID>X("SpecialKey"   , s:blue       , ""           , "")
call <SID>X("SpellCap"     , s:blue       , s:darkblue   , "underline")
call <SID>X("SpellLocal"   , s:aqua       , s:darkcyan   , "underline")
call <SID>X("SpellBad"     , s:red        , s:darkred    , "underline")
call <SID>X("SpellRare"    , s:purple     , s:darkpurple , "underline")
call <SID>X("StatusLine"   , s:comment    , s:background , "reverse")
call <SID>X("StatusLineNC" , s:gray_dark  , s:comment    , "reverse")
call <SID>X("TabLine"      , s:foreground , s:darkcolumn , "reverse")
call <SID>X("TabLineFill"  , s:foreground , s:darkcolumn , "reverse")
call <SID>X("TabLineSel"   , s:foreground , s:darkcolumn , "reverse")

call <SID>X("Title"        , s:yellow     , ""           , "")
call <SID>X("Visual"       , ""           , s:selection  , "")
call <SID>X("VisualNos"    , ""           , s:selection  , "")

call <SID>X("WarningMsg"   , s:red        , ""           , "")
call <SID>X("WildMenu"     , s:red        , ""           , "")


call <SID>X("Normal"       , s:foreground , s:background , "")

call <SID>X("Comment"      , s:comment    , ""           , "")
call <SID>X("Constant"     , s:constant   , ""           , "")
call <SID>X("String"       , s:green      , ""           , "")
call <SID>X("Character"    , s:character  , ""           , "")
call <SID>X("Number"       , s:orange     , ""           , "")
call <SID>X("Boolean"      , s:orange     , ""           , "")
call <SID>X("Float"        , s:orange     , ""           , "")
call <SID>X("Identifier"   , s:purple     , ""           , "")
call <SID>X("Function"     , s:yellow     , ""           , "")

call <SID>X("Statement"    , s:blue       , ""           , "")
"		Conditional"
"		Repeat"
call <SID>X("Label"           ,s:label       ,"",        "")
call <SID>X("Operator"        ,s:operator    ,"",        "")
call <SID>X("Keyword"         ,s:keyword     ,"",        "")
"		Exception"

call <SID>X("PreProc"         ,s:aqua        ,"",        "")
call <SID>X("Include"         ,s:include     ,"",        "")
"		Define"
"		Macro"
"		PreCondit"

call <SID>X("Type"            ,s:orange      ,"",        "")
call <SID>X("Storage"         ,s:apple     ,"",        "")
call <SID>X("Structure"       ,s:aqua        ,"",        "")
call <SID>X("Typedef"         ,s:typedef     ,"",        "")

call <SID>X("Special"         ,s:green       ,"",        "")
"		SpecialChar"
"		Tag"
"		Delimiter"
"		SpecialComment"
"		Debug"
"
call <SID>X("Underlined"      ,s:blue        ,"",        "")

call <SID>X("Ignore"          ,""        ,"",        "")

call <SID>X("Error"           ,s:red         ,s:darkred,     "")

call <SID>X("Todo"            ,s:addfg       ,"",        "")

" Quickfix window highlighting
call <SID>X("qfLineNr"        ,s:yellow      ,"",        "")
call <SID>X("qfFileName"      ,s:keyword     ,"",        "")
call <SID>X("qfError"         ,s:red         ,"",        "")

"}}}
" Diff Syntax Highlighting:"{{{
" ----------------------------------------------------------------------------

call <SID>X("DiffAdd"    , s:addfg      , s:addbg      , "")
call <SID>X("DiffChange" , s:changefg   , s:changebg   , "")
call <SID>X("DiffDelete" , s:background , s:red        , "")
call <SID>X("DiffText"   , s:background , s:blue       , "")
" Diff
"		diffOldFile
"		diffNewFile
"		diffFile
"		diffOnly
"		diffIdentical
"		diffDiffer
"		diffBDiffer
"		diffIsA
"		diffNoEOL
"		diffCommon
"link diffRemoved Constant
"		diffChanged
"link diffAdded Special
"		diffLine
"		diffSubname
"		diffComment
endif

" vim:foldmethod=marker:foldlevel=0:tw=80
