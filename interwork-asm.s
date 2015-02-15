.section .text	
.thumb

.align 8
.extern Double @ from C
.extern main
.global AsmStart  @ to C
.global Lab_Start
.extern __libc_init_array

.equ AVALUE, 42 @ initial value to double

@ Slightly edited flow compared to original lab ideao
@ startup -> SystemInit -> Lab_Start -> __lib_c_init_array
@ -> Lab_Start -> main -> AsmStart -> Double -> AsmStart 
@ -> main -> Lab_Start -> Safety_Stop

@ Safety stop is moved to on purpose

.thumb_func
Lab_Start:
	@ Initialise C structures
	BL __libc_init_array

	LDR r0, =main
	BLX r0  @ Branch to main() in C code

	B Safety_Stop  @ catch-all for error

.thumb_func
AsmStart:
	MOV r0, #AVALUE @
	PUSH {lr} @save return-to-C address before subroutine call onto stack
	BL Double
	MOV r2, r0 @ r0 will be overwritten by SVC call so save result
	POP {r0} @ restore return-to-C address
	BLX r0

@ This function will never be called as we have re-worked
@ the control flow of the program
Stop:
	B Stop
	
Safety_Stop:
	B Safety_Stop

.align
.end
