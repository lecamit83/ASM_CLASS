
; nhap 2 so nhi  phan -> tinh tong 2 so nhi phan 

data segment 
    
    so1 dw ?
    so2 dw ? 
    tong dw ?
    x2 dw ?
    div2 dw ? 
    msg1 db 'Nhap so thu 1: $'
    msg2 db 'Nhap so thu 2: $'
    notification db "TONG 2 SO LA: $"

ends

stack segment
    dw   128  dup(0)
ends

code segment
start:   
    
    mov ax, @data
    mov ds, ax    

    xor bx, bx
    ;gan gia tri cho so1, so2, x2, div10    
    
    mov so1, 0
    mov so2, 0
    mov x2,  2
    mov div2, 2
    
    ; nhap so1          
    
    lea dx, msg1
    mov ah, 9
    int 21h
    
NHAP_SO1:
    
    mov ah, 1
    int 21h
    
    ; kiem tra bang enter
    
    cmp al, 13
    
    je EXIT_SO1
    ; chuyen ki tu thanh so
    sub al, 48
    ; xoa gia tri rac cx             
    xor cx, cx          
    mov cl , al
    ; chuyen gia tri tu bx sang ax de nhan -> dx : ax
    
    mov ax, bx
    mul x2
    
    mov bx, ax
    add bx, cx
    
    ; quay lai nhap
    
    jmp NHAP_SO1

    
EXIT_SO1:
    
    ; xuong dong
    
    mov ah, 2
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h
    ; chuyen gia tri tu bx sang so1    
    
    mov so1, bx
             
             
    ; nhap cau thong bao nhap so 2 
                        
    xor bx, bx          
    
    xor dx, dx
    
    lea dx, msg2
    mov ah, 9
    int 21h
    
    ; nhap so 2
NHAP_SO2:
    
    mov ah, 1
    int 21h
    
    ; kiem tra bang enter
    
    cmp al, 13
    
    je EXIT_SO2
    ; chuyen ki tu thanh so
    sub al, 48
    ; xoa gia tri rac cx             
    xor cx, cx          
    mov cl , al
    ; chuyen gia tri tu bx sang ax de nhan -> dx : ax
    
    mov ax, bx
    mul x2
    
    mov bx, ax
    add bx, cx
    
    ; quay lai nhap
    
    jmp NHAP_SO2  


EXIT_SO2:
    
    ; xuong dong
    
    mov ah, 2
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h

    ; chuyen gia tri tu bx sang so1
    
    mov so2, bx
                   
    ; tinh tong 2 so
    
    xor ax, ax
    xor bx, bx
    ; ting tong
    
    mov ax, so2
    mov bx, so1
    add bx, ax
    
    ; chuyen sang tong
    
    mov tong , bx
    
    
    ; phan tich tong thanh so nhi phan
     
    
    ; khoi tao gia tri
    
    xor dx, dx
    xor cx, cx    
    
    ; chuyen tong qua ax de chia
    
    mov ax, tong
    
    
LAP_CHIA:
    
    cmp ax, 0
    je EXIT_LAP
    ; chia ax cho 2
    div div2
    ; day so du o dx vao stack
    push dx                   
    
    xor dx, dx
    inc cx
    jmp LAP_CHIA
    
EXIT_LAP:
    
    xor bx, bx
         
         
    lea dx, notification
    mov ah, 9
    int 21h
        
LAP_IN:
    
    pop bx
    
    ; in ra
    add bx, 48
    mov dx, bx
    mov ah, 2
    int 21h
    
    loop LAP_IN
       
    
    

mov ax, 4c00h
int 21h  

ends

end start
