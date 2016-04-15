;reverse print input using push/pop

   .model small
   .stack 100h
   .data
   
        newLine db 0Ah,0Dh,'$'
              
   .code
   
        main proc  
            
            mov ax,@data
            mov ds,ax
            
            mov ah,02
            mov dl,'?'
            int 21h
            
            mov ah,09
            lea dx,newLine
            int 21h
            
            
            mov cl,30h 
            mov ah,01
            
            
  READ:     
         
         int 21h
         mov bh,al
         
         cmp bh,'X'
         je PRINT_reverse
         
         inc cl
         push bx 
         
         jmp READ
         
         
  PRINT_reverse:
        
        cmp cl,30h
        je EXIT
        
        
        dec cl
        pop bx
        
        mov ah,02
        mov dl,bh
        int 21h
        jmp PRINT_reverse
        
         
  EXIT:
  
        mov ah,4ch
        int 21h          
 
 
        main endp
