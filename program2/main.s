	.text
	.org 0x0000
	add x3, xzr, xzr
	add x2, xzr, xzr
loop:  	ldur x0, [x3, #0]	
	add x2,x2,x0
	sub x15, x15, x1
	add x3, x3, x8
	cbz x15, endLoop
	cbz xzr, loop
endLoop:add x3, x3, x8
	stur x2, [x3, #0]
