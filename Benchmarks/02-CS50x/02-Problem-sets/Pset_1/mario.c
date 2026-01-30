#include "../cs50.h" //telling it to go up one folder and find and use the cs50.c and the cs50.h stuffs. 
#include <stdio.h>   //VERY HANDY!!!

void brk(int h);

int main(void)
{
    
    int h = 0;
    do
    {
        h = get_int("Height: ");
    }
    while (h <= 0 || h > 8);

    
    for (int i = 0; i < h; i++)
    {
        
        int k = h - i - 1;
        for (int e = k; e > 0; e--)
        {
            printf(" ");
        }
        
        
        brk(i);
    }
}

void brk(int h)
{
    for (int i = 0; i <= h; i++)
    {
        printf("#");
    }
    printf("\n");
}