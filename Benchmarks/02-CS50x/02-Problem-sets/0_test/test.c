#include<stdio.h>
#include "../cs50.h"

int collatz(int n);

int main (void)
{
    int x = get_int("Number: ");
    printf("steps: %i",collatz(x));
}

int collatz(int n)
{
    int steps = 0;
    if (n == 1)
    return 0;

    // Even numbers
    if (n%2 == 0)
    return 1 + collatz(n/2);

    // Odd numbers
    else
    return 1 + collatz(3*n + 1);
}