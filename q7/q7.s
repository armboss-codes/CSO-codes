.global special

special:
    cmpq $0, %rdi
    je false

    movq $1, (%rsi)
    movq $1, 8(%rsi)
    movq $2, %r8

factorial_store:
    cmpq $10, %r8
    jge storing_done

    decq %r8
    movq (%rsi, %r8, 8), %rax
    incq %r8
    mulq %r8
    movq %rax, (%rsi, %r8, 8)

    incq %r8
    jmp factorial_store

storing_done:
    movq %rdi, %rax
    movq $10, %rcx
    movq $0, %r9 # sum

check_special_loop:
    cmpq $0, %rax
    jle exit_loop

    xorq %rdx, %rdx
    divq %rcx
    movq (%rsi, %rdx, 8), %r10
    addq %r10, %r9

    jmp check_special_loop

exit_loop:
    cmp %r9, %rdi
    je true

false:
    movq $0, %rax
    ret

true:
    movq $1, %rax
    ret
