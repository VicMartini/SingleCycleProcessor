	.text
	.org 0x0000
	add x3, xzr, xzr
loop:  	stur x0, [x3, #0]
	add x0,x0,x1
	sub x15, x15, x1
	add x3, x3, x8
	cbz x15, endLoop
	cbz xzr, loop
endLoop:add x3, x2, x1
	add x15, x14, x1
