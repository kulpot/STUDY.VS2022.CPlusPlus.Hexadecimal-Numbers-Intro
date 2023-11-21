
.586
.model flat, c
.stack 100h
.data

;count dword ?		; -------> ---- Assembly Adding Powers ----
;	counter dword 0		; dword(doubleWord) is 32bits and 2words ---> 1byte=8bits, 2bytes=word, 4bytes(32bits)=2words -> dword
;count dword 0		; ------- Alternating Operations - A First Code Attempt --------
;count dword 1		; -------------- Alternating Operations - Correct But Not Elegant It Smells ------------------------
;power dword 2		; ------- Alternating Operations - A First Code Attempt --------
;total dword 0		; ------- Alternating Operations - A First Code Attempt --------

;count dword 0		; ----- Assembly - Stack 1, 2 --------- Alternating Operations - Making the Loop Do All of the Work ----------------------------
;power dword 1		; ----- Assembly - Stack 1, 2--------- Alternating Operations - Making the Loop Do All of the Work ----------------------------
;evenOrOddCheckValue dword 2			; ----------- if else in Assembly ------------

.code

doit proc			; proc -- procedure

	; this is a comment i can type whatever i like after a semicolon and assembler will ignore it
	; static data -- ex. count dword 0 -- static data stays until the duration of the program
	; ESP - stack pointer - visually the stack address is going upward while MEMORY ADDRESS goes downward
	; INTELs least significant value - also called LSb(LeastSignificantBit)
	; In computing, the least significant bit (LSb) is the bit position in a binary integer representing the binary 1s place of the integer. Similarly, the most significant bit (MSb) represents the highest-order place of the binary integer.
	; proc -- procedure - outside assembly program call, 
	; labels -- looks like proc with ":"  , can only be called inside assembly program, while doit proc is outside 
	; goto's badside - ++spaghetti code 

	; ---------------------------------- Binary Numbers Introduction -------------------------------
	; ref link:https://www.youtube.com/watch?v=4ge-gcrlP5c&list=PLRwVmtr-pp06-8kzgl6j-hp7JSd829ro2

	; Human - decimal - base 10 - 0 1 2 3 4 5 6 7 8 9
	; Computer - binary - base 2 - 0 1 (off/on)

	; bit - is a contraction of binary digit

	; ----------------------------------- Converting Binary Values to Decimal ---------------------------
	; ref link:https://www.youtube.com/watch?v=RhiFsBIXyME&list=PLRwVmtr-pp06-8kzgl6j-hp7JSd829ro2&index=2

	; 1011			base10 = $1011		base2 = $11

	;	Binary		Decimal
	;	000			0
	;	001			1
	;	010			2
	;	011			3
	;	100			4
	;	101			5

	;	Binary to Decimal computation

	;	128	| 64 | 32 | 16 | 8 | 4 | 2 | 1
	;	1	| 0  | 1  | 1  | 0 | 1 | 0 | 1

	;	128 + 0  + 32 + 16 + 0 + 4 + 0 + 1	= 181

	; ------------------------------------- Comparing Decimal Numbers to Binary Numbers ----------------------------------------
	; ref link:https://www.youtube.com/watch?v=Og2LAVEltOE&list=PLRwVmtr-pp06-8kzgl6j-hp7JSd829ro2&index=3
	
	; there's 10 types of people in the world: those who understand binary and those who dont't.
	; 10 in binarty = 2 in decimal

	; 1101101 binary = 1+4+8+32+64 = 109 decimal

	; binary to decimal: 2x
	; decimal to binary: 10X

	; 1000	| 100 | 10 | 1	
	;	3	| 9   | 6  | 4

	; 3000	+ 900 + 60 + 4	= 3964

	; ---------------------------------- Adding Binary Numbers --------------------------------------------------
	; ref link:https://www.youtube.com/watch?v=hAKQRjybcIU&list=PLRwVmtr-pp06-8kzgl6j-hp7JSd829ro2&index=5

	; sample bank acc: 3982	-- 3 is the most significant digit and 2 is the least significant digit

	; 1010 + 0110 = 1000binary, or 16decimal

	;	168421
	;	1 11
	;	  1010	10
	;	  0110	6
	;	 ---------
	;	1 0000	16

	; 2496 + 4382 = 6878

	; --------------------------------- Leading Zeros ------------------------------------------------------
	; ref link:https://www.youtube.com/watch?v=A09gedK9gvM&list=PLRwVmtr-pp06-8kzgl6j-hp7JSd829ro2&index=7

	;	Binary		Decimal
	;	00			0
	;	01			1
	;	10			2
	;	11			3

	; leading zeros -- ex. $ 000034,000   
	; nible - groups of four bits 0000
	; byte - groups of eight bits 0000 0000

	; ---------------------------------- Binary Overflow ------------------------------------------------
	; ref link:https://www.youtube.com/watch?v=c7FrcG6uS4E&list=PLRwVmtr-pp06-8kzgl6j-hp7JSd829ro2&index=8

	; 0000 0000 is a null leading zero values of byte
	; overflow - over the bits that can be hold
	; 11 + 01 = 100	 this is a 2bit overflow
	; overflow isues in 34bits vs 64bits

	; ---------------------------------- Converting Decimal Numbers to Binary Numbers --------------------------
	; ref link:https://www.youtube.com/watch?v=rcLdS9Rw7OI&list=PLRwVmtr-pp06-8kzgl6j-hp7JSd829ro2&index=10

	;	Binary to Decimal computation

	;	10110101 to decimal?
	;	128	| 64 | 32 | 16 | 8 | 4 | 2 | 1
	;	1	| 0  | 1  | 1  | 0 | 1 | 0 | 1
	;	128 + 0  + 32 + 16 + 0 + 4 + 0 + 1	= 181

	;	Decimal to Binary computation

	;	96 to binary?
	;	512 | 256 | 128 | 64 | 32 | 16 | 8 | 4 | 2 | 1	
	;	0   | 0   | 0   | 1  | 1  | 0  | 0 | 0 | 0 | 0	=	0001100000
	;	96 - 64 = 32 - 32 = 0

	;	173 to binary?
	;	512 | 256 | 128 | 64 | 32 | 16 | 8 | 4 | 2 | 1	
	;	0   | 0   | 1   | 0  | 1  | 0  | 1 | 1 | 0 | 1	=	0010101101
	;	173 - 128 = 45 - 32 = 13 - 8 = 5 - 4 = 1 - 1 = 0

	; -------------------------------------- Hexadecimal Numbers Intro ---------------------------------------------
	; ref link:https://www.youtube.com/watch?v=CWDmKtSR15s&list=PLRwVmtr-pp06-8kzgl6j-hp7JSd829ro2&index=10

	; Hexadecimal - Hexa means 6 sided polygon + decimal which is base 10 so 6+10= 16 base
	; Hexadecimal - base 16 , 0123456789ABCDEF
	; 65536 | 4096 | 256  | 16   | 1
	; 16^4  | 16^3 | 16^2 | 16^1 | 16^0 
	; 0     | 0    | 0    | 4    | 0 

	; Decimal - base 10, 0123456789
	; 10k  | 1k   | 100  | 10   | 1
	; 10^4 | 10^3 | 10^2 | 10^1 | 10^0 
	; 3    | 9    | 8    | 2    | 5   
	
	; Binary - base 2, 01
	; 32  | 16  | 8   | 4   | 2   | 1
	; 2^5 | 2^4 | 2^3 | 2^2 | 2^1 | 2^0
	; 1   | 1   | 0   | 1   | 0   | 1




















	; --------------------------------- Child Programmer -------------------------------------------------
	; ref link:https://www.youtube.com/watch?v=_YYOnqMN4wQ&list=PLRwVmtr-pp05c1HTBj1no6Fl6C6mlxYDG&index=48

	; simple program thats add 1+2+3+4+5

