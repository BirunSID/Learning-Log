#include "../../cs50.h" //telling it to go up one folder and find and use the cs50.c and the cs50.h library. VERY HANDY!!!
#include <stdio.h>
#include <math.h> 
#include <ctype.h>
#include <string.h>

int main(int argc, string argv[])
{  
    // get user key.
    // validate user key.
    if (argc != 2)
    {
        printf("Error! should be 2 arguments only.\n"); // argument count validator
        return 1;
    }

    string user_key = argv[1];   // setting up pointer
    
    if (strlen(user_key) != 26)
    {
        printf("Error! length should be 26.\n");  // length
        return 1;
    }
    
    for (int i = 0; user_key[i] != 0; i++)
    {
        if (!isalpha(user_key[i]))
        {
        printf("Error! only alphabetical characters.\n"); // alphabet validator
        return 1;
        }
    }

    for (int i = 0; i < 26; i++)   // create nested loop
    {
        char temporary = toupper(user_key[i]);    // we give the character to the initial variable to set up validation

        for (int f = i + 1; f < 26; f++)   
        {
            if(temporary == toupper(user_key[f]))  // checking for duplicates
            {
            printf("Error! no duplicate characters allowed..\n"); // alphabet validator
            return 1;
            }
        }
    }

    // Get user input plaintext.

    string plain_text = get_string("plaintext:  ");
    
    // substitute the letter of plaintext to the position of the key and cipher it.

    printf("ciphertext: ");
    for (int i = 0; plain_text[i] != '\0'; i++)
    {
        if(isupper(plain_text[i]))
        {   
            int index_position = plain_text[i] - 'A';
            plain_text[i] = toupper(user_key[index_position]);
            printf("%c",plain_text[i]);
        }
        else if(islower(plain_text[i]))
        {   
            int index_position = plain_text[i] - 'a';
            plain_text[i] = tolower(user_key[index_position]);
            printf("%c",plain_text[i]); 
        }
        else   // leave all the other non-alphabet as is and print out the cipher text.
        {
            printf("%c",plain_text[i]); 
        }
    }
    printf("\n");
}