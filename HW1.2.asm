.model small
.stack 100h

.data
  leng dw ?
  stt db "please start adding items of the array and after each number press enter :$"    
  stt2 db "When done, enter a star(*)$"
  stt3 db "the initial array :$"
  stt4 db "array after addition :$"
                                    
  arr db dup 200 (?)
                                        
.code
    
    mov ax, @data
    mov ds,ax 
    
    mov si,offset arr 
    
      mov ah,9h
      mov dx,offset stt         ; print message
      int 21h  
  
      mov ah,2
      mov dl,10                ; print new line
      int 21h
      mov dl,13           
      int 21h
      
      mov ah,9h
      mov dx,offset stt2         ; print message
      int 21h    
       
        mov ah,2
      mov dl,10                
      int 21h                      ; print new line
      mov dl,13           
      int 21h
      
       mov ah,2
      mov dl,10                
      int 21h                     ; print new line
      mov dl,13           
      int 21h
      
       
        mov di,0   ;we will use di as a counter to count length of the array while filling it 
  
        sta:  
         mov ax,0  
         mov cx,0
         mov bl,10
      
      
      lpp:
         mov ah,6
         mov dl,0ffh    ; this loop will remain repeat until a value is entered
         int 21h 
         je lpp
         
         cmp al,0dh
         je fin
         
         cmp al,'*'
         je ext      
               
          sub al,30h     ; after enter value, converting it from ASCII to Desimal
          mov ah,0       ; ah=0 , to adding just enterd data to total (Cx)
          
          push ax        ; pushing ax to stack , to save its value and retern it after addition
         
          mov ax,cx      
          mul bl
          mov cx,ax      ;multiplication operation 
          
          pop ax         
          add cx,ax       ; here, adding a next digit 
          jmp lpp
          
      fin:
           mov byte ptr [si],cl       ; when the enter is pressed
           inc si
           inc di
           jmp sta
           
      ext:
        
          mov leng,di
                                    ;now, we have an array of integer and its length 
         
                  
     call SE
                           
    .exit 
      
      
     SE proc near
        
       mov cx,leng
       mov si,offset arr
       mov bx,1
       
       lop:
           mov dl ,arr [bx-1]
           add arr [bx] ,dl
          inc bx
          loop lop
           
          ret
         endp
       
       
   
        
        
        
        
            
         