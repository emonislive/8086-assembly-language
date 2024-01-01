ORG 100H
.MODEL SMALL
.STACK 100H
.DATA

A DB 5 DUP(?)

MSG1 DB "ENTER ARRAY VALUE: $"
MSG2 DB "THE DATA IS FOUND $"
MSG3 DB "NOT FOUND $"
NEWLINE DB 0DH, 0AH, "$"

.CODE
   MAIN PROC 
   
   MOV AX , @DATA
   MOV DS, AX
   
   LEA SI, A
   MOV CX, 5
   
L1:
   
   MOV AH, 1
   INT 21H
   
   SUB AL, 30H
   MOV [SI], AL
   
   MOV AH, 2
   MOV DL, 20H
   INT 21H
   
   INC SI 
   
LOOP L1
   
   MOV AH, 9               ; NEWLINE
   LEA DX, NEWLINE
   INT 21H 

   LEA SI, A
   MOV CX, 5
   
   SEARCH:
   
   MOV AL, [SI]
   CMP AL, 5
   
   JE END_PROGRAM
   JG L2
   JA L3
       
   INC SI
   
   CMP CX, 0
   JE ENDDD
   
   JMP SEARCH
   
   ENDDD:
   
   MOV AH, 9
   LEA DX, MSG3
   INT 21H
   
   MOV AH, 4CH
   INT 21H
     
   L2:
   INC SI
   JMP SEARCH
   
   L3:
   INC SI
   JMP SEARCH
   
   END_PROGRAM:
   
   MOV AH, 9
   LEA DX, MSG2
   INT 21H
   
   MOV AH, 4CH
   INT 21H
 
   MAIN ENDP 
   END MAIN
