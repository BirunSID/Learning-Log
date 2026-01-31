#include "../cs50.h" //telling it to go up one folder and find and use the cs50.c and the cs50.h library. VERY HANDY!!!
#include <stdio.h>

void brk(int p); // prototype declaration!

int main(void)
{
    
// user input validation start!
    int h = 0;    
    do                              // user input validation!!!
    {
        h = get_int("Height: ");    // taking the input using the cs50.c library!!!
    }
    while (h <= 0 || h > 8);        // user input validation! (only 1 to 8 is acceptable)
//user input validation end!


// user input is used to indicate the pyramid height!
    for (int i = 0; i < h; i++) // we make the rows first using the brk(brick function). 
    {                           // The brick function runs and then makes a new line break and make the new row.
        int k = h - i - 1;      // we use this formula to specify empty spaces. 
        for (int e = k; e > 0; e--) // then we use this loop to make sure that the amount of spaces get less and less as the new line breaks
        {
            printf(" ");  // executes the empty spaces
        }
        brk(i); // runs the main brick function to print the hashes
    }
}


void brk(int p)           // primary function that does everything!!
{
    for (int i = 0; i <= p; i++) // we take the value of p which is derived fromt the first for and then compare it to make and print multiple hashes successfully 
    {
        printf("#"); // the printer of left triangle
    }
    printf("  ");  // we the print 2 spaces
    for (int i = 0; i <= p; i++) // then we make the next hash based on the previous value of p derived from the first for and also set the value for i into 0 again to do it all over again ! pretty easy
    {
        printf("#"); // the printer of right triangle
    }
    printf("\n"); // the colummn maker line breaker
}