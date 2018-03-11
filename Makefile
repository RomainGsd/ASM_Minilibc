##
## EPITECH PROJECT, 2018#
# minilibc
## File description:
## Makefile
##

NAME    =       libasm.so

SRC     =       strlen.asm

CASM    =       nasm -f elf64

CCSHARED      =       gcc -shared -o

RM      =       rm -f

all:    $(NAME)

$(NAME):
	$(CASM) $(SRC)
	$(CCSHARED) $(NAME) *.o

clean:
	$(RM) *.o

fclean:	clean
	$(RM) $(NAME)

re: fclean all

.PHONY: all clean fclean re
