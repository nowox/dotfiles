" Vim syntax file
" Language:	SHARC Assembler
" Maintainer:	Yves Chevallier <nowox@x0x.ch>
" Last Change:	2014 Jun 10

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

syn case ignore

" storage types
syn match asmDirective "\.align"
syn match asmDirective "\.ascii"
syn match asmDirective "\.bss"
syn match asmDirective "\.byte"
syn match asmDirective "\.byte2"
syn match asmDirective "\.byte4"
syn match asmDirective "\.compress"
syn match asmDirective "\.data"
syn match asmDirective "\.else"
syn match asmDirective "\.endif"
syn match asmDirective "\.extern"
syn match asmDirective "\.extern struct"
syn match asmDirective "\.file"
syn match asmDirective "\.file_attr"
syn match asmDirective "\.forcecompress"
syn match asmDirective "\.global"
syn match asmDirective "\.globl"
syn match asmDirective "\.if"
syn match asmDirective "\.import"
syn match asmDirective "\.inc/binary"
syn match asmDirective "\.incbin"
syn match asmDirective "\.leftmargin"
syn match asmDirective "\.list"
syn match asmDirective "\.nolist"
syn match asmDirective "\.list_data"
syn match asmDirective "\.list_datfile"
syn match asmDirective "\.list_deftab"
syn match asmDirective "\.list_loctab"
syn match asmDirective "\.list_wrapdata"
syn match asmDirective "\.long"
syn match asmDirective "\.message"
syn match asmDirective "\.newpage"
syn match asmDirective "\.nocompress"
syn match asmDirective "\.nolist"
syn match asmDirective "\.nolist_data"
syn match asmDirective "\.nolist_datfile"
syn match asmDirective "\.nolist-wrapdata"
syn match asmDirective "\.pagelength"
syn match asmDirective "\.pagewidth"
syn match asmDirective "\.port"
syn match asmDirective "\.precision"
syn match asmDirective "\.previous"
syn match asmDirective "\.reference"
syn match asmDirective "\.retain_name"
syn match asmDirective "\.round_nearest"
syn match asmDirective "\.round_minus"
syn match asmDirective "\.round_plus"
syn match asmDirective "\.round_zero"
syn match asmDirective "\.section"
syn match asmDirective "\.segment/pm"
syn match asmDirective "\.segment/dm"
syn match asmDirective "\.set"
syn match asmDirective "\.short"
syn match asmDirective "\.struct"
syn match asmDirective "\.text"
syn match asmDirective "\.endseg"
syn match asmDirective "\.type"
syn match asmDirective "\.var"
syn match asmDirective "\.weak"
syn match asmDirective "defined"

syn match  asmLabel	"[a-z0-9][a-z0-9_$.]*:"
syn region asmLabel start=/jump\s*(/ms=e+1 end=/)/me=s-1
syn region asmLabel start=/call\s*(/ms=e+1 end=/)/me=s-1

syn keyword asmsReg f0 f1 f2 f3 f4 f5 f6 f7 f8 f9 f10 f11 f12 f13 f14 f15
syn keyword asmsReg r0 r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11 r12 r13 r14 r15
syn keyword asmsReg s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15
syn keyword asmiReg i0 i1 i2 i3 i4 i5 i6 i7 i8 i9 i10 i11 i12 i13 i14 i15
syn keyword asmmReg m0 m1 m2 m3 m4 m5 m6 m7 m8 m9 m10 m11 m12 m13 m14 m15
syn keyword binNumber ne by sz db lt gt eq not and or xor

syn keyword asmMacro fext fdeps DO UNTIL LCE BCLR BSET RTS BTST fix clip lshift float if jump pass dm comp call nop modify pm

syn keyword asmEtel  sizeof offsetof bitpos bitlength bitfield

" Various #'s as defined by GAS ref manual sec 3.6.2.1
" Technically, the first decNumber def is actually octal,
" since the value of 0-7 octal is the same as 0-7 decimal,
" I (Kevin) prefer to map it as decimal:
syn match decNumber		"[^a-z0-9_]\d\+"ms=s+1
syn match octNumber		"0[0-7][0-7]\+"
syn match hexNumber		"0[xX][0-9a-fA-F]\+"
syn match binNumber		"0[bB][0-1]*"

syn match asmVariable "[^a-z0-9]_[a-z0-9_]\+"ms=s+1

syn match asmsReg               "_r_[a-z0-9_]\+"
syn match asmsReg               "_f_[a-z0-9_]\+"
syn match asmiReg               "_i_[a-z0-9_]\+"

syn keyword asmTodo		contained TODO

syn region asmComment		start="/\*" end="\*/" contains=asmTodo
syn region asmComment		start="//" end="$" keepend contains=asmTodo

syn match asmInclude            ".*#define"
syn match asmInclude            ".*#elif"
syn match asmInclude            ".*#else"
syn match asmInclude            ".*#endif"
syn match asmInclude            ".*#error"
syn match asmInclude            ".*#if"
syn match asmInclude            ".*#ifdef"
syn match asmInclude            ".*#ifndef"
syn match asmInclude            ".*#include"
syn match asmInclude            ".*#line"
syn match asmInclude            ".*#pragma"
syn match asmInclude            ".*#undef"
syn match asmInclude            ".*#warning"


syn case match

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_asm_syntax_inits")
  if version < 508
    let did_asm_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  " The default methods for highlighting.  Can be overridden later
  HiLink asmSection	Special
  HiLink asmLabel	Label
  HiLink asmComment	Comment
  HiLink asmTodo	Todo
  HiLink asmDirective	Statement
  HiLink asmInclude	Include
  HiLink asmCond	PreCondit
  HiLink asmMacro	Macro

  HiLink hexNumber	Number
  HiLink decNumber	Number
  HiLink octNumber	Number

  HiLink binNumber	Number
  HiLink asmDirective	Number
  HiLink asmIdentifier	Identifier
  HiLink asmType	Type

  HiLink asmrReg        Identifier
  HiLink asmsReg        Identifier
  HiLink asmiReg        Structure

  HiLink asmEtel        Function
  HiLink asmmReg        Special
  HiLink asmVariable    String
  delcommand HiLink
endif

let b:current_syntax = "asmsharc"

let &cpo = s:cpo_save
unlet s:cpo_save

" vim: ts=8
