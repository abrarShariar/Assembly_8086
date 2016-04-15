;multiplication using SHL and SHR

    .model small
    .stack 100h
    .data
        
        product db ? 
        temp db ?
    
    
    .code
    
    
        main proc
                  
            mov ax,@data        
            mov ds,ax      
                  
            mov ch,111b        ;A
            mov bh,1101b       ;B
            
 
ROLL:      
            cmp bh,00000000b
            je EXIT
            
                 
            mov temp,bh
            
            SHR temp,1
            jc updateProduct
            
            SHL ch,1
            SHR bh,1
            
            jmp  ROLL
            


updateProduct:

            
            add product,ch
            SHL ch,1
            SHR bh,1
            
            jmp ROLL
            

EXIT:

            mov bl,product      ;view bl in extended value view for result
                                    
            
        main endp
        end main
        