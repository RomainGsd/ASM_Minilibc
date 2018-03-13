#!/bin/bash

nasm -f elf64 Hello.asm && ld -o hello *.o
rm -rf *.o
rm -rf *~
./hello
