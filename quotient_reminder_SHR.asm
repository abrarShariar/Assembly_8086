     .model small
     .stack 100h
     .data
     
        res01 db 'quotient: $'
        res02 db 'reminder: $'
     
     .code
     
        main proc
            
           mov ax,@data
           mov ds,ax 
            
                                ;find quotient          
            mov cl,0            ;counter   
            mov bh,0            ;carry counter
            mov bl,40
            
            
            
            
   SHIFT:   
            cmp cl,3             ;divide by 8
            je printRes
                  
            inc cl               ;loop counter      
            SHR bl,1
            jc oneCarry
            
            jmp SHIFT
            
            
   oneCarry:  
   
            inc bh
            jmp SHIFT
            
            
   printRes:
   
             
            add bl,30h

            mov ah,09
            lea dx,res01
            int 21h
            
            
            mov ah,02 
            mov dl,bl
            int 21h
            mov dl,09h
            int 21h
            
            mov ah,09
            lea dx,res02
            int 21h  
            
            mov ah,02 
            add bh,30h
            mov dl,bh
            int 21h
            
                      
            
            
            
            
        main endp
        end main