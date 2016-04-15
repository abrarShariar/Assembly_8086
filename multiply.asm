    .model small
    .stack 100h
    .data
         
         product db 00h
    
    .code
    
    
        main proc
            
            mov bh,00000001b
            mov bl,00000010b  
            
            
REPEAT:     
            cmp bl,00h
            je PRINT
            
            mov cl,bl
            SHR cl,1
            jc proAdd
            
            SHL bh,1
            SHR bl,1
            
            jmp REPEAT
            
proAdd:     
            
            mov ch,product
            add ch,bh 
            
            mov product,ch 
              
            SHL bh,1
            SHR bl,1
            jmp REPEAT
            
PRINT:

            mov ah,02
            mov dl,product
            int 21h
            
            
            mov ah,4ch
            int 21h

            
        main endp
        end main