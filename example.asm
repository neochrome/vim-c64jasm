; vim: ft=c64jasm
!include "somefile.asm"
!use "a-plugin" as plug

!let var_d = 255              ; decimal
!let var_h = $ff              ; hex
!let var_b = %0100            ; binary
!let var_f = 0.5 + .5 + 1e-10 ; floats
* = $800
*= $801

label1:
	lda #var_d
	lda data,x
	lda data, y
	lda #-1
	lda #+3
	lda #002  ; leading 0s for decimal is error
	lda #0    ; but not a single 0
	lda #$01
	lda #%0101
	jmp label1

scope: {
	!macro foo (arg) {
		lda #arg
	}
}
	lda #zp::some_val
	lda #a::deep::scoped::val
	lda #<irq
	ldx #>irq

; a comment with a TODO: fix this!
; a comment with a FIX: fix this!
; a comment with a FIXME: fix this!
; a comment with a XXX: fix this!
; a comment with a NOTE: fix this!
!! foo() ; execute statement and throw away result
!!bar = 42
baz = 42

	+foo(123)
!if (x == 42) {
	ldx #42
} elif (y == 42) {
	ldy #42
} else {
	lda #42
}

0bad_label:

!let obj = {
	x : 42,
	y : 42,
	z : {
		v : 0
		}
	}

!use "blah" as blah
!for i in range(5) {
	lda #i
}

!align $42
data:
	!byte $01, $02
	!fill 8, 3
	!byte plug.data()
!! print(::some::var)
!let assume = 42
!let interrupt = 42
!binary "somefile.bin", 256, 2
