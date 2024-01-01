ORG 100H
.MODEL SMALL
.STACK 100H
.DATA                 ; VARIABLES

   MSG1 DB "ENTER A CHARACTER: $"
   MSG2 DB "THE CHARACTER IS A VOWEL $"
   MSG3 DB "THE CHARACTER IS NOT A VOWEL $"
   NEWLINE DB 0DH, 0AH, "$"
   
   CHAR DB ?
      
.CODE
    MAIN PROC
    
    MOV AX, @DATA     ; DATA INITIALIZATION
    MOV DS, AX    
    
    MOV AH, 9         ; MESSAGE 1 PRINT
    LEA DX, MSG1
    INT 21H
    
    MOV AH, 1         ; USER INPUT
    INT 21H
    
    MOV CHAR, AL
    
    MOV AH, 9         ; NEWLINE
    LEA DX, NEWLINE
    INT 21H
     
    CMP CHAR, 'a'
    JE CONDITION_1
    
    CMP CHAR, 'e'
    JE CONDITION_1
    
    CMP CHAR, 'i' 
    JE CONDITION_1
    
    CMP CHAR, 'o' 
    JE CONDITION_1
    
    CMP CHAR, 'u'
    JE CONDITION_1

    
    MOV AH,9
    LEA DX, MSG3
    INT 21H
    
    RET
    
    CONDITION_1: 
    
    MOV AH,9
    LEA DX, MSG2
    INT 21H
    
    RET
       
    MAIN ENDP
    END MAIN
