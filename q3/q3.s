.global score

score:
    movq $0, %rax
    movq $0, %rcx

calculate_score:
    movzbq (%rdi, %rcx), %r8
    cmpb $0, %r8b
    je end_loop

    movzbq 1(%rdi, %rcx), %r9
    cmpb $0, %r9b
    je end_loop

    movq %r8, %r10
    subq %r9, %r10
    cmpq $0, %r10
    jge positive
    negq %r10

positive:
    addq %r10, %rax

    incq %rcx
    jmp calculate_score

end_loop:
    ret