;	mov eax,0		;eax - is a registers which is a tiny component of cpu
;	mov ebx,1		; move 1 to ebx
;again:
;	add eax,ebx		; add whatever in ebx to eax
;	inc ebx			; increment ebx means add 1 to ebx
;	cmp ebx,5		; compare ebx to 5
;	jle again		; jumplessthanorequalto "again:" -- will activate when cmp ebx is jle to 5
;
;
;ret

	; --------------------------- Spaghetti Code ----------------------------------------------------------
	; ref link:https://www.youtube.com/watch?v=RXpMHdB2Lfg&list=PLRwVmtr-pp05c1HTBj1no6Fl6C6mlxYDG&index=47

	; % - mudole
	; odd - 1%, even - 0%, use edx - remainder

	;+ 2^0 * 2^1 + 2^2 * 2^3 + 2^4 * 2^5 + 2^6 +..... 2^n

	;	 loop(ebx)		Power(power)	total(ecx)		totalHex
;		2^1				2				2				2
;		2^2				4				6				6
;		2^3				8				48				30
;		2^4				16				64				40
;		2^5				32				2048			800
;		2^6				64				2112			840

;	mov ebx, 2			; Base
;	;xor ecx, ecx		; 0 out ecx -- startout in zero erases the total
;	mov ecx, 1
;
;again:				; loop mul to add
;	; Repeat if necessary
;	cmp count, 5		
;	je Done					; je - jumpequal
;
;	call CalculateNextPower			; call is the same as jmp
;
;	; Check if we are at an even or odd power
;	mov eax, count
;	xor edx, edx
;	div evenOrOddCheckValue
;	cmp edx, 0
;	je DoAdd
;	jmp DoMultiply
;
;DoMultiply:
;	; Multiply the current power to the total
;	mov eax, power
;	mul ecx				
;	mov ecx, eax	
;	jmp PopOut
;
;DoAdd:
;	; Add the power to total
;	add ecx, power
;	jmp PopOut
;
;PopOut:
;	jmp again
;
;
;Done:
;	ret

;CalculateNextPower:
;	; Next power:	; redundant code
;	mov eax, power
;	mul ebx			
;	mov power, eax
;	inc count
;	;jmp back1			; BUG: theres back and back2 requires procedures
;	ret












	; ------------------------------ if else in Assembly ---------------------------------
	;ref link:https://www.youtube.com/watch?v=BVOIBDwmOTM&list=PLRwVmtr-pp05c1HTBj1no6Fl6C6mlxYDG&index=46
	; % - mudole
	; odd - 1%, even - 0%, use edx - remainder

	;+ 2^0 * 2^1 + 2^2 * 2^3 + 2^4 * 2^5 + 2^6 +..... 2^n

	;	 loop(ebx)		Power(power)	total(ecx)		totalHex
;		2^1				2				2				2
;		2^2				4				6				6
;		2^3				8				48				30
;		2^4				16				64				40
;		2^5				32				2048			800
;		2^6				64				2112			840

;	mov ebx, 2			; Base
;	;xor ecx, ecx		; 0 out ecx -- startout in zero erases the total
;	mov ecx, 1
;
;again:				; loop mul to add
;	; Repeat if necessary
;	cmp count, 5		
;	je Done					; je - jumpequal
;
;	call CalculateNextPower			; call is the same as jmp
;
;	; Check if we are at an even or odd power
;	mov eax, count
;	xor edx, edx
;	div evenOrOddCheckValue
;	cmp edx, 0
;	je DoAdd
;	jmp DoMultiply
;
;DoMultiply:
;	; Multiply the current power to the total
;	mov eax, power
;	mul ecx				
;	mov ecx, eax	
;	jmp PopOut
;
;	call CalculateNextPower
;
;DoAdd:
;	; Add the power to total
;	add ecx, power
;	jmp PopOut
;
;PopOut:
;	jmp again
;
;
;Done:
;	ret

