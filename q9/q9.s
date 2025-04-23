.global binary_search

binary_search:
    movq $2, %rbx

    cmpq %rsi, %rdx
    jl not_found

    movq %rdx, %r8
    xorq %rdx, %rdx
    movq %r8, %rax
    addq %rsi, %rax
    divq %rbx

    cmpq %rcx, (%rdi, %rax, 8)
    je found
    jl search_right
    jmp search_left

search_right:
    movq %r8, %rdx
    movq %rax, %rsi
    incq %rsi
    call binary_search
    ret

search_left:
    movq %rax, %rdx
    decq %rdx
    call binary_search
    ret

found:
    ret

not_found:
    movq $-1, %rax
    ret
