nasm -felf32 shellcode.s -o shellcode.o
objcopy --dump-section .text=shellcode.text shellcode.o
ld -m elf_i386 -s -o shellcode shellcode.o
objdump -D --section=.text -M intel shellcode 
