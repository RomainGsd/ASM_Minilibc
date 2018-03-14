#!/bin/bash

nasm -f elf64 $1 && ld -o hello *.o
rm -rf *.o
rm -rf *~
rm -rf *#
./hello
