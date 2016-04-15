    .model small
    .stack 100h
    .data
    
    
    .code
    
        main proc
            
            mov ah,01
            int 21h
            mov bh,al
            int 21h
            mov bl,al
            int 21h
            mov ch,al
            
            mov ah,02
            mov dl,09h
            int 21h
            
            cmp bh,bl
            jg check_2
            jl check_3
            
            
            
            
      
      
check_2:


        cmp bh,ch
        jg max_1
        jl max_3
        
        
check_3:

        cmp bl,ch
        jg max_2
        jl max_3
        
max_1: 

        mov dl,bh
        int 21h
        
        jmp EXIT
        
        
max_2:
        mov dl,bl
        int 21h
        
        jmp EXIT
        
max_3:

        mov dl,ch
        int 21h
        
        jmp EXIT
        
EXIT:
         mov ah,4ch
         int 21h
        
            
        main endp
        end main