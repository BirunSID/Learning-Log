#include "../../cs50.h" //telling it to go up one folder and find and use the cs50.c and the cs50.h library. VERY HANDY!!!
#include <stdio.h>
#include <ctype.h>

int POINT[] = {1, 3, 3, 2, 1, 4, 2, 4, 1, 8, 5, 1, 3, 1, 1, 3, 10, 1, 1, 1, 1, 4, 4, 8, 4, 10};

int score_counter(string word);

int main(void)
{  
    // prompt the user for 2 words
    string word_1 = get_string("player 1: ");
    string word_2 = get_string("player 2: ");

    // spit the words into the function for score count
    int score_1 = score_counter(word_1);
    int score_2 = score_counter(word_2);


    // print the winner
    if (score_1 > score_2)
    {
        printf("player 1 wins");
    }
    else if (score_2 > score_1)
    {
        printf("player 2 wins");
    }
    else 
    {
        printf("tie!");
    }
}

// the sum to calculate the word's score 
int score_counter(string word)
{
    int score = 0;

    for (int i = 0; word[i] != '\0'; i++ )
    {
        if (isalpha(word[i]))
        {
        int index = toupper(word[i]) - 'A';
        int a = POINT[index];
        score += a;
        }
    }
    return score;
}