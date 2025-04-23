.global is_balanced

is_balanced:
    pushq %rbp
    movq %rsp, %rbp

    movq $0, %r8

looop:
    cmpq %rsi, %r8
    jge end_loop

    movzbq (%rdi, %r8), %r9

    cmpb $'(', %r9b
    je pushh

    cmpb $'{', %r9b
    je pushh

    cmpb $'[', %r9b
    je pushh

    cmpq %rsp, %rbp
    je not_balanced

    popq %r10
    
    cmpb $')', %r9b
    je check_round_parenthesis

    cmpb $'}', %r9b
    je check_curly_braces

    cmpb $']', %r9b
    je check_square_brackets

    incq %r8
    jmp looop

pushh:
    movzbq %r9b, %r9
    pushq %r9
    incq %r8
    jmp looop

check_round_parenthesis:
    cmpb $'(', %r10b
    jne not_balanced
    incq %r8
    jmp looop

check_curly_braces:
    cmpb $'{', %r10b
    jne not_balanced
    incq %r8
    jmp looop

check_square_brackets:
    cmpb $'[', %r10b
    jne not_balanced
    incq %r8
    jmp looop

end_loop:
    cmpq %rsp, %rbp
    je balanced
    jmp not_balanced

not_balanced:
    movq $0, %rax
    movq %rbp, %rsp
    popq %rbp
    ret

balanced:
    movq $1, %rax
    movq %rbp, %rsp
    popq %rbp
    ret
