;16 bit ROL and MUL

    .model small
    .stack 100h
    .data
    
        product dw ?
    
    .code
    
        main proc  
            
            
            mov al,11111111b
            mov bh,10000000b
            
            mul bh
            
            mov product,ax            
            mov cl,30h
            
START:
            cmp cl,40h
            je EXIT 
            inc cl
            
            ROL product,1
            jc PRINT1
            jnc PRINT0 
            
            
            jmp START 
            
            
PRINT1:

            mov ah,02
            mov dl,31h
            int 21h
            
            jmp START
            
            
PRINT0:

            mov ah,02
            mov dl,30h
            int 21h
            
            jmp START
                                   
EXIT:

            mov ah,4ch
            int 21h            

            
        end main    
        main endp   