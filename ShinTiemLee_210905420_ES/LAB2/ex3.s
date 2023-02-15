	area reset, data, readonly
	export __Vectors
__Vectors 
	dcd 0x10001000 ; stack pointer value when stack is empty
	dcd Reset_Handler ; reset vector
	align
	area mycode, code, readonly
n1 dcd 1,2,0xffffffff,0xffffffff
n2 dcd 1,2,3,4
	entry
	export Reset_Handler
Reset_Handler
	ldr r0,=dst
	ldr r1,=src
	ldr r3,[r1],#4
	ldr r4,[r1]
	subs r3,r4
	str r3,[r0]
	
stop
	b stop
src dcd 65,55
	area mydata, data, readwrite
dst dcd 0 ;dst location in data memory
	end