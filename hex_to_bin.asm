;hex to bin

    .model small
    .stack 100h
    .data

    .code
    
        main proc 
            
           mov ah,01
           int 21h
           mov bh,al
           sub bh,37h 
           
           mov cl,30h
                   
                   
START:      
           cmp cl,34h
           jl SKIP
           
           cmp cl,38h
           je EXIT
           
           inc cl
           
           SHL bh,1 
           jc PRINT1
           jnc PRINT0
           
           jmp START
  
  
SKIP:
       inc cl 
       SHL bh,1 
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
            
            
                 
                 
                 
        main endp
        end main
            
            