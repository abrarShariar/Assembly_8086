;print 10 x 10 asterisk solid box

    .model small
    .stack 100h
    .data
    
        star db '********** $'
        newLine db 0Ah,0Dh,'$'
    
    .code
    
        main proc
            
           mov ax,@data
           mov ds,ax
           
           mov cl,30h
           mov ah,09
           
           
PRINT_STAR: 

          cmp cl,3Ah
          je EXIT
          
          lea dx,star
          int 21h
          lea dx,newLine 
          int 21h 
                
          inc cl
          jmp PRINT_STAR
          
EXIT:

        mov ah,4ch
        int 21h

        main endp
        end main
            
            
            
    