;CalculateNextPower:
;	; Next power:	; redundant code
;	mov eax, power
;	mul ebx			
;	mov power, eax
;	inc count
;	;jmp back1			; BUG: theres back and back2 requires procedures
;	ret

















	; ------------------------------- Modulus ------------------------------------------------------
	; ref link:https://www.youtube.com/watch?v=zBA-7mUzC-w&list=PLRwVmtr-pp05c1HTBj1no6Fl6C6mlxYDG&index=45
	; % - mudole
	; odd - 1%, even - 0%, use edx - remainder 

	;; static data -- RAM -- Stack -- popping out of stack -- LIFO -- LastInFirstOut -- plate reference
	;int count
	;add power, 8
	;inc count
	;inc count
	;add power, 99
	;inc power

	;push 8			; push -- put data on a stack
	;push 14
	;push eax		; INTELs least significant value in hexa - c0 1f 12 00 -- registers - 00123FC0
	;push eax		; INTELs least significant value in hexa - c0 1f 12 00 -- registers - 00123FC0
	;push 72
	;
	;pop ebx			; pop -- last push(LIFO) -- 72 to ebx
	;pop ecx			; pop -- push eax to ecx
	;pop edx			; pop -- push eax to edx	
	;pop eax			; pop -- push 14 to eax
	;pop ecx			; pop -- push 8 to ecx		;bugs: if last push stack is not use


		
	;+ 2^0 * 2^1 + 2^2 * 2^3 + 2^4 * 2^5 + 2^6 +..... 2^n

	;	 loop(ebx)		Power(power)	total(ecx)		totalHex
;		2^1				2				2				2
;		2^2				4				6				6
;		2^3				8				48				30
;		2^4				16				64				40
;		2^5				32				2048			800
;		2^6				64				2112			840

;	mov ebx, 2			; Base
;	;xor ecx, ecx		; 0 out ecx -- startout in zero erases the total
;	mov ecx, 1
;
;again:				; loop mul to add
;	; Repeat if necessary
;	cmp count, 5		
;	jl Done
;
;	call CalculateNextPower			; call is the same as jmp
;back1:
;	; Multiply the current power to the total
;	mov eax, power
;	mul ecx				; replace total to ecx
;	mov ecx, eax		; replace total to ecx
;
;	call CalculateNextPower
;back2:
;	; Add the power to total
;	add ecx, power
;
;	;; Repeat if necessary
;	;cmp count, 0		
;	;jl again
;
;Done:
;	ret

;CalculateNextPower:
;	; Next power:	; redundant code
;	mov eax, power
;	mul ebx			
;	mov power, eax
;	inc count
;	;jmp back1			; BUG: theres back and back2 requires procedures
;	ret









	;	----------------------------- Stepping Too Far per Iteration -----------------------------------
	; ref link:https://www.youtube.com/watch?v=SE1VX4V1g-E&list=PLRwVmtr-pp05c1HTBj1no6Fl6C6mlxYDG&index=46


	;; static data -- RAM -- Stack -- popping out of stack -- LIFO -- LastInFirstOut -- plate reference
	;int count
	;add power, 8
	;inc count
	;inc count
	;add power, 99
	;inc power

	;push 8			; push -- put data on a stack
	;push 14
	;push eax		; INTELs least significant value in hexa - c0 1f 12 00 -- registers - 00123FC0
	;push eax		; INTELs least significant value in hexa - c0 1f 12 00 -- registers - 00123FC0
	;push 72
	;
	;pop ebx			; pop -- last push(LIFO) -- 72 to ebx
	;pop ecx			; pop -- push eax to ecx
	;pop edx			; pop -- push eax to edx	
	;pop eax			; pop -- push 14 to eax
	;pop ecx			; pop -- push 8 to ecx		;bugs: if last push stack is not use


		
	;+ 2^0 * 2^1 + 2^2 * 2^3 + 2^4 * 2^5 + 2^6 +..... 2^n

	;	 loop(ebx)		Power(power)	total(ecx)		totalHex
;		2^1				2				2				2
;		2^2				4				6				6
;		2^3				8				48				30
;		2^4				16				64				40
;		2^5				32				2048			800
;		2^6				64				2112			840

;	mov ebx, 2			; Base
;	;xor ecx, ecx		; 0 out ecx -- startout in zero erases the total
;	mov ecx, 1
;
;again:				; loop mul to add
;	; Repeat if necessary
;	cmp count, 5		
;	jl Done
;
;	call CalculateNextPower			; call is the same as jmp
;back1:
;	; Multiply the current power to the total
;	mov eax, power
;	mul ecx				; replace total to ecx
;	mov ecx, eax		; replace total to ecx
;
;	call CalculateNextPower
;back2:
;	; Add the power to total
;	add ecx, power
;
;	;; Repeat if necessary
;	;cmp count, 0		
;	;jl again
;
;Done:
;	ret

