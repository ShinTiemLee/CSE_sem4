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
	mov r5,#10
	ldr r0,=num
	ldr r3,=result
	ldrb r1,[r0],#1
	and r2,r1,#0xf0
	lsr r2,#4
	cmp r2,r5
	bcc next1
	add r2,#7
next1	
	add r2,#0x30
	strb r2,[r3],#1
	and r4,r1,#0x0f
	cmp r4,r5
	bcc next2
	add r4,#7
next2	
	add r4,#0x30
	strb r4,[r3],#1

	
stop
	b stop
num dcb 0xA0
	area mydata, data, readwrite
result dcb 00
	end