;multiply (10) and add (input in decimal)

    .model small
    .stack 100h
    .data
    
    .code
    
        main proc
            
           mov cx,0000h


START:     
           mov ax,10d
           mul cx           ;multiply
           mov bx,ax
                  
           mov ah,01
           int 21h
           sub al,30h       ;convert to digit
           
           mov cx,bx
           
           and ah,00h       ;clear ah
           
           add cx,ax        ;add
           
           
                      
           jmp START
           
           
            
        main endp
        end main