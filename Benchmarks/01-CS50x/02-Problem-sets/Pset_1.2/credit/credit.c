  #include <stdio.h>
  #include "../../cs50.h" //telling it go 2 steps up & search up the cs50.h file for the functions.


  int main(void)
  {
      long long card_number = get_long_long("Input card number: "); // get_long automatically filters out anything else and makes sure we get a number only
      long long a=card_number,d=card_number,n=card_number,s=card_number;  // we give the card number to different variables to later not mix things up.
      long long sum=0,card_length=0;


    // every iteration cuts one digit , takes the next and then drops both.
      while(a>0)
      {
          long long digit_untaken=a%10;      // we sum up the digit starting with the last one and skipping one and then so on and forth.
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

      
        while(d>0)
        {
            card_length+=1 ;      // This section gets the card length 
            d/=10;                // It counts the card number by counting from 0 everytime it cuts a digit off.
        }

        long long m=card_length,v=card_length;

        m=m-2; // for amex and mastercard
        v=v-1; // for visa only

        while(m>0)
        {
          n=n/10;  // first 2 digit of amex and masterc
          m--;
        }
        while(v>0)
        {
          s=s/10;  // first 1 digit of visa
          v--;
        }


        long long checksum_last_digit=sum%10; 
        if(checksum_last_digit==0)   // comparing conditions to validate credit card.
        {
          if(card_length==15 && (n==34 || n==37))
          {
            printf("AMEX\n");
          }
          else if(card_length==16 && (n>=51 && n<=55))
          {
            printf("MASTERCARD\n");
          }
          else if((card_length==13 || card_length==16) && s==4)
          {
            printf("VISA\n");
          }
          else 
          { 
              printf("INVALID\n");
          }
        }
        else
        {
            printf("INVALID\n");
        }

  }