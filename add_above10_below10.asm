;number addition for above 10 and below 10 result

    .model small
    .stack 100h
    .data
        
        sum db ?
        
        txt1 db 'Num 1: $'
        txt2 db 'Num 2: $' 
        ans db 'Ans: $'
        newLine db 0Ah,0Dh,'$'
    
    .code    
    
    numCalculate proc
     
             add bh,bl
             mov sum,bh
             
             cmp sum,6Ah
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
    numCalculate endp
    
    
        
    
        main proc 
            
           
           mov ax,@data             ;load data
           mov ds,ax             
            
           mov ah,09                ;num1:
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
                     
                     
           mov ah,09
           lea dx,newLine
           int 21h          
           lea dx,ans
           int 21h         
           
           call numCalculate
           
           mov ah,4ch
           int 21h
           
        main endp
        end main