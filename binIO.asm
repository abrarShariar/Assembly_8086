    .model small
    .stack 100h
    .data
    
    
    .code
    
        main proc 
          
          mov ch,0          ;for result
          mov cl,0
          
 START:   
          cmp cl,8
          je printTab
          
          inc cl
          mov ah,01
          int 21h
          mov bl,al
          
          cmp bl,30h
          je zeroIn
          jne oneIn
          
          
          
   zeroIn:  
   
          mov bl,00h
          jmp shiftAdd
                   
   oneIn:
          mov bl,01h 
          jmp shiftAdd        
          
   shiftAdd: 
   
          SHL ch,1
          add ch,bl 
          jmp START
          
          
   printTab:
           
          mov ah,02
          mov dl,09h
          int 21h 
          jmp printBin
     
   printBin:
          
          cmp cl,0
          je EXIT
           
          dec cl
          rol ch,1
          jc printOne
          jnc printZero
          
          
   printOne:
   

           mov dl,'1'
           int 21h
           
           jmp printBin
           
   printZero:
   

            mov dl,'0'
            int 21h
            
            jmp printBin
            
    EXIT:   
    
            mov ah,4ch
            int 21h       
            
            
            
        main endp
        end main
    
    
        