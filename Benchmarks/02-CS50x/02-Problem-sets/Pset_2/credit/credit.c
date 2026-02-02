#include <stdio.h>
#include "../../cs50.h" //telling it go 2 steps up & search up the cs50.h file for the functions.


int main(void)
{
    long a = get_long("input card number: "); // get_long automatically filters out anything else and makes sure we get a number only
    
    long sum=0;

   // every iteration cuts one digit , takes the next and then drops both.
    while(a>0)
    {
        a=a/10;               // cuts off last digit
        long remainder=a%10;  // takes the next digit after the cutoff
        sum+=remainder;       // sums the the digit.
        a=a/10;               // remove both the cut digit and the summed digit(remainder) and moves on.
    }
    printf("%li",sum);
}