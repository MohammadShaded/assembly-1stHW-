.model small
.stack 100h

.data
  stt db "The smallest integer n is: $"
   
   comp macro number
            mov di,number
            mov cx,0
            mov dx,0    
            lp:
                
                inc cx
                add dx,cx                 ;finding n [1+2+3+...+n] 
                cmp dx,di
                jb lp
                
                mov ah,9h
                mov dx,offset stt         ; print message
                int 21h
                
                mov ah,2
                mov dl,cl                 ; print n
                add dl,30h
                int 21h
        endm


  
.code  
    mov ax, @data
    mov ds,ax 
    
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
            comp cx        ; when the enter is entered
             
      .exit
  
       
        
     
     
             
  

 
