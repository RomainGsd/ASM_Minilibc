##
## EPITECH PROJECT, 2018#
# minilibc
## File description:
## Makefile
##

NAME    =       libasm.so

SRCS	=       src/strlen.asm \
		src/strchr.asm \
		src/memset.asm \
		src/strcpy.asm \
		src/memcpy.asm

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
