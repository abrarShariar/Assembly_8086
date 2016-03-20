        .model small
        .stack 100h
        .data
        
        
        
        
        .code
        
            main proc
                     
                mov ah,01           ;input
                int 21h
                mov bl,al
                  
                mov cl,0 
                mov ah,02 
                mov dl,09h
                int 21h             ;print tab
                
                
         rotate:
                
                cmp cl,8
                je EXIT
                shl bl,1 
                inc cl
                jc LABEL01
                jnc LABEL0
                
         
         LABEL01:   
         
                mov dl,'1'
                int 21h
                jmp rotate
                
         LABEL0:
            
                mov dl,'0'
                int 21h
                jmp rotate
                
                
         EXIT:  
            
                mov ah,4ch
                int 21h      
                
                
            main endp
            end main