;CalculateNextPower:
;	; Next power:	; redundant code
;	mov eax, power
;	mul ebx			
;	mov power, eax
;	inc count
;	;jmp back1			; BUG: theres back and back2 requires procedures
;	ret














	;	---------------------- Labels vs Procedures ---------------------------------------------
	; ref link:https://www.youtube.com/watch?v=jlchFQuOwCc&list=PLRwVmtr-pp05c1HTBj1no6Fl6C6mlxYDG&index=43
	; proc -- procedure - outside assembly program call, 
	; labels -- looks like proc with ":"  , can only be called inside assembly program, while doit proc is outside 

	;; static data -- RAM -- Stack -- popping out of stack -- LIFO -- LastInFirstOut -- plate reference
	;int count
	;add power, 8
	;inc count
	;inc count
	;add power, 99
	;inc power

	;push 8			; push -- put data on a stack
	;push 14
	;push eax		; INTELs least significant value in hexa - c0 1f 12 00 -- registers - 00123FC0
	;push eax		; INTELs least significant value in hexa - c0 1f 12 00 -- registers - 00123FC0
	;push 72
	;
	;pop ebx			; pop -- last push(LIFO) -- 72 to ebx
	;pop ecx			; pop -- push eax to ecx
	;pop edx			; pop -- push eax to edx	
	;pop eax			; pop -- push 14 to eax
	;pop ecx			; pop -- push 8 to ecx		;bugs: if last push stack is not use


		
	; * 2^1 + 2^2 * 2^3 + 2^4 * 2^5 + 2^6 +..... 2^n

	;	 loop(ebx)		Power(power)	total(ecx)		totalHex
;		2^1				2				2				2
;		2^2				4				6				6
;		2^3				8				48				30
;		2^4				16				64				40
;		2^5				32				2048			800
;		2^6				64				2112			840

;	mov ebx, 2			; Base
;	;xor ecx, ecx		; 0 out ecx -- startout in zero erases the total
;	mov ecx, 1
;
;again:				; loop mul to add
;	;;;;;;;; Next power:	; redundant code
;	;;;;;;;mov eax, power		; for intel structure running eax
;	;;;;;;;mul ebx				; for intel structure running eax
;	;;;;;;;mov power, eax		; for intel structure running eax
;	;;;;;;;inc count
;
;	;jmp CalculateNextPower			; jump is highly than goto
;	call CalculateNextPower			; call is the same as jmp
;back1:
;	; Multiply the current power to the total
;	mov eax, power
;	mul ecx				; replace total to ecx
;	mov ecx, eax		; replace total to ecx
;
;	;;;;;;;; Next power:	; redundant code
;	;;;;;;;mov eax, power
;	;;;;;;;mul ebx			
;	;;;;;;;mov power, eax
;	;;;;;;;inc count
;
;	;jmp CalculateNextPower
;	call CalculateNextPower
;back2:
;	; Add the power to total
;	add ecx, power
;
;	; Repeat if necessary
;	cmp count, 5		
;	jl again
;	ret

;CalculateNextPower:
;	; Next power:	; redundant code
;	mov eax, power
;	mul ebx			
;	mov power, eax
;	inc count
;	;jmp back1			; BUG: theres back and back2 requires procedures
;	ret











	; ------------------------ Assembly - Stack Part 2 --------------------------------------------
	; ref link:https://www.youtube.com/watch?v=fMaLPvdP6ZE&list=PLRwVmtr-pp05c1HTBj1no6Fl6C6mlxYDG&index=43


	;; static data -- RAM -- Stack -- popping out of stack -- LIFO -- LastInFirstOut -- plate reference
	;int count
	;add power, 8
	;inc count
	;inc count
	;add power, 99
	;inc power

	;push 8			; push -- put data on a stack
	;push 14
	;push eax		; INTELs least significant value in hexa - c0 1f 12 00 -- registers - 00123FC0
	;push eax		; INTELs least significant value in hexa - c0 1f 12 00 -- registers - 00123FC0
	;push 72
	;
	;pop ebx			; pop -- last push(LIFO) -- 72 to ebx
	;pop ecx			; pop -- push eax to ecx
	;pop edx			; pop -- push eax to edx	
	;pop eax			; pop -- push 14 to eax
	;pop ecx			; pop -- push 8 to ecx		;bugs: if last push stack is not use





















	; ------------------------ Assembly - Stack Part 1 ------------------------------------------------------
	; ref link:https://www.youtube.com/watch?v=HTZj97WgvJY&list=PLRwVmtr-pp05c1HTBj1no6Fl6C6mlxYDG&index=40

	;; static data -- RAM -- Stack -- popping out of stack -- LIFO -- LastInFirstOut -- plate reference
	;int count
	;add power, 8
	;inc count
	;inc count
	;add power, 99
	;inc power

	;push 8			; push -- put data on a stack
	;push 14
	;push eax
	;push eax
	;push 72
	;
	;pop ebx			; pop -- last push(LIFO) -- 72 to ebx
	;pop ecx			; pop -- push eax to ecx
	;pop edx			; pop -- push eax to edx	
	;pop eax			; pop -- push 14 to eax
	;pop ecx			; pop -- push 8 to ecx		;bugs: if last push stack is not use


























	; ------------------- Introduction to Assembly's call Instruction --------------------------------
	
	; * 2^1 + 2^2 * 2^3 + 2^4 * 2^5 + 2^6 +..... 2^n

	;	 loop(ebx)		Power(power)	total(ecx)		totalHex
;		2^1				2				2				2
;		2^2				4				6				6
;		2^3				8				48				30
;		2^4				16				64				40
;		2^5				32				2048			800
;		2^6				64				2112			840

