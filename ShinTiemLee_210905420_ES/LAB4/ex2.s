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
	ldr r0,=result
	ldr r1,=value
	mov r2,#0
	ldr r3,[r1]
up
	cmp r3,#0xa
	bcc store
	sub r3,#0xa
	add r2,#1
	b up
store
	strb r3,[r0],#1
	mov r3,r2
	cmp r3,#0xa
	bcs up
	strb r3,[r0],#1
	mov r4,r0
	ldr r2,=packed
	ldr r0,=result
	sub r5,r4,r0
up1	ldrb r1,[r0],#1
	ldrb r3,[r0],#1
	lsl r3,#4
	orr r3,r1
	strb r3,[r2],#1
	sub r5,#2
	cmp r5,#1
	bge up1
stop 
	b stop

value dcw 0x10
	area mydata, data, readwrite
result dcd 0,0,0,0,0 
packed dcd 0
	end