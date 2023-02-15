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
	ldr r4,=result
	mov r2,#00
	ldr r0,=value1
	ldr r1,[r0]
	ldr r0,=value2
	ldr r3,[r0]
up
	cmp r1,r3
	bcc store
	sub r1,r3
	add r2,#01
	b up
store
	str r2,[r4],#4
	str r1,[r4]
stop
	b stop
value1 dcd 66
value2 dcd 11
	area mydata, data, readwrite
result dcd 0
	end