;	mov ebx, 2			; Base
;	;xor ecx, ecx		; 0 out ecx -- startout in zero erases the total
;	mov ecx, 1
;
;again:				; loop mul to add
;	;;;;;;;; Next power:	; redundant code
;	;;;;;;;mov eax, power		; for intel structure running eax
;	;;;;;;;mul ebx				; for intel structure running eax
;	;;;;;;;mov power, eax		; for intel structure running eax
;	;;;;;;;inc count
;
;	;jmp CalculateNextPower			; jump is highly than goto
;	call CalculateNextPower			; call is the same as jmp
;back1:
;	; Multiply the current power to the total
;	mov eax, power
;	mul ecx				; replace total to ecx
;	mov ecx, eax		; replace total to ecx
;
;	;;;;;;;; Next power:	; redundant code
;	;;;;;;;mov eax, power
;	;;;;;;;mul ebx			
;	;;;;;;;mov power, eax
;	;;;;;;;inc count
;
;	;jmp CalculateNextPower
;	call CalculateNextPower
;back2:
;	; Add the power to total
;	add ecx, power
;
;	; Repeat if necessary
;	cmp count, 5		
;	jl again
;	ret
;
;CalculateNextPower:
;	; Next power:	; redundant code
;	mov eax, power
;	mul ebx			
;	mov power, eax
;	inc count
;	jmp back1			; BUG: theres back and back2 requires procedures







	; -------------------- Alternating Operations - Refactoring Redundant Code ---------------------------
	
	; * 2^1 + 2^2 * 2^3 + 2^4 * 2^5 + 2^6 +..... 2^n

	;	 loop(ebx)		Power(power)	total(ecx)		totalHex
;		2^1				2				2				2
;		2^2				4				6				6
;		2^3				8				48				30
;		2^4				16				64				40
;		2^5				32				2048			800
;		2^6				64				2112			840

;	mov ebx, 2			; Base
;	;xor ecx, ecx		; 0 out ecx -- startout in zero erases the total
;	mov ecx, 1
;
;again:				; loop mul to add
;	;;;;;;;; Next power:	; redundant code
;	;;;;;;;mov eax, power		; for intel structure running eax
;	;;;;;;;mul ebx				; for intel structure running eax
;	;;;;;;;mov power, eax		; for intel structure running eax
;	;;;;;;;inc count
;
;	jmp CalculateNextPower			; jump is highly than goto
;back:
;	; Multiply the current power to the total
;	mov eax, power
;	mul ecx				; replace total to ecx
;	mov ecx, eax		; replace total to ecx
;
;	;;;;;;;; Next power:	; redundant code
;	;;;;;;;mov eax, power
;	;;;;;;;mul ebx			
;	;;;;;;;mov power, eax
;	;;;;;;;inc count
;
;	jmp CalculateNextPower
;back2:
;	; Add the power to total
;	add ecx, power
;
;	; Repeat if necessary
;	cmp count, 5		
;	jl again
;	ret
;
;CalculateNextPower:
;	; Next power:	; redundant code
;	mov eax, power
;	mul ebx			
;	mov power, eax
;	inc count
;	jmp back2			; BUG: theres back and back2 requires procedures






	; -------------- Alternating Operations - Making the Loop Do All of the Work ----------------------------
	
	; * 2^1 + 2^2 * 2^3 + 2^4 * 2^5 + 2^6 +..... 2^n

	;	 loop(ebx)		Power(power)	total(ecx)		totalHex
;		2^1				2				2				2
;		2^2				4				6				6
;		2^3				8				48				30
;		2^4				16				64				40
;		2^5				32				2048			800
;		2^6				64				2112			840

;	mov ebx, 2			; Base
;	;xor ecx, ecx		; 0 out ecx -- startout in zero erases the total
;	mov ecx, 1
;
;again:				; loop mul to add
;	; Next power:	; redundant code
;	mov eax, power		; for intel structure running eax
;	mul ebx				; for intel structure running eax
;	mov power, eax		; for intel structure running eax
;	inc count
;
;	; Multiply the current power to the total
;	mov eax, power
;	mul ecx				; replace total to ecx
;	mov ecx, eax		; replace total to ecx
;
;	; Next power:	; redundant code
;	mov eax, power
;	mul ebx			
;	mov power, eax
;	inc count
;
;	; Add the power to total
;	add ecx, power
;
;	; Repeat if necessary
;	cmp count, 5		
;	jl again
;	ret








	; -------------- Alternating Operations - Correct But Not Elegant It Smells ------------------------
	
	; 2^1 + 2^2 * 2^3 + 2^4 * 2^5 + ..... 2^n

	;	 loop(ebx)		Power(power)	total(ecx)		totalHex
;		2^1				2				2				2
;		2^2				4				6				6
;		2^3				8				48				30
;		2^4				16				64				40
;		2^5				32				2048			800

;	mov ebx, 2
;	xor ecx, ecx		; 0 out ecx
;	add ecx, power
;
;again:
;	; Next power:	; redundant code
;	mov eax, power		; for intel structure running eax
;	mul ebx				; for intel structure running eax
;	mov power, eax		; for intel structure running eax
;	inc count
;
;	; Add the power to total
;	add ecx, power
;
;	; Next power:	; redundant code
;	mov eax, power
;	mul ebx			
;	mov power, eax
;	inc count
;
;	; Multiply the current power to the total
;	mov eax, power
;	mul ecx				; replace total to ecx
;	mov ecx, eax		; replace total to ecx
;
;	; Repeat if necessary
;	inc count
;	cmp count, 5		
;	jl again
;	ret

	; ------------------- Alternating Operations - Initial Issues With Our First Attempt ------------------------------

	; 2^1 + 2^2 * 2^3 + 2^4 * 2^5 + ..... 2^n

	;	 loop(ebx)		Power(power)	total(ecx)		totalHex
;		2^1				2				2				2
;		2^2				4				6				6
;		2^3				8				48				30
;		2^4				16				64				40
;		2^5				32				2048			800

;	mov ebx, 2
;	xor ecx, ecx		; 0 out ecx
;again:
;	add ecx, power
;	mov eax, power		; for intel structure running eax
;	mul ebx				; for intel structure running eax
;	mov power, eax		; for intel structure running eax
;	add ecx, power
;
;	mov eax, power
;	mul ebx			
;	mov power, eax
;
;	mov eax, power
;	mul ecx				; replace total to ecx
;	mov ecx, eax		; replace total to ecx
;
;	inc count
;	cmp count, 5		; bug count 1 add/mul
;	jl again
;	ret

	; -------------------- Alternating Operations - A First Code Attempt --------------------------------------

	; 2^1 + 2^2 * 2^3 + 2^4 * 2^5 + ..... 2^n

	;	 loop(ebx)		Power(power)	total(ecx)		totalHex
;		2^1				2				2				2
;		2^2				4				6				6
;		2^3				8				48				30
;		2^4				16				64				40
;		2^5				32				2048			800

;	mov ebx, 2
;again:
;	add ecx, power
;	mov eax, power		; for intel structure running eax
;	mul ebx				; for intel structure running eax
;	mov power, eax		; for intel structure running eax
;	add ecx, power
;
;	mov eax, power
;	mul ebx			
;	mov power, eax
;
;	mov eax, power
;	mul total
;	mov total, eax
;
;	inc count
;	cmp count, 5
;	jl again
;	ret

	; --------------------- Alternating Operations - Engineering a Solution --------------------------------------

	; 2^1 + 2^2 * 2^3 + 2^4 * 2^5 + ..... 2^n

	;	 loop(ebx)		Power(eax)		total(ecx)		totalHex
;		2^1				2				2				2
;		2^2				4				6				6
;		2^3				8				48				30
;		2^4				16				64				40
;		2^5				32				2048			800

	;ret

	; ----------------------- Alternating Operations - Our Next Challenge ------------------------------------------

	; 3^1 + 3^2 * 3^3 + 3^4 * 3^5 + ..... 3^n


	; ----------------- Assembly - Jump Overflow ------------------------------------

	; Static - means its loaded, it exist for the entire duration of the program
	; General Purpose Registers - eax, ebx, ecx, edx 
	; zero flag - bit 6	-> 1 if result is 0, 0 if result is not 0
	; sign flag - bit 7	-> 1 if negative, 0 if positive
	; overflow bit - bit 11
	
	; 3^5 = 3x3x3x3x3=243	; total sum 363, total hex 16B
	; program exercise of how many multiplyCauseAnOverflow by 3's to overflow -> overflow in etiration 20

;	 loop(ebx)		Power(eax)		totalSum(ecx)		totalHex
;		3^1				3				3					3
;		3^2				9				12					C
;		3^3				27				39					27
;		3^4				81				120					78
;		3^5				243				363					16B
	; ----- initialization -----
;	mov eax, 1
;	mov	ebx, 3
;	xor ecx, ecx
;	xor edx, edx
;
;again:
;
;	mul ebx,	
;	;jo multiplyCauseAnOverflow		;jo - jump overflow
;	add ecx, eax
;	jo additionCauseAnOverflow
;	inc counter
;	cmp counter, 5
;	;cmp counter, 100		; overflow value of ECX = B6D41DB8, which is over 32bits  
;	jl again
;
;;multiplyCauseAnOverflow:
;;	nop			; nop - no operation - means waste away, for breakpoint
;additionCauseAnOverflow
;	nop
;	ret			; ecx --- holds the total value of 363 in Hex is 16B
	
	; -------- How overflow bit turn on ---------

;	mov eax, 0ffffffffh
;	mov ebx, 2
;	mul ebx
;
;	ret

	; ----------------- Assembly - Static Memory ---------------------------------------

	; Static - means its loaded, it exist for the entire duration of the program
	; General Purpose Registers - eax, ebx, ecx, edx 
	
	; 3^5 = 3x3x3x3x3=243	; total sum 363, total hex 16B


;	 loop(ebx)		Power(eax)		totalSum(ecx)		totalHex
;		3^1				3				3					3
;		3^2				9				12					C
;		3^3				27				39					27
;		3^4				81				120					78
;		3^5				243				363					16B
	; ----- initialization -----
;	mov eax, 1
;	mov	ebx, 3
;	xor ecx, ecx
;	xor edx, edx
;
;again:
;	mul ebx,		
;	add ecx, eax
;	inc counter
;	cmp counter, 5
;	;cmp counter, 100		; overflow value of ECX = B6D41DB8, which is over 32bits  
;	jl again
;
;	ret			; ecx --- holds the total value of 363 in Hex is 16B

	; ----------------- Assembly - Adding Up to the Nth Power ----------------------------------
	; 3^5 = 3x3x3x3x3=243	; total sum 363, total hex 16B
;	 loop(ebx)		Power(eax)		totalSum(ecx)		totalHex
;		3^1				3				3					3
;		3^2				9				12					C
;		3^3				27				39					27
;		3^4				81				120					78
;		3^5				243				363					16B
	; ----- initialization -----
;	mov eax, 1
;	mov	ebx, 3
;	xor ecx, ecx
;	xor edx, edx
;
;again:
;	mul ebx,		
;	add ecx, eax
;	inc edx			; error loop 
;	;cmp eax, 243
;	cmp edx, 5
;	jl again
;
;	ret

	; ----------------- Assembly - Writing a Program to Add the Powers -------------------------

		; requires self implementation knowledge
	; 3square = 3 x 3 = 9	; total sum 12, total hex C
	; 3^5 = 3x3x3x3x3=243	; total sum 363, total hex 16B
;	 loop(ebx)		Power(eax)		totalSum(ecx)		totalHex
;		3^1				3				3					3
;		3^2				9				12					C
;		3^3				27				39					27
;		3^4				81				120					78
;		3^5				243				363					16B
	; program challenge: 3^1 + 3^2 + 3^3 + 3^4 + ..... + 3^100
	
	; ----- initialization -----
;	mov eax, 1
;	mov	ebx, 3
;	xor ecx, ecx
;
;again:
;	mul ebx, eax		
;	add ecx, eax
;	cmp eax, 243
;	jl again
;
;	ret

	; --------------- Assembly Adding Powers ------------------------

	; requires self implementation knowledge
	; 3square = 3 x 3 = 9	; total sum 12, total hex C
	; 3^5 = 3x3x3x3x3=243	; total sum 363, total hex 16B
