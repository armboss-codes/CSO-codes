.global find

find:
    pushq %rbp
    movq %rsp, %rbp

    movq $0, %rbx

looop:
    cmpq %rsi, %rbx
    jge end_looop

    movq (%rdi, %rbx, 8), %r8

stack_popping:
    cmpq %rsp, %rbp
    je empty_stack

    popq %r9
    cmpq %r9, %r8
    jge stack_popping

    movq %r9, (%rdx, %rbx, 8)
    pushq %r9
    pushq %r8

    incq %rbx
    jmp looop

empty_stack:
    movq $-1, (%rdx, %rbx, 8)
    pushq %r8

    incq %rbx
    jmp looop

end_looop:
    movq %rbp, %rsp
    popq %rbp
    ret
