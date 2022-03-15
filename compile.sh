nasm -felf64 shellcode.s -o shellcode.o
objcopy --dump-section .text=shellcode.text shellcode.o
ld shellcode.o -o shellcode
objdump -D --section=.text -M intel shellcode 
