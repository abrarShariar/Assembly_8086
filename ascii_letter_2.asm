    .model small
    .stack 100h
    .data
    
    .code
    
        main proc  
            
            
            mov ah,01           ;take input
            int 21h
            mov bh,al
            int 21h
            mov bl,al
            
            cmp bh,'4'          ;from A-0
            je firstSetChar
            cmp bh,'5'           ;from P-Z                    
            je secondSetChar
  

             
firstSetChar:

            cmp bl,'A' 
            jl LO_CHAR
            jge HI_CHAR
            
            
LO_CHAR:     

            add bl,10h
            jmp PRINT_CHAR
            
HI_CHAR:
            
            add bl,9h
            jmp PRINT_CHAR  
            
            
 
secondSetChar:
            
            cmp bl,'A'
            jl LO_CHAR2
            jge HI_CHAR2 

LO_CHAR2:   

            add bl,20h
            jmp PRINT_CHAR
            
            
HI_CHAR2:

            add bl,19h
            jmp PRINT_CHAR
            
             
PRINT_CHAR:

            mov ah,02
            mov dl,bl
            int 21h  
                                 
EXIT:

          mov ah,4ch
          int 21h 
            
        main endp
        end main