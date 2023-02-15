	area reset, data, readonly
	export __Vectors
__Vectors 
	dcd 0x10001000 ; stack pointer value when stack is empty
	dcd Reset_Handler ; reset vector
	align
	area mycode, code, readonly
src dcd 1,2,3,4,5,6,7,8,9,10
	entry
	export Reset_Handler
Reset_Handler
	mov r0,#10
	ldr r1,=dst
	ldr r2,=src
	mov r4,#0
loop 
	ldr r3,[r2],#4
	add r4,r3
	subs r0,#1
	bne loop
	str r4,[r1]
stop
	b stop
	area mydata, data, readwrite
dst dcd 0 ;dst location in data memory
	end