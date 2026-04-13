section .data
    x   dd -2147483645
section .text
    global main
main:
    add byte [x], 1
    adc byte [x+1], 0
    adc byte [x+2], 0
    adc byte [x+3], 0
    xor eax, eax
    ret