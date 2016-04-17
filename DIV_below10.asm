;DIV below 10 result

     .model small
     .stack 100h
     .data 
           
        quotient db 'QUOTIENT: $'
        rem db 'REM: $'   
           
     .code
     
        main proc 
            
            mov ax,@data
            mov ds,ax
        
            mov ax,10d              ;dividend
            mov bh,2d               ;divisor
            
            DIV bh                  
            
            mov bh,al               ;quotient
            add bh,30h
            mov bl,ah               ;reminder
            add bl,30h
            
            mov ah,09
            lea dx,quotient
            int 21h
            
            mov ah,02
            mov dl,bh
            int 21h
            
            mov dl,09h
            int 21h
            
            mov ah,09
            lea dx,rem
            int 21h 
            
            mov ah,02
            mov dl,bl
            int 21h
            
        main endp
        end main