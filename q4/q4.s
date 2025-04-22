.global sum

sum:
    movq $0, %rbx
    movq $0, %rcx
    movq $3, %r8
    movq $5, %r9

sum_loop:
    cmpq %rsi, %rcx
    jge exit_loop

    movq (%rdi, %rcx, 8), %rax
    xorq %rdx, %rdx
    divq %r9
    cmp $0, %rdx
    je skip

    movq (%rdi, %rcx, 8), %rax
    xorq %rdx, %rdx
    divq %r8
    cmp $0, %rdx
    jne skip

    addq (%rdi, %rcx, 8), %rbx

    incq %rcx
    jmp sum_loop

skip:
    incq %rcx
    jmp sum_loop

exit_loop:
    movq %rbx, %rax
    ret
