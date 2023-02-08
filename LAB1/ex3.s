	AREA	RESET, DATA, READONLY
	EXPORT __Vectors
__Vectors 
	DCD 0x10001000 ; stack pointer value when stack is empty
	DCD Reset_Handler ; reset vector
	ALIGN
	AREA mycode, CODE, READONLY
code_val dcd 1,2,3,4,5,6,7,8,9,10
	ENTRY
	EXPORT Reset_Handler
Reset_Handler
	mov r0,#10
	ldr r1,=code_val
	ldr r2,=dst
loop 
	ldr r3,[r1],#4
	str r3,[r2]
	add r2,#4
	subs r0,#1
	bne loop
stop
	b stop
	
	
;SRC DCD 8 ;SRC location in code memory
	AREA mydata, DATA, READWRITE
dst DCD 0 ;DST location in data memory
	END