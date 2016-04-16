;16 bit product binary

    .model small
    .stack 100h
    .data
    
    
    .code 
    
    
    print1 proc
        
       mov ah,02       
       mov dl,31h
       int 21h 
        
        
        
    ret    
    print1 endp
    
    print0 proc
       
       mov ah,02
       mov dl,30h
       int 21h 
        
        
    ret
    print0 endp
        
        
        main proc
            
           
           mov al,11110001b
           mov bl,11101011b 
           
           mul bl
           
           
           mov bx,ax           
           mov cl,30h            
           
HIGHER:


           cmp cl,38h
           je LOWER 
           
           inc cl
           
           ROL bh,1
           jc H_PRINT1
           jnc H_PRINT0
           
           jmp HIGHER   
           
LOWER:

           cmp cl,30h
           je EXIT
           
           dec cl
           
           ROl bl,1
           jc L_PRINT1
           jnc L_PRINT0
           
           jmp LOWER
           
           
H_PRINT1:
            
          call print1          
          jmp HIGHER
          
H_PRINT0:

          call print0
          jmp HIGHER
        
L_PRINT1:

          call print1
          jmp LOWER

L_PRINT0:
        
          call print0
          jmp LOWER
          
           
EXIT:

        mov ah,4ch
        int 21h                     
           
           
           
           
        main endp
        end main