;	 loop(eax)		Power(ebx)		totalSum(ecx)		totalHex
;		3^1				3				3					3
;		3^2				9				12					C
;		3^3				27				39					27
;		3^4				81				120					78
;		3^5				243				363					16B
	; program challenge: 3^1 + 3^2 + 3^3 + 3^4 + ..... + 3^100

	;ret

	; ---------- Subtle Assembly Bugs --------------------
	
	; eax will store the accumalation (sum)
	; ecx will store the count

	; ----- add 1 to 10000 --------

;	move eax, 0
;	move ecx, 1
;again:
;	add eax, ecx
;;again:				 ; error infinite loop with no change 
;	inc ecx
;	cmp ecx, 10000	; increment to 10000
;	;cmp ecx, 3
;	;inc ecx		; error cmp must be above the jle(conditional branch)
;;again:				 ; error infinite loop of "jle again"
;	jle again		; jump lessthan/equalto
;
;
;	ret			

	; ----------- Assembly Adding 1 to 100 -----------------

	; eax will store the accumalation (sum)
	; ecx will store the count

	; ----- add 1 + 2 + 3 -----		; result 6
;
;	move eax, 0
;	move ecx, 1
;again:
;	add eax, ecx
;	inc ecx
;	cmp ecx, 3		; increment to 6
;	jle again		; jump lessthan/equalto
;
;	; add 1 + 2 + 3		; result 6
;
;	ret				; result 6  will ret bec -> not jle -> cmp ecx, 3

;	; ----- add 1 to 100 --------
;
;	move eax, 0
;	move ecx, 1
;again:
;	add eax, ecx
;	inc ecx
;	cmp ecx, 100	; increment to 100
;	jle again		; jump lessthan/equalto
;
;
;	ret			

	; ----------- Assembly Multiple Branches --------------
	; combining conditional/unconditional branching statements

	;move eax, 3
	;move eax, 5		; cmp eax ---- 5 - 5 = 0 (signflag(0))(zeroflag(1))
;	move eax, 9
;	cmp eax, 5		; 3 - 5 = -2 (signflag(1))(zeroflag(0))
;	jl lessThan5	; conditional branching statements
;	je equalTo5
;	jg greaterThan5
;
;lessThan5:			
;	mov ebx, -1		; 0FFFFFFFFh
;	jmp done		; unconditional branching statements
;equalTo5:			; 5-5=0 will jump here
;	mov ebx, 0
;	jmp done
;greaterThan5:		; move eax, 9 will jump here
;	mov ebx, 1
;	jmp done
;done:
;
;	ret				; return statement - also a branch

	; --------- Assembly Conditional Jumps -------------
	; Compare Instructions(cmp) --- sign (1(negative) 0(Positive)), zero (1(0value) 0(not0value))
	; Critical Point -- cmp must be above of a conditional branch example jl

;	mov eax, 0
;doItAgain:
;	inc eax
;	cmp eax, 5
;	;jmp doItAgain		; jmp -- unconditional branch(upward)
;	;jl doItAgain		; conditional branch(upward) jl -- jump less than	; cmp eax, 5 ; 5-5=0 
;	jge doItAgain		; jge - jump greaterthanequalto -- conditional branch(upward)
;
;	ret

	; -------- Assembly Increment (inc) and Decrement (dec) -------------

;	;mov eax, 0
;	;add eax, 1
;	;inc eax				; inc eax is same as add eax
;	;add eax, 1
;	;dec eax				; dec eax is same as sub eax
;	;add eax, 1
;	;add eax, 1
;
;	mov eax, 0
;doItAgain:				; unconditional jumping
;	;add eax, 1
;	inc eax
;	jmp doItAgain
;
;
;
;	ret

	; --------- Assembly Jump (jmp) Instruction ------------
	; EIP ---  Extended(32bits) Instruction Pointer -- a tracker to point its next instruction to execute
	; jmp --- same as goto(requires knowledge in goto)
	; main point is that every time you use a break, continue, return, if, while, for, do-while, and even a throw, you are using goto. They are just "controlled" or "structured" gotos, but they are still gotos.  However, in C# and C++, a goto is best if only used to break out of nested loops. You can't break out of nested loops by just using "break", so you are forced to use an actual GOTO.

	;move eax, 1
	;move eax, 2
	;jmp	anotherLocation		; jumps to "anotherLocation:"
	;
	;; mov eip, 0x003F101A	; error: cant directly modify EIP
	;move eax, 3
	;move eax, 4	
