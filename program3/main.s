	.text
	.org 0x0000
	
	add x2, xzr, xzr	
loop:	add x2, x17, x2
	sub x16, x16, x1
	cbz x16, endLoop
	cbz xzr, loop
endLoop: stur x2, [x0, #0]
