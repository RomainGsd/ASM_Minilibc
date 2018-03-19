make re
gcc main.c -o minilibc -L. -lasm
rm -f *.o && echo "rm *.o"
rm -f *~ && echo "rm *~"
LD_PRELOAD=./libasm.so ./minilibc
