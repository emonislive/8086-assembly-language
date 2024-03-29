ORG 100H
.MODEL SMALL
.STACK 100H
.DATA

MSG1 DB 'ALPHABATE$'
MSG2 DB 'DIGIT$'
NEWLINE DB 0DH, 0AH, "$"

.CODE

MAIN PROC

MOV AH, 1    ; USER INPUT
INT 21H

MOV BL, AL   

CMP BL, 30H  ; COMPARE BL WITH ASCII VALUE OF 01
JGE PRINT    ; IF GREATER OR EQUAL JUMP TO LABEL PRINT

PRINT:       

CMP BL, 39H  ; COMPARE BL WITH ASCII VALUE OF 09
JLE PRINT1   ; IF LESS OR EQUAL JUMP TO LABEL PRINT1
JG END       ; IF GREATER OR EQUAL JUMP TO LABEL PRINT

MOV AH, 9         ; NEWLINE
LEA DX, NEWLINE
INT 21H        
       
PRINT1:
MOV AX, @DATA
MOV DS, AX

MOV AH, 9         ; NEWLINE
LEA DX, NEWLINE
INT 21H

MOV AH, 9
LEA DX, MSG2
INT 21H
RET

END:

CMP BL, 41H
JGE PRINT2

PRINT2:

CMP BL, 5AH
JLE PRINT3
JGE END1

PRINT3:

MOV AX, @DATA
MOV DS, AX

MOV AH, 9         ; NEWLINE
LEA DX, NEWLINE
INT 21H

MOV AH, 9
LEA DX, MSG1
INT 21H
RET

END1:

MOV AX, @DATA
MOV DS, AX

MOV AH, 9         ; NEWLINE
LEA DX, NEWLINE
INT 21H

MOV AH, 9
LEA DX, MSG1
INT 21H
RET
     
MAIN ENDP
ENDP
