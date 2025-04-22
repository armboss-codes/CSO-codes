.global modify_array

modify_array:
    movq $0, %r8
    movq $1, %r9
    movq $14, %r10
    movq $7, %r11
    movq $2, %r12

modify_loop:
    cmpq %rsi, %r8
    jge exit_loop
    
    movq %r9, %rax
    xor %rdx, %rdx
    divq %r10
    cmpq $0, %rdx
    je minus_three

    movq %r9, %rax
    xor %rdx, %rdx
    divq %r11
    cmpq $0, %rdx
    je minus_two

    movq %r9, %rax
    xor %rdx, %rdx
    divq %r12
    cmpq $0, %rdx
    je minus_one

    movq %r9, (%rdi, %r8, 8)
    incq %r8
    incq %r9
    jmp modify_loop

minus_three:
    movq $(-3), (%rdi, %r8, 8)
    incq %r8
    incq %r9
    jmp modify_loop

minus_two:
    movq $(-2), (%rdi, %r8, 8)
    incq %r8
    incq %r9
    jmp modify_loop

minus_one:
    movq $(-1), (%rdi, %r8, 8)
    incq %r8
    incq %r9
    jmp modify_loop

exit_loop:
    ret
