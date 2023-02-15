	area reset, data, readonly
	export __Vectors
__Vectors 
	dcd 0x10001000 ; stack pointer value when stack is empty
	dcd Reset_Handler ; reset vector
	align
	area mycode, code, readonly
n1 dcd 1,2,3,3
n2 dcd 1,2,3,4
	entry
	export Reset_Handler
Reset_Handler
	mov r0,#4
	ldr r1,=n1
	ldr r2,=n2 
	ldr r3,[r1]
	ldr r4,[r2]
	mov r5,#0
	ldr r6,=dst
loop 
	adds r3,r5
	mov r5,#0
	adc r5,#0
	adds r3,r4
	adc r5,#0
	str r3,[r6],#4
	ldr r3,[r1,#4]!
	ldr r4,[r2,#4]!
	subs r0,#1
	bne loop
	str r5,[r6]
stop
	b stop
	area mydata, data, readwrite
dst dcd 0 ;dst location in data memory
	end