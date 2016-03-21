    .model small
    .stack 100h
    .data
    
    
    .code
    
    
        main proc 
            
            
           mov ah,01
           int 21h
           mov bh,al
           mov bl,al
          
            
           SHR bh,4        ;printing first char
           add bh,30h
            
           mov ah,02 
           mov dl,bh
           int 21h 
                            ;print second char
                           
           AND bl,0Fh
           ROR bl,3
           
           mov dl,bl
           int 21h
           
           
           
           
           
            
            
            
        main endp
        end main