// Implements a dictionary's functionality

#include <ctype.h>
#include <stdbool.h>
#include "dictionary.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <strings.h> // Required for strcasecmp

// Represents a node in a hash table
typedef struct node
{
    char word[LENGTH + 1];
    struct node *next;
} node;

// TODO: Choose number of buckets in hash table
// Global variable to count words in dictionary
unsigned int word_count = 0;
const unsigned int N = 17576;

// Hash table
node *table[N];

// helper function prototype declaration.
void free_chain(node *n);

// Returns true if word is in dictionary, else false
bool check(const char *word)
{
    // TODO

    // 1. Get the hash index for the word
    unsigned int index = hash(word);

    // 2. Create a "cursor" to walk through the linked list
    // Point it to the first node in that drawer
    node *cursor = table[index];
    
    // 3. Traverse the linked list until you hit NULL (the end)
    while (cursor != NULL)
    {
        // 4. Compare the word in the node with the word we are checking
        // We use strcasecmp because it ignores CAPITALIZATION
        if (strcasecmp(word, cursor->word) == 0)
        {
            // found it!
            return true;
        }
        // 5. Move the cursor to the next node in the list
        cursor = cursor->next;
    }
    // if we reach the end of the list and didn't find the word, it's not there
    return false;
}

// Hashes word to a number
unsigned int hash(const char *word)
{
    // TODO: Improve this hash function
    // 1. First letter (the "676s" place)
    unsigned int hash_value = (toupper(word[0]) - 'A') * 676;

    // 2. Check for second letter
    if (word[1] != '\0' && isalpha(word[1]))
    {
        // Second letter (the "26s" place)
        hash_value += (toupper(word[1]) - 'A') * 26;
    
        // 3. Check for third letter
        if (word[2] != '\0' && isalpha(word[2]))
        {
        // Third letter (the "1s" place)
        hash_value += (toupper(word[2]) - 'A') * 1;
        }   
    }
    // return the value modulo N to stay safe
    return hash_value % N;
}

// Loads dictionary into memory, returning true if successful, else false
bool load(const char *dictionary)
{
    // TODO

    // 1. Open dictionary file
    FILE *source = fopen(dictionary, "rb");
    if (source == NULL)
    {
        return false;
    }

    // Buffer to store the word currently reading
    char word[LENGTH + 1];

    // 2. Read strings from file one at a time
    // fscanf returns EOF when it reaches the end of the file
    while (fscanf(source, "%s", word) != EOF)
    {
        // 3. Create a new node for each word
        node *n = malloc(sizeof(node));
        if (n == NULL)
        {
            fclose(source); // Close the file if you run out of memory!
            return false;
        }

        // 4. Copy word into node using strcpy(destination, source)
        strcpy(n->word, word);

        // 5. Hash word to obtain a hash value
        unsigned int index = hash(word);

        // 6. Insert node into hash table at that location
        // IMPORTANT: Point your new node to the current head of the list first!
        n->next = table[index];
        table[index] = n;

        // Increment our global word counter
        word_count++;
    }

    // 7. Close dictionary
    fclose(source);
    return true;
}

// Returns number of words in dictionary if loaded, else 0 if not yet loaded
unsigned int size(void)
{
    // TODO

    // Just return the global variable we updated in load
    return word_count;

    return 0;
}

// Unloads dictionary from memory, returning true if successful, else false
bool unload(void)
{
    // TODO

     // Iterate through every "hook"
     for (int i = 0; i < N; i++)
     {
        // call the recursive helper function for each chain
        free_chain(table(i));
     }
    return true;
}

// 1. Create a "Helper" function for the recursion
// This goes at the bottom of your file, or above unload
void free_chain(node *n)
{
    // Base case: If we hit the end of the chain (the last child), stop
    if (n == NULL)
    {
        return;
    }

    // recursive step: Go to the "child" (the next node) first
    free_chain(n->next);
    
    // The backtrack: Now that the child has been freed, free the "parent"
    free(n);
}