	.file "TestAsm.S"
	.text
	.global multiply

; 8 bit unsigned multiply
; unsigned int multiply (byte arg1, byte arg2);
; register usage
; r24 passed in arg1-Multiplicand (M)
; r22 passed in arg2-Multiplier (Q)
; r18 register 'A'
; r21 counter
; at conclusion product is in 'A', 'Q'

ldi r21, 8

multiply:
	adc r18, r24
	ror r18
	ror r24
	dec r21
	cpi r21, 0
	brne multiply

done:
	clc ; clear the carry
	mov r24, r22 ; LSB of result (r22) to LSB of return integer
	mov r25, r18 ; MSB of result (r18) to MSB of return integer
	ret ; return 

	.end