data segment
   mgs1  db 10,13, 'Nhap : $'
   mgs2  db 10, 13 , 'Ki tu vua nhap la : $'
   c db ?
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
    
    mov ax, @data
    mov ds , ax
    
    ; in ra nhap
    
   
    
    ; nhap ki tu 
   
        
    Input:  
         lea dx, mgs1
        mov ah, 9
        int 21h
        
        mov ah, 1
        int 21h
        mov c, al
        
        cmp c, 'A'
        jl Input
        jg ssZ
     ssZ:   cmp c, 'Z'
        jnl thoat 
        jg  ssa
     ssa:   cmp c , 'a'
        jl input
        jg sszz
      sszz:
        cmp c , 'z'
        jg Input 
        jnl thoat 
   
    
    ; in ra ket thuc
    
    thoat:
    lea dx, mgs2                                                                                                       
    
    
    mov ah, 9
    int 21h
    
    ; in ra ki tu vua nhap
    
    mov dl, c
    mov ah, 2
    int 21h   

mov ax, 4c00h
int 21h  

ends

end start
