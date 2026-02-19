#include<stdio.h>
#include "../cs50.h"

int main (int argc, string argv[])
{
    if (argc != 2)
    {
        printf("Missing command-line arguement\n");
        return 1;
    }
        printf("hello, %s", argv[1]);
        return 0;
}