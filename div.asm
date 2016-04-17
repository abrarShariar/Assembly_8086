    .model small
    .stack 100h
    
    .data 
    
        newLine db 0Ah,0Dh,'$'
    
    
    .code
    
        main proc
            
            mov ax,@data
            mov ds,ax 
            
            mov ah,01
            int 21h
            mov bh,al
            
            
            int 21h
            mov bl,al
                                   
            
            mov ah,09
            lea dx,newLine
            int 21h 
            
            mov ah,02
            mov dl,bh
            int 21h
            
            mov dl,'/'
            int 21h
            mov dl,bl
            int 21h
            
            mov dl,'='
            int 21h
            
            
            ;calculation 
            sub bh,30h 
            sub bl,30h
            
            mov al,bh
            DIV bl
            
            mov bh,al       ;quotient
            mov bl,ah       ;reminder
            
            mov ah,02
            mov dl,bh
            int 21h
            
        main endp
        end main