ORG 100H
.MODEL SMALL
.STACK 100H
.DATA                 ; VARIABLES

   MSG1 DB "ENTER NUMBER 1: $"
   MSG2 DB "ENTER NUMBER 2: $"

   NEWLINE DB 0DH, 0AH, "$"
   
   MSG3 DB "NUMBER 1 IS BIGGER $"
   MSG4 DB "NUMBER 2 IS BIGGER $"
   MSG5 DB "NUMBER 1 & NUMBER 2 IS EQUAL $"
   
   VAR1 DB ?
   VAR2 DB ?
 
      
.CODE
    MAIN PROC
    
    MOV AX, @DATA     ; DATA INITIALIZATION
    MOV DS, AX    
    
    
    MOV AH, 9         ; MESSAGE 1 PRINT
    LEA DX, MSG1
    INT 21H
    
    MOV AH, 1         ; USER INPUT 1
    INT 21H
    
    MOV VAR1, AL
    
    MOV AH, 9         ; NEWLINE
    LEA DX, NEWLINE
    INT 21H
    
    MOV AH, 9         ; MESSAGE 2 PRINT
    LEA DX, MSG2
    INT 21H  
    
    MOV AH, 1         ; USER INPUT 2
    INT 21H
    
    MOV VAR2, AL
    
    MOV AH, 9         ; NEWLINE
    LEA DX, NEWLINE
    INT 21H
    
    ;MOV AH, 9         ; MESSAGE 3 PRINT
    ;LEA DX, MSG3
    ;INT 21H 
    
    MOV AL, VAR1
    MOV BL, VAR2
    
    CMP AL, BL
    
    JA CONDITION_1
    JB CONDITION_2
    JE CONDITION_3
    
    CONDITION_1: 
    
    MOV AH,9
    LEA DX, MSG3
    INT 21H
    
    RET
    
    CONDITION_2: 
    
    MOV AH,9
    LEA DX, MSG4
    INT 21H
    
    RET
    
    CONDITION_3: 
    
    MOV AH,9
    LEA DX, MSG5
    INT 21H
    
    RET
     
    
    
    MAIN ENDP
    END MAIN
