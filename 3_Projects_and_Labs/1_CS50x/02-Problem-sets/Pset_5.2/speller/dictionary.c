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
const unsigned int N = 26;

// Hash table
node *table[N];

// Returns true if word is in dictionary, else false
bool check(const char *word)
{
    // TODO
    return false;
}

// Hashes word to a number
unsigned int hash(const char *word)
{
    // TODO: Improve this hash function
    return toupper(word[0]) - 'A';
}

// Loads dictionary into memory, returning true if successful, else false
bool load(const char *dictionary)
{
    // TODO

    // 1. Open dictionary file
    FILE *source = fopen(dictionary, "r");
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
    return 0;
}

// Unloads dictionary from memory, returning true if successful, else false
bool unload(void)
{
    // TODO
    return false;
}
