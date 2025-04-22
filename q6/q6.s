.global check

check:
    movq $0, %rbx

outer_loop:
    cmpq %rsi, %rbx
    jge done_sorting

    movq $0, %rcx
    movq %rsi, %rdx
    decq %rdx
    subq %rbx, %rdx

inner_loop:
    cmpq %rdx, %rcx
    jge inner_loop_done

    movq (%rdi, %rcx, 8), %r8
    movq 8(%rdi, %rcx, 8), %r9

    cmpq %r8, %r9
    jl swap

    incq %rcx
    jmp inner_loop

swap:
    movq %r9, %r10
    movq %r8, %r9
    movq %r10, %r8

    movq %r8, (%rdi, %rcx, 8)
    movq %r9, 8(%rdi, %rcx, 8)

    incq %rcx
    jmp inner_loop

inner_loop_done:
    incq %rbx
    jmp outer_loop

done_sorting:
    xorq %rbx, %rbx
    xorq %rcx, %rcx
    xorq %rdx, %rdx
    xorq %r8, %r8
    xorq %r9, %r9
    xorq %r10, %r10

    movq %rsi, %rbx
    decq %rbx
    movq (%rdi), %r8 # min
    movq (%rdi, %rbx, 8), %r9 # max
    subq %r8, %r9

    cmpq %rbx, %r9
    jne return_false

    movq $1, %rcx

duplicate_check_loop:
    cmpq %rsi, %rcx
    jge return_true

    movq (%rdi, %rcx, 8), %r10
    decq %rcx
    movq (%rdi, %rcx, 8), %r11
    incq %rcx

    cmpq %r10, %r11
    je return_false

    incq %rcx
    jmp duplicate_check_loop

return_false:
    movq $0, %rax
    ret

return_true:
    movq $1, %rax
    ret
