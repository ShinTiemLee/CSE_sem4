	area reset, data, readonly
	export __Vectors
__Vectors 
	dcd 0x10001000 ; stack pointer value when stack is empty
	dcd Reset_Handler ; reset vector
	align
	area mycode, code, readonly
	entry
	export Reset_Handler
Reset_Handler
	ldr r0,=n1
	ldr r10,=dst
	ldr r1,[r0]
	mov r2,#0xa
	mov r3,#0
	mov r4,#1
	mov r5,#0xf
up	mov r6,r1
	and r6,r5
	mla r3,r6,r4,r3
	mul r4,r2
	lsr r1,#4
	cmp r1,#0
	bne up
	str r3,[r10]
	
stop
	b stop
n1 dcd 15
	area mydata, data, readwrite
dst dcd 0 ;dst location in data memory
	end