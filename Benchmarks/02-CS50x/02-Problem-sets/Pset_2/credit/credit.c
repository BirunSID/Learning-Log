#include <stdio.h>
#include "../../cs50.h" //telling it go 2 steps up & search up the cs50.h file for the functions.


int main(void)
{
    long long card_number = get_long_long("Input card number: "); // get_long automatically filters out anything else and makes sure we get a number only
    long long a=card_number,d=card_number;
    long long sum=0,card_length=0;
   // every iteration cuts one digit , takes the next and then drops both.
    while(a>0)
    {
        long long digit_untaken=a%10;
        sum+=digit_untaken;

        a=a/10;                                  // cuts off last digit
        long long remainder_taken=a%10;          // takes the next digit after the cutoff
        remainder_taken*=2;                    // multiplies the output digit with 2
        while(remainder_taken>0)                 // gets the sum of the digits of the number,if the number's beyond 9.
        {
            long long b=remainder_taken%10;      //defines new variable and takes the last digit to put in sum
            sum+=b;                            //sums up every digit one by one
            remainder_taken/=10;               //slashes off the already summed digit
        }
        a=a/10;                                  // remove the summed digit(remainder_taken) and moves on.
    }
    printf("%li\n",sum);

    while(d>0)
    {
        card_length+=1 ;
        d/=10;
    }
    printf("%lld",card_length);
}