; question - Write an assembly language code to take natural number series as input and as output, show: a. The summation of odd numbers. b. The summation of even numbers.
; single digit output
ORG 100H
.MODEL SMALL
.STACK 100H
.DATA
    ARRAY DB 10 DUP(?)
    EVEN_SUM DW 0
    ODD_SUM DW 0
    TEMP DW 0
    SIZE DW ?
    NEWLINE DB 0DH, 0AH, "$"
    MSG0 DB "ENTER THE ARRAY SIZE: $"
    MSG1 DB "ENTER THE ARRAY: $"
    MSG2 DB "SUMMATION OF EVEN NUMBERS: $"
    MSG3 DB "SUMMATION OF ODD NUMBERS: $"
.CODE
MAIN PROC
    
    MOV AX, @DATA           ; DATA INITIALIZATION
    MOV DS, AX
     
    MOV AH, 9               ; PRINT MESSAGE 0
    LEA DX, MSG0
    INT 21H
    
    MOV AH, 1               ; ARRAY INPUT LENGTH INPUT
    INT 21H
    SUB AL, 30H
    
    XOR AH, AH              ; RESET AH REGISTER
    MOV SIZE, AX            ; STORING THE ARRAY INPUT LENGTH
    
    MOV AH, 9               ; NEWLINE
    LEA DX, NEWLINE
    INT 21H
    
    MOV AH, 9               ; PRINT MESSAGE 1
    LEA DX, MSG1
    INT 21H
    
    LEA SI, ARRAY
    MOV CX, SIZE            ; LOOP ITERATION

INPUT_LOOP:
    
    MOV AH, 1               ; ARRAY INPUT
    INT 21H
    
    SUB AL, 30H
    MOV [SI], AL            ; STORING THE ARRAY INPUT  
    
    INC SI
    
LOOP INPUT_LOOP
    
    
    MOV CX, SIZE            ; LOOP ITERATION
    LEA SI, ARRAY
    
    XOR AX, AX              ; RESET AX REGISTER
    XOR DX, DX              ; RESET DX REGISTER
    
    MOV BX, 2
    
EVEN_ODD_CHECK_LOOP:
    
    MOV AL, [SI]
    MOV TEMP, AX            ; STORING THE DATA INTO A TEMPORARY VARIABLE
    DIV BX                  ; DIVISION FOR EVEN CHECK (AX = AX/BX) (REMAINDER AT DX)
    
    CMP DX, 0
    JE EVEN
    JG ODD
      
EVEN:
           
    MOV AX, TEMP
    ADD EVEN_SUM, AX
    JMP LOOP_CONDITION
    
ODD:  
  
    MOV AX, TEMP
    ADD ODD_SUM, AX     
    JMP LOOP_CONDITION 
    
LOOP_CONDITION:

    INC SI
    LOOP EVEN_ODD_CHECK_LOOP
       
    MOV AH, 9               ; NEWLINE
    LEA DX, NEWLINE
    INT 21H

    ADD ODD_SUM, 30H
    ADD EVEN_SUM, 30H
    
    MOV AH, 9               ; PRINT MESSAGE 2
    LEA DX, MSG2
    INT 21H

    MOV AH, 2               ; EVEN SUM VALUE PRINT
    MOV DX, EVEN_SUM
    INT 21H
    
    MOV AH, 9               ; NEWLINE
    LEA DX, NEWLINE
    INT 21H
     
    MOV AH, 9               ; PRINT MESSAGE 3
    LEA DX, MSG3
    INT 21H
        
    MOV AH, 2               ; ODD SUM VALUE PRINT
    MOV DX, ODD_SUM  
    INT 21H
    
    MAIN ENDP
END MAIN
