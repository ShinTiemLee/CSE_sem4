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
	ldr r0,=src
	ldr r1,=dst
	ldr r3,[r0]
	mov r2,#0
	mla r2,r3,r3,r3
	lsr r2,#1
	str r2,[r1]
stop
	b stop
src dcd 5
	area mydata, data, readwrite
dst dcd 0
	end