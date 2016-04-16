    .model small
    .stack 100h
    .data
    
    
        error db 'Too Many Brackets. Begin Again $'
        newLine db 0Ah,0Dh,'$'
        
      
    .code
    
        main proc 
            
            mov ax,@data
            mov ds,ax
            


takeInput:

            mov ah,01
            int 21h
            mov bh,al
            
            cmp bh,'('
            je INSERT
            cmp bh,'{'
            je INSERT
            cmp bh,'['
            je INSERT 
            
            cmp bh,')'
            je POP_CHECK1
            cmp bh,'}'
            je POP_CHECK2
            cmp bh,']'
            je POP_CHECK3
            
            
            jmp takeInput
             
INSERT:  

            push bx
            jmp takeInput
            
            
POP_CHECK1:

           pop cx
           cmp ch,'('
           je takeInput
           jne NOT_GO 
           
POP_CHECK2:

           pop cx
           cmp ch,'{'
           je takeInput
           
           jne NOT_GO
           
POP_CHECK3:

           pop cx
           cmp ch,'['
           je takeInput
           jne NOT_GO
           
           
NOT_GO:
           
           mov ah,09
           lea dx,error
           int 21h 
           
           lea dx,newLine
           int 21h
           
           
                  

            
        main endp
        end main