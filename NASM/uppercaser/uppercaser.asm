; name : uppercaser.asm
; version : 1.0
; create time : 12/24/2014
; Marry Christmas!!!! happy New Year ASM!!!!!
; last modified :  12/24/2014
; anthor : JohnnySun
; nasm -f elf64 -g -F stabs uppercaser.asm
; ld -o uppercaser uppercaser.o
;

section .bss
		BUFFLEN equ 4096
		Buff: resb BUFFLEN

section .data

section .text
		global _start

_start:
		nop

read:
		mov eax, 3			; use sys_read system call
		mov ebx, 0			; use stdin
		mov ecx, Buff
		mov edx, BUFFLEN
		int 80H
		mov esi, eax		; save sys_read return
		;cmp eax, 0			; if eax = 0 then read EOF
		;je Done

		mov ecx, esi
		mov ebp, Buff

Scan:
		dec ecx			;ebp offset -1
		cmp byte [ebp+ecx], 61h
		jb Next				; if < a

		cmp byte [ebp+ecx], 7Ah
		ja Next				; if > b

		;Now we got
		sub byte [ebp+ecx], 20h

Next:
		cmp ecx, 0
		jnz Scan

Write:
		mov eax, 4			; use sys_write system_call
		mov ebx, 1			; use stdout
		mov ecx, Buff
		mov edx, esi
		int 80H
		jmp read

Done:
		mov eax, 1			;exit system call
		mov ebx, 0			; return 0
		int 80H
		
