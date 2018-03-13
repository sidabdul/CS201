################################
#Name: Suleman Tarik and Sid
#Date: 07/19/16
#Course: CS201
#Instructor: Raoul Rivas
################################

.global ByteMult
.text 

ByteMult: #Lable for the ByteMult Function.

  #|---------------|
  #|KEY:           |
  #|  %rax is 'i'  |
  #|  %rbx is 'j'  |
  #|  %rcx is 'k'  |
  #|  %rdx is sum  |
  #|  %rsi is 'in' |
  #|  %rdi is 'n'  |
  #|  %r8 is 'a'   |
  #|  %r9 is 'b'   |
  #|---------------|

  movq $0, %rax #Initializes 'i' to 0.
  movq $0, %rbx #Initializes 'j' to 0.
  movq $0, %rcx #Initializs 'k' to 0.
  #movq $0, %rdx #Initializes 'sum' to 0.

  Loop1: #The first/main 'for loop'.
    imulq %rax, %rdi #Multiplies 'i*n'
    movq %rax, %rsi #Moves the product of 'i*n' to 'in'.

    Loop2: #The first inner 'for loop'.
      movq $0, %rdx #Initializes 'sum' to 0.
      
      Loop3: # The second inner 'for loop'.
        
        #sum = sum + a[in+k] * b[k*n+j];
        
         

        #addq %rcx, %rsi #Adds 'in+k'.
        
        #imulq %rcx, %rdi #Multiplies 'k*n'.
        #addq  %rdi, %rbx #Adds the product of 'k*n' with 'j'.
        
        #imulq %rsi, %rbx #Multiplies 'a[in+k] * b[k*n+j]'.
        #addq %rbx, %rdx #Adds the product from the line above to 'sum'. 
      
         

        inc %rcx #Increments 'k' by 1.
        cmp %rdi, %rcx #Checks if 'k' is less than 'n'.
        jl Loop3 #If 'k' is less than 'n', it will go back to Loop3.

      inc %rbx #Increments 'j' by 1.
      cmp %rdi, %rbx #Checks if 'j' is less than 'n'.
      jl Loop2 #If 'j' is less than 'n', it will go back to Loop2.

    inc %rax #Increments 'i' by 1.
    cmp %rdi, %rax #Checks if 'i' is less than 'n'.
    jl Loop1 #If 'i' is less than 'n', it will go back to Loop1.

  ret

.data 

  











































