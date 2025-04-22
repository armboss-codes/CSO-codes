.global find_unique

find_unique:
    movq $1, %rax
    movq (%rdi), %rbx
    movq %rbx, (%rdx)
    movq $1, %rcx

unique_loop:
    cmpq %rsi, %rcx
    jge exit_loop
    
    cmpq (%rdi, %rcx, 8), %rbx
    je continue

    movq (%rdi, %rcx, 8), %r8
    movq %r8, (%rdx, %rax, 8)
    incq %rax
    movq (%rdi, %rcx, 8), %rbx

    incq %rcx
    jmp unique_loop

continue:
    incq %rcx
    jmp unique_loop

exit_loop:
    ret
