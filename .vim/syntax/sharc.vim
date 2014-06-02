" Vim syntax file
" Language: Analog Devices SHARC assembly
" Maintainer: Yves Chevallier
" Latest Revision: 1 June 2014

if version < 600
  syntax clear
elseif exists("b:current_syntax")
    finish
endif

let s:cpo_save = &cpo
set cpo&vim

syn case ignore

" Registers
syn keyword sharcRx         r0 r1 r2 r3 r4 r5 r6 r7
syn keyword sharcRx         r8 r9 r10 r11 r12 r13 r14 r15
syn keyword sharcRx         f0 f1 f2 f3 f4 f5 f6 f7 f8 f9 f10 f11 f12 f13 f14 f15

syn keyword shascSx         s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15
syn keyword shascSx         sf0 sf1 sf2 sf3 sf4 sf5 sf6 sf7 sf8 sf9 sf10 sf11 sf12 sf13 sf14 sf15

syn keyword sharcPrgSec     pc pcstk pcstkp faddr faddr laddr curlcntr lcntr

syn keyword sharcDag1Index  i0 i1 i2 i3 i4 i5 i6 i7
syn keyword sharcDag1Modify m0 m1 m2 m3 m4 m5 m6 m7
syn keyword sharcDag1Length l0 l1 l2 l3 l4 l5 l6 l7
syn keyword sharcDag1Base   b0 b1 b2 b3 b4 b5 b6 b7

syn keyword sharcDag2Index  i8 i9 i10 i11 i12 i13 i14 i15
syn keyword sharcDag2Modify m8 m9 m10 m11 m12 m13 m14 m15
syn keyword sharcDag2Length l8 l9 l10 l11 l12 l13 l14 l15
syn keyword sharcDag2Base   b8 b9 b10 b11 b12 b13 b14 b15

syn keyword sharcBusEx      px1 pxx2 px
syn keyword sharcTimer      tperiod tcount

syn keyword sharcSystemRegs mode1 mode2 irptl imask imaskp mmask flags lirptl astatx astaty stkyx stkyy ustat1 ustat2 ustat3 ustat4

syn keyword sharcIopRegs    syscon systat wait virpt
syn keyword sharcIopMsgs    msgr0 msgr1 msgr2 msgr3 msgr4 msgr5 msgr6 msgr7 bmax bcnt elast
syn keyword sharcIopDma     epb0 epb1 epb2 epb3 smac10 dmac11 dmac12 dmac13 dmastat iio im0 c0 cp0 gp0 db0 da0 ii1 im1 c1 cp1 gp1 db1 da1 ii2 im2 c2 cp2 gp2 db2 da2 ii3 im3 c3 cp3 gp3 db3 da3

syn keyword sharcMulRegs        mr mr0 mr1 mr2 mrf mr0f mr1f mr2f mrb mr0b mr1b mr2b


syn keyword sharcStatement      if else comp dm pm call jump
syn keyword sharcModificator    \(DB\) \(LA\) \(CI\) \(LR\) \(LW\)
syn keyword sharcConditions     eq ne gt lt ge le ac not av mv ms sv sz tf flag0_in flag1_in flag2_in flag3_in bm lce forever

syn match   sharcError          "not\s\+(eq|ne|gt|lt|ge|le)"

syn match   sharcLabel          "[a-z_]\+:$"

syn keyword sharcTodo           contained TODO DEBUG TEST FIXME XXX

syn region  sharcComment        start="/\*" end="\*/" contains=sharcTodo
syn region  sharcComment        start="//"  end="$" keepend contains=sharcTodo

syn match   sharcDecNumber      "[0-9]\+"
syn match   sharcHexNumber      "0x[0-9a-f]\+"

syn match   sharcInclude        "^#.*"
syn match   sharcPreProc        "\s*#.*"

" Highlighting

hi def link sharcSx             Type
hi def link sharcTodo           Todo
hi def link sharcInclude        Include
hi def link sharcPreProc        PreProc
hi def link sharcLabel          Label
hi def link sharcDecNumber      Number
hi def link sharcHexNumber      Number
hi def link sharcComment        Comment

hi def link sharcModificator    Constant
hi def link sharcDag1Index      Structure

hi def link sharcRx             String
hi def link sharcSx             Type

hi def link sharcError          Error
hi def link sharcStatement      Identifier
hi def link sharcConditions     Function

hi def link sharcDag1Modify     Type


let b:current_syntax = "sharc"

let &cpo = s:cpo_save
unlet s:cpo_save

