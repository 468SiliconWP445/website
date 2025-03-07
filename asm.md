```asm
Disassembly of section .text:

0000000000000000 <_start>:
   0:    b8 00 00 00 00        mov    eax,0x0
   5:    bf 00 00 00 00        mov    edi,0x0
   a:    48 be 00 00 00 00 00  movabs rsi,0x0
  11:    00 00 00 
  14:    ba 64 00 00 00        mov    edx,0x64
  19:    0f 05                 syscall
  1b:    b8 01 00 00 00        mov    eax,0x1
  20:    bf 01 00 00 00        mov    edi,0x1
  25:    48 be 00 00 00 00 00  movabs rsi,0x0
  2c:    00 00 00 
  2f:    ba 64 00 00 00        mov    edx,0x64
  34:    0f 05                 syscall
  36:    b8 3c 00 00 00        mov    eax,0x3c
  3b:    48 31 ff              xor    rdi,rdi
  3e:    0f 05                 syscall
```
