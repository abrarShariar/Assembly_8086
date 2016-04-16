;11 x 11 star with initials in the middle

    .model small
    .stack 100h
    .data
       
       star db '*********** $'
       newLine db 0Ah,0Dh,'$'
    
    .code
    
        main proc
            
           mov ax,@data
           mov ds,ax
           
           mov ah,01        ;take 3 input
           int 21h
           mov bh,al
           int 21h
           mov bl,al
           int 21h
           mov ch,al
           
           mov cl,30h         ;counter 
           
           mov ah,09
           lea dx,newLine
           int 21h
           
                  
PRINT_STAR:

           inc cl
           
           cmp cl,3Ch
           je EXIT            
           cmp cl,36h
           je PRINT_CHAR 
           
                      
         
           
           mov ah,09
           lea dx,star
           int 21h
           lea dx,newLine
           int 21h
           
            
           
           jmp PRINT_STAR
              
           
PRINT_CHAR:
           
           
           mov ah,02
           mov dl,20h
           int 21h
           mov dl,20h
           int 21h
           mov dl,20h
           int 21h 
           mov dl,20h
           int 21h
           
           mov dl,bh
           int 21h
           mov dl,bl
           int 21h
           mov dl,ch
           int 21h 
           
           mov ah,09
           lea dx,newLine
           int 21h
           
           
           jmp PRINT_STAR           
           

EXIT:
            mov ah,4ch
            int 21h
                       
            
            
            
        main endp
        end main