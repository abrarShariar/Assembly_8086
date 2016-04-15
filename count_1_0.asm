    .model small
    .stack 100h
    .data  
    
       newLine dw 0Ah,0Dh,'$'
       countOne db 30h
       countZero db 30h
       
       text1 db 'Number of 1: $'
       text0 db 'Number of 0: $'
    
    .code
    
        main proc
            
           mov ax,@data
           mov ds,ax
           
           mov bh,11100011b  
           mov cl,30h 
            
   START:   
           
           cmp cl,38h
           je PRINT
           
           inc cl
           rol bh,1
           jc print1
           jnc print0
           
           
   print1:
           
           inc countOne
           jmp START
           
   print0:
   
           inc countZero
           jmp START
           
             
    PRINT:
            
           mov ah,09
           lea dx,newLine
           int 21h
           
           lea dx,text1
           int 21h
           
           mov ah,02 
           mov dl,countOne
           int 21h 
           
          
           
           
           mov ah,09
           lea dx,newLine
           int 21h
           
           lea dx,text0
           int 21h
                 
           mov ah,02
           mov dl,countZero
           int 21h      
             
        main endp
        end main