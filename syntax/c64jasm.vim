" Language: c64jasm v0.7.x

if exists("b:current_syntax")
  finish
endif

syntax clear

syn case match

" 6502 Opcodes
syn keyword c64jasmOpcode lda sta jmp
syn keyword c64jasmOpcode adc ahx alr anc anc2 and arr asl axs
syn keyword c64jasmOpcode bcc bcs beq bit bmi bne bpl brk bvc bvs
syn keyword c64jasmOpcode clc cld cli clv cmp cpx cpy
syn keyword c64jasmOpcode dcp dec dex dey
syn keyword c64jasmOpcode eor
syn keyword c64jasmOpcode inc inx iny isc
syn keyword c64jasmOpcode jmp jsr
syn keyword c64jasmOpcode las lax lda ldx ldy lsr
syn keyword c64jasmOpcode nop
syn keyword c64jasmOpcode ora
syn keyword c64jasmOpcode pha php pla plp
syn keyword c64jasmOpcode rla rol ror rra rti rts
syn keyword c64jasmOpcode sax sbc sbc2 sec sed sei shx shy slo sre sta stx sty
syn keyword c64jasmOpcode tas tax tay tsx txa txs tya
syn keyword c64jasmOpcode xaa

" DTV Opcodes
syn keyword c64jasmOpcode bra
syn keyword c64jasmOpcode sac sir

" Operators
syn match c64jasmOperator '\([#:+\-*/=<>&|^~%]\|<<\|>>\)' nextgroup=@c64jasmIdentifier,@c64jasmNumber.*
syn match c64jasmOperator ',\s*[xy]'
syn match c64jasmOperator '\(==\|!=\|>=\|<=\|||\|&&\|?\)' nextgroup=@c64jasmIdentifier,@c64jasmNumber.*
syn keyword c64jasmOperator in as nextgroup=@c64jasmIdentifier
syn match c64jasmOperator '::' nextgroup=@c64jasmIdentifier

" Literals
syn match c64jasmNumberDecimal '\v\d+' contains=c64jasmNumberDecimalZero
syn match c64jasmNumberDecimalZero '\<0\+\ze[1-9]\+' contained
"floating point number, with dot, optional exponent
syn match	c64jasmNumberFloat '\d\+\.\d*\(e[-+]\=\d\+\)\=[fl]\='
"floating point number, starting with a dot, optional exponent
syn match	c64jasmNumberFloat '\.\d\+\(e[-+]\=\d\+\)\=[fl]\=\>'
"floating point number, without dot, with exponent
syn match	c64jasmNumberFloat '\d\+e[-+]\=\d\+[fl]\=\>'
syn match c64jasmNumberHex '\v\$\x+'
syn match c64jasmNumberBinary '\v\%[01]+'
syn match c64jasmBoolean '\v(true|false)'
syn region c64jasmString start='"' skip='\\"' end='"' contains=@Spell oneline

" Comments
syn keyword c64jasmCommentTodo TODO FIX FIXME XXX NOTE contained
syn match c64jasmComment ';.*' contains=@Spell,c64jasmCommentTodo

" Labels & identifiers
syn match c64jasmLabel '^\s*\zs\h\k\+:'he=e-1
syn match c64jasmLabelError '^\s*\zs\d\k\+:'he=e-1
syn match c64jasmIdentifier '\h\k*'

" Pseudo
syn match c64jasmPseudoConditional '\v(!if|elif|else)'
syn match c64jasmPseudo '\v(!let|!!|!for|!align)'
syn match c64jasmPseudoData '\v(!byte|!word|!fill)'
syn match c64jasmPseudo '\v(!error)'
syn match c64jasmPseudo '\v(!macro)'
syn match c64jasmPseudo '\v(!filescope)'
syn match c64jasmPseudoInclude '\v(!use|!include|!binary)'


" Highlighting
hi def link c64jasmBoolean Boolean
hi def link c64jasmComment Comment
hi def link c64jasmCommentTodo Todo
hi def link c64jasmIdentifier Identifier
hi def link c64jasmLabel Identifier
hi def link c64jasmLabelError Error
hi def link c64jasmNumberBinary Number
hi def link c64jasmNumberDecimal Number
hi def link c64jasmNumberDecimalZero Error
hi def link c64jasmNumberFloat Float
hi def link c64jasmNumberHex Number
hi def link c64jasmOpcode Keyword
hi def link c64jasmOperator Operator
hi def link c64jasmPseudo PreProc
hi def link c64jasmPseudoConditional PreCondit
hi def link c64jasmPseudoData Type
hi def link c64jasmPseudoInclude Include
hi def link c64jasmString String

let b:current_syntax = 'cs64jasm'
