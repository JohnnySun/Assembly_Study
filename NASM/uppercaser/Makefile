uppercaser: uppercaser.o
	ld -o uppercaser uppercaser.o
uppercaser.o: uppercaser.asm
	nasm -f elf64 -g -F stabs uppercaser.asm
