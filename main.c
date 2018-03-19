/*
** EPITECH PROJECT, 2018
** mini-libc
** File description:
** main.c
*/

#include <stdio.h>

extern size_t strlen(char*);
extern char *strchr(char*, int);
extern size_t printHello(char*, int);

int main(int ac, char **av)
{
	char *str = "Dick";
	int len = strlen(str);

	printHello(str, len);

	return 0;
}
