##
## EPITECH PROJECT, 2018
## minilibc
## File description:
## Makefile
##

NAME    =       strlen

SRC     =       strlen.asm

CASM    =       nasm -f elf64

CC      =       gcc -Wall -Wextra -Werror

RM      =       rm -f

all:    $(NAME)

$(NAME):
	$(CASM) $(SRC)
	ld -o $(NAME) *.o

clean:
	$(RM) *.o

fclean:	clean
	$(RM) $(NAME)

re: fclean all

.PHONY: all clean fclean re
