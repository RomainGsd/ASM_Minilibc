##
## EPITECH PROJECT, 2018#
# minilibc
## File description:
## Makefile
##

NAME    =       libasm.so

SRCS	=	src/memcpy.asm	\
		src/memmove.asm	\
		src/memset.asm	\
		src/rindex.asm	\
		src/strchr.asm	\
		src/strcmp.asm	\
		src/strcpy.asm	\
		src/strlen.asm	\
		src/strncmp.asm

ASM	=       nasm -f elf64

OBJS	=	$(SRCS:.asm=.o)

LD	=	ld -fPIC -shared -o

RM      =       rm -rf

%.o: %.asm
	$(ASM) $<

all:    $(NAME)

$(NAME):	$(OBJS)
	$(LD) $(NAME) $(OBJS)

clean:
	$(RM) $(OBJS)

fclean:	clean
	$(RM) $(NAME)

re: fclean all

.PHONY: all clean fclean re
