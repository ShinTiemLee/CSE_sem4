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
	ldr r1,=n2
	ldr r4,=dst
	mov r5,#4
	ldr r6,=0xffffffff
	msr xpsr,r6
	mov r8,#0
	ldr r2,[r0],#4
	ldr r3,[r1],#4
up 
	sbcs r7,r2,r3
	adc r8,#0
	str r7,[r4],#4
	ldr r2,[r0],#4
	ldr r3,[r1],#4
	cmp r8,#0
	beq reset1
	subs r5,#1
	mrs r9,xpsr
	orr r9,#0x20000000
	msr xpsr,r9
	bne up
	b stop
reset1
	subs r5,#1
	mrs r9,xpsr
	and r9,#0xdfffffff
	msr xpsr,r9
	bne up
	
stop
	b stop
n1 dcd 9,8,9,7
n2 dcd 1,4,5,6
	area mydata, data, readwrite
dst dcd 0 ;dst location in data memory
	end