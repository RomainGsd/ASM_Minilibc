#!/bin/bash

nasm -f elf64 PrintNumber.asm && ld -o hello *.o
rm -rf *.o
rm -rf *~
rm -rf *#
./hello
