;addition and subtraction calculator

    .model small
    .stack 100h
    .data
        
        opr db 'Operation [+][-]: $'
        
        txt1 db 'Num 1: $'
        txt2 db 'Num 2: $' 
        ans db 'Ans: $'
        newLine db 0Ah,0Dh,'$'
    
    .code    
    
   numAdd proc                      ;num1 + num2
     
             add bh,bl
             
             cmp bh,6Ah
             jge aboveTen
             jl underTen
          
       
      aboveTen:                    ;if result is above 10
       
           sub bh,3Ah
           
           mov ah,02  
           mov dl,31h
           int 21h
           mov dl,bh
           int 21h
           
           jmp EXIT
                                   ;if result is below 10
      underTen:
            sub bh,30h
            
            mov ah,02
            mov dl,bh
            int 21h
            
      
      EXIT:
                 
    ret 
        
        
    numSub proc                     ;num1-num2
        
        sub bh,bl   
           
       add bh,30h
        mov ah,02
        mov dl,bh
        int 21h
        
    ret        
        
        
        
   
    takeInput proc                 ;take input from user
        
           mov ah,09                ;num1:
           lea dx,newLine
           int 21h
           lea dx,txt1
           int 21h
                                    ;take input num1
           mov ah,01
           int 21h
           mov bh,al
   
           mov ah,09                ;print newLine
           lea dx,newLine
           int 21h 
           lea dx,txt2              ;num2
           int 21h
           
           mov ah,01                ;take input 2
           int 21h
           mov bl,al
             
    ret
   

    
        main proc 
            
           
           mov ax,@data             ;load data
           mov ds,ax             
                            
                            
           mov ah,09                ;choose operation
           lea dx,opr 
           int 21h
           
           mov ah,01
           int 21h 
           mov cl,al 
           
           call takeInput
           
           
           cmp cl,'+'
           je addition
           cmp cl,'-'
           je subtraction 
           
            
           
    addition: 
                         
           mov ah,09
           lea dx,newLine
           int 21h          
           lea dx,ans
           int 21h         
           
           call numAdd           
           
           jmp EXIT_ALL
           
    subtraction:
    
           mov ah,09
           lea dx,newLine
           int 21h          
           lea dx,ans
           int 21h 
           
           call numSub
           
           jmp EXIT_ALL
           
    
    EXIT_ALL:
    
           mov ah,4ch
           int 21h                     
           
        main endp
        end main