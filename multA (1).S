################################
#Name: Suleman Tarik and Sid
#Date: 07/19/16
#Course: CS201
#Instructor: Raoul Rivas
################################

.global ByteMult
.text 

ByteMult: #Lable for the ByteMult Function.

  #|---------------|  |-----------------|
  #|OLD KEY:       |  |KEY:             |
  #|  %rax is 'i'  |  |  %rax is'i'     |
  #|  %rbx is 'j'  |  |  %rbx is 'j'    |
  #|  %rcx is 'k'  |  |  %rcx is 'k'    |
  #|  %rdx is sum  |  |  %rdi is 'a'    |
  #|  %rsi is 'in' |  |  %rsi is 'b'    |
  #|  %rdi is 'n'  |  |  %rdx is 'c'    |
  #|  %r8 is 'a'   |  |  %r8 is 'sum'   |
  #|  %r9 is 'b'   |  |  %r9 is 'in'    |
  #|  %r10 is 'c'  |  |  %r10 is 'n'    |
  #|---------------|  |-----------------|

#**************************************************
  #FINAL KEY:
  #%rdi is a
  #%rsi is b
  #%rdx is c
  #%rcx is n
  #%r8 is sum
  #%r9 is in
  #%r10 is i
  #%r11 is j
  #%r12 is k
  #%r13 is temp1
  #%r14 is temp2


  movq $0, %r10 #Initializes 'i' to 0.
  movq $0, %r11 #Initializes 'j' to 0.
  movq $0, %r12 #Initializs 'k' to 0.

  Loop1: #The first/main 'for loop'.
    movq %rcx, %r13 #Moves the value of %r10 to temporary register %r11.
    imulq %r10, %r13 #Multiplies 'i*n'.
    movq %r13, %r9 #Moves the product of 'i*n' to 'in'.

    #TODO Check if %r13 is in the correct place.
    movq $0, %r13 #Initializes the register to zero so it can be used again.
 
    Loop2: #The first inner 'for loop'.
      movq $0, %r8 #Initializes 'sum' to 0; sum = 0.
      #movq $0, %r13 #Initializes the register to zero so it can be used again.
     
      Loop3: #The second inner 'for loop'.
        
        #sum = sum + a[in+k] * b[k*n+j];
       	movq %r9, %r13 
        addq %r12, %r13 #Adds 'in' and 'k'.
        movq (%rdi, %r13, 4), %r13        

        movq %rcx, %r14
        imulq %r12, %r14 #Multiplies 'k*n'.
        addq %r11, %r14 #Adds product of 'k*n' with 'j'.
        movq (%rsi, %r14, 4), %r14
        
        imulq %r14, %r13 #Multiplies 'a[in+k] * b[k*n+j].
        addq %r13, %r8 #Then adds it to 'sum'.

        inc %r12 #Increments 'k' by 1.
        cmp %rcx, %r12 #Checks if 'k' is less than 'n'.
        jl Loop3 #If 'k' is less than 'n', it will go back to Loop3.

      movq %r9, %r13 #Moves the value of %r9 to %r13.
      addq %r11, %r13 #Adds
      movq %r8, (%rdx, %r13, 4)

      inc %r11 #Increments 'j' by 1.
      cmp %rcx, %r11 #Checks if 'j' is less than 'n'.
      jl Loop2 #If 'j' is less than 'n', it will go back to Loop2.

    inc %r10 #Increments 'i' by 1.
    cmp %rcx, %r10 #Checks if 'i' is less than 'n'.
    jl Loop1 #If 'i' is less than 'n', it will go back to Loop1.

  ret


  











