;anotherLocation:		; label for jumping to EIP here
	;move eax, 5
	;move eax, 6
	;
	;
	;ret

	; ------ Assembly Instruction Pointer ------
	; EIP ---  Extended(32bits) Instruction Pointer -- a tracker to point its next location

	;move eax, 1
	;move eax, 2
	;move eax, 3
	;move eax, 4
	;move eax, 5
	;move eax, 6
	;
	;
	;ret

	; ---------- Assembly Flags Register Sign Bit and Zero Bit -------------

	; EFL --- Flags registers(off/on) - Extended32bits(boleans bits)
	; Compare Instructions(cmp) --- sign (1(negative) 0(Positive)), zero (1(0value) 0(not0value))

	;mov eax, 1
	;cmp eax, 2	; compare(substract), 1-2 = -1, 1001

	;mov eax, 1
	;cmp eax, 2	; 2-1 = 1 , 0000

	;mov eax, 2
	;cmp eax, 2	; 2-2 = 0 , 0100
	


	;ret

	; --------------- Assembly Loop Primer ---------------
	; 1 + 2 + 3 + 4 + 5 = 15
	'mov eax, 1
	'add eax, 2
	'add eax, 3
	'add eax, 4		; 10	;0000000A
	'add eax, 5		; 15	;0000000F
	'; 1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 ......
	'add eax, 6
	'add eax, 7
	'add eax, 8
	'add eax, 9
	'add eax, 10
	'add eax, 11
	'add eax, 12
	'add eax, 13
	'
	'
	'ret

	; ---- Programming the Scientific Version's Expression Tree -----
	; 3 * 4 + 6 / 2 + 2 * 5
	; scientific, 25 is the result for scientific calc

	;mov eax, 3
	;mov ebx, 4
	;mul ebx				; 3 * 4 = 12 -> eax		0000000C
	;mov ecx, eax		; 12 -> ecx				0000000C	; needed to mov for div
	;mov eax, 6
	;mov ebx, 2
	;div ebx				; 6 / 2 = 3 -> eax
	;add ecx, eax		; 12 + 3 = 15 -> ecx	0000000F
	;mov eax, 2
	;mov ebx, 5
	;mul ebx				; 2 * 5 = 10 -> eax		0000000A
	;add eax, ecx		; 15 + 10 = 25 -> eax	00000019



	;ret

	; ---- Optimizing the Previous Code Using Immediate Values ----

	;; 3 * 4 + 6 / 2 + 2 * 5 
	;
	;; standard, 55 is the result for standard calc
	;mov eax, 3			; 3 * 4
	;mov ebx, 4			
	;mul ebx				; eax = 12		0000000C
	;;mul 4		; error -- immediate operand not allowed
	;;move ebx, 6
	;;add eax, ebx		; 12 + 6 = 18	00000012
	;add eax, 6		; opimize - embed immediate value 6
	;mov ebx, 2			; 18 / 2 
	;div ebx				; eax = 9	
	;;div 2		; error -- immediate operand not allowed
	;;add eax, ebx		; 9 + 2 = 11	0000000B
	;add eax, 2		; opimize - embed immediate value 2
	;mov ebx, 5			; 11 * 5 
	;mul ebx				; eax = 55		00000037
	;
	;
	;; scientific, 25 is the result for scientific calc
	;
	;
	;
	;ret

	; ----- Programming the Standard Version's Expression Tree -----
	; 3 * 4 + 6 / 2 + 2 * 5 

	; standard, 55 is the result for standard calc
	;mov eax, 3			; 3 * 4
	;mov ebx, 4			
	;mul ebx				; eax = 12		0000000C
	;move ebx, 6
	;add eax, ebx		; 12 + 6 = 18	00000012
	;mov ebx, 2			; 18 / 2 
	;div ebx				; eax = 9		
	;add eax, ebx		; 9 + 2 = 11	0000000B
	;mov ebx, 5			; 11 * 5 
	;mul ebx				; eax = 55		00000037

	
	; scientific, 25 is the result for scientific calc



	;ret

	; ---- Two Expression Trees For the Same Equation -----
	; 3 * 4 + 6 / 2 + 2 * 5
	; 55 is the result for standard calc
	; 25 is the result for scientific calc


	;ret

	; ---- Expression Trees -----
	; 7 * 2 + 5 * 6		
	; result of expression in scientific calculator is 44
	; result in standard calculator is 114


	;ret

	; ----A More Complex Mathematical Expression ----

	; 7 + 2 * 8 - 8 / 5
	
	mov eax, 2		; eax 00000002
	mov ebx, 8		; ebx 00000008
	mul ebx			; (eax2 + ebx8)result 16decimal in eax hexadecimal00000010
	mov ecx, eax	; copy eax16 to ecx hexadecimal00000010
	mov eax, 8		; change eax2 to eax8 00000008
	mov ebx, 5		; change ebx8 to ebx5 00000005
	div ebx			; (eax8 / ebx5)result 1 in eax 00000001, remainder 3 in edx 00000003
	; 7 + 16 - 1
	mov ebx, 7		; ebx 00000007
	add ebx, ecx	; (ebx7 + ecx16)result decimal23 in ebx hexadecimal00000017
	; 23 - 1
	sub ebx, eax	; (ebx23 - eax1)result decimal22 in ebx hexadecimal00000016
	
	
	
	;ret
	
	
	
	; 9 / 2

	; ----Dividing Large Numbers---

	;mov eax, 0FFFFFFFFh	; largest 64bit value
	;mov edx, 0FFFFFFFFh
	;mov ebx, 2
	;div ebx
	;ret
	;error - integer overflow - result is too large must be less than 32bit


	;mov eax, 9		; eax(0000 0009) has the answer, edx(0000 0001) has the remainder
	;mov ebx, 2
	;mov edx, 1
	;div ebx
	;ret
	; ----Dividing Large Numbers---END
	
	
	;mov eax, 9		; eax has the answer, edx has the remainder
	;mov ebx, 2
	;div ebx
	
	; 2 useful assembly instrutions: nop , ret
	;nop				; no operation or do nothing for debugging
	;nop
	;nop
	;nop
	;ret				; return 
	
	
	
	; 8 * 4 

	;mov eax, 8		; eax is accumalator registry
	;mov ebx, 4
	;mov edx, 21323	; edx will fill the overflow	; edx is a data registry
	; mul eax, ebx	; syntacs error: mul only needs 1 argument	
	;mul ebx
	;mul 4
	
	;mov eax, 0FFFFFFFFh
	;mov ebx, 0FFFFFFFFh
	;mul ebx

	; the went bought. some I and, food to store	; wrong syntacs, semantics, parsing
	; I went to the store, and I bought some food. ;correct semantics, parse
	; I went to the run, and I bought some dive.	; wrong semantics

doit endp

;;CalculateNextPower proc
;CalculateNextPower:
;	; Next power:	
;	mov eax, power
;	mul ebx			
;	mov power, eax
;	inc count		
;	ret
;;CalculateNextPower endp

end