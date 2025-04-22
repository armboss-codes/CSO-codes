.global waveform

waveform:
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

    movq $0, %r8
    movq $1, %r9

swap_loop:
    cmpq %rsi, %r9
    jge swaps_done

    movq (%rdi, %r8, 8), %r10
    movq (%rdi, %r9, 8), %r11

    movq %r10, (%rdi, %r9, 8)
    movq %r11, (%rdi, %r8, 8)

    incq %r8
    incq %r8
    incq %r9
    incq %r9

    jmp swap_loop

swaps_done:
    ret
