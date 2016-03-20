        .model small
        .stack 100h
        .data
        
        
        .code
        
            main proc
                
               mov ah,01
               int 21h
               mov cl,al
               
               mov ah,02 
               mov bl,0     ;for counter
               
       rotate:  
               cmp bl,8
               je EXIT
               
               rol cl,1
               inc bl       ;increase counter
               jc printOne
               jnc printZero
               
       printOne:
       
                mov dl,'1'
                int 21h
                jmp rotate
                
       printZero:
       
                mov dl,'0'
                int 21h
                jmp rotate                 
               
                  
       
       EXIT:
               mov ah,4ch
               int 21h
       
            main endp
            end main