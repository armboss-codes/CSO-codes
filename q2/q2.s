.global palindrome

palindrome:
    movq %rdi, %rax
    movq $0, %r8
    movq $10, %rsi

reverse:
    cmpq $0, %rax
    jle compare

    imulq $10, %r8
    xorq %rdx, %rdx
    divq %rsi
    addq %rdx, %r8

    jmp reverse

compare:
    cmpq %r8, %rdi
    jne not_palindrome

    movq $1, %rax
    ret

not_palindrome:
    movq $0, %rax
    ret
    