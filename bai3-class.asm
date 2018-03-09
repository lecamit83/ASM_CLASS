data segment 
    N dw 0
    nhan10 dw ?  
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:       

    xor bx, bx
    mov nhan10, 10
    
   
   nhap:
    
    mov ah, 1
    int 21h
             
    
    cmp  al, 13
    je thoatNhap
    sub al, 30h
    xor cx, cx 
    mov cl, al
    mov ax, bx
    mul nhan10
    mov bx, ax
    add bx, cx
    jmp nhap
    
   thoatNhap: 
   
    mov ah,2 
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h  
    
    
    mov ax, bx
    mov bx, 2
    
    xor dx, dx
    mov cx, 0
    
    lap:
        
        cmp ax,0
        je thoatLap
        div bx
        push dx
        inc cx 
        xor dx, dx
        jmp lap
        
     
    thoatLap:
    
    lap2:
        pop bx
        add bx, 48
        mov ah, 2
        mov dx, bx
        int 21h 
        loop lap2

mov ax, 4c00h
int 21h  
                   
            
ends

end start
