#include "../../cs50.h" //telling it to go up one folder and find and use the cs50.c and the cs50.h library. VERY HANDY!!!
#include <stdio.h>
#include <math.h> 
#include <ctype.h>

float calculate_L(string word);
float calculate_S(string word);



int main(void)
{  
    float index;
    int roundedup_index;

   //  take user input
    string s = get_string("Text: ");

   // plug user input inside of L and S figure out functions
   float L = calculate_L(s);
   float S = calculate_S(s);
   // get back the value of L and S from the functions

   // plug in the L and S inside of coleman liau formula
    index = 0.0588 * L - 0.296 * S - 15.8;


   // round up coleman liau value to nearest integer and call it x
    roundedup_index = lround(index);


   // output the value of x as grade x and if its 16 and above , then 16+, and if it is below 1 , then "before grade 1"

   if (roundedup_index >= 16)
   {
    printf("Grade 16+\n");
   }
   else if (roundedup_index < 1)
   {
    printf("Before grade 1\n");
   }
   else
   {
    printf("Grade: %i\n",roundedup_index);
   }
}



float calculate_L(string word)
{
    float valueL;
    int letters = 0, words = 1;

    // function
    for (int i = 0; word[i] != '\0'; i++)
    {
        if (isalpha(word[i]))
        {
            letters++;
        }
        if (word[i] == ' ')
        {
            words++;
        }
    }
    valueL = ( (float) letters / words) * 100; 
    return valueL;
}

float calculate_S(string word)
{
    float valueS;
    int sentences = 0, words = 1;

    // function
    for (int i = 0; word[i] != '\0'; i++ )
    {
        if (word[i] == ' ')
        {
            words++;
        }

        if (word[i] == '.' || word[i] == '?' || word[i] == '!')
        {
            sentences++;
        }
    }
    valueS = ( (float) sentences / words) * 100;
    return valueS;
}