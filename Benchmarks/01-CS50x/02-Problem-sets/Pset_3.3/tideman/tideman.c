#include "../../cs50.h"
#include <stdio.h>
#include <string.h>

// Max number of candidates
#define MAX 9

// preferences[i][j] is number of voters who prefer i over j
int preferences[MAX][MAX];

// locked[i][j] means i is locked in over j
bool locked[MAX][MAX];

// Each pair has a winner, loser
typedef struct
{
    int winner;
    int loser;
} pair;

// Array of candidates
string candidates[MAX];
pair pairs[MAX * (MAX - 1) / 2];

int pair_count;
int candidate_count;

// Function prototypes
bool vote(int rank, string name, int ranks[]);
void record_preferences(int ranks[]);
void add_pairs(void);
void sort_pairs(void);
bool is_cycle(int start, int current);
void lock_pairs(void);
void print_winner(void);

int main(int argc, string argv[])
{
    // Check for invalid usage
    if (argc < 2)
    {
        printf("Usage: tideman [candidate ...]\n");
        return 1;
    }

    // Populate array of candidates
    candidate_count = argc - 1;
    if (candidate_count > MAX)
    {
        printf("Maximum number of candidates is %i\n", MAX);
        return 2;
    }
    for (int i = 0; i < candidate_count; i++)
    {
        candidates[i] = argv[i + 1];
    }

    // Clear graph of locked in pairs
    for (int i = 0; i < candidate_count; i++)
    {
        for (int j = 0; j < candidate_count; j++)
        {
            locked[i][j] = false;
        }
    }

    pair_count = 0;
    int voter_count = get_int("Number of voters: ");

    // Query for votes
    for (int i = 0; i < voter_count; i++)
    {
        // ranks[i] is voter's ith preference
        int ranks[candidate_count];

        // Query for each rank
        for (int j = 0; j < candidate_count; j++)
        {
            string name = get_string("Rank %i: ", j + 1);

            if (!vote(j, name, ranks))
            {
                printf("Invalid vote.\n");
                return 3;
            }
        }

        record_preferences(ranks);

        printf("\n");
    }

    add_pairs();
    sort_pairs();
    lock_pairs();
    print_winner();
    return 0;
}

// Update ranks given a new vote
bool vote(int rank, string name, int ranks[])
{
    // TODO
    // loops through all the candidates to see if the name matches.
    for (int i = 0; i < candidate_count; i++)
    {
        // checks if the voter's input matches the candidate's name
        if (strcmp(name, candidates[i]) == 0)
        {
            // we found the match
            // put their index (i) into the ranks array at the current rank position
            ranks[rank] = i;

            // return true because the vote was valid
            return true;
        }
    }
    return false;
}

// Update preferences given one voter's ranks
void record_preferences(int ranks[])
{
    // TODO
    // the outer loop which picks the first candidate who was preferred by the voter.
    for (int i = 0; i < candidate_count; i++)
    {
        // the inner loop which picks the candidates that were preferred lower one by one
        for (int j = i + 1; j < candidate_count; j++)
        {
            // the candidate i were preferred over candidate at j
            // incrememnt the specific cell of winner:loser vote difference pair by one
            preferences[ranks[i]][ranks[j]]++;
        }
    }
    return;
}

// Record pairs of candidates where one is preferred over the other
void add_pairs(void)
{
    // TODO

    for (int i = 0; i < candidate_count; i++)
    {
        for (int j = i + 1; j < candidate_count; j++)
        {
            if (preferences[i][j] > preferences[j][i])
            {
                pairs[pair_count].winner = i;
                pairs[pair_count].loser = j;
                pair_count++;
            }
             // ONLY add if the second person actually has MORE votes
            else if (preferences[j][i] > preferences[i][j])
            {
                pairs[pair_count].winner = j;
                pairs[pair_count].loser = i; 
                pair_count++;
            }
             // If they are equal (a tie), do nothing!
        }
    }
}

// Sort pairs in decreasing order by strength of victory
void sort_pairs(void)
{
    // TODO
    
    for (int i = 0; i < pair_count - 1; i++)
    {    
        for (int j = 0; j < pair_count - 1 - i; j++)
        {
            if (preferences[pairs[j].winner][pairs[j].loser] < preferences[pairs[j+1].winner][pairs[j+1].loser])
           {
              int temp_winner = pairs[j].winner;
              int temp_loser  = pairs[j].loser;
  
              pairs[j].winner = pairs[j+1].winner;
              pairs[j].loser  = pairs[j+1].loser;
  
              pairs[j+1].winner = temp_winner;
              pairs[j+1].loser  = temp_loser;
           }
        }
    }
    return;
}

// This is the helper function for lock_pairs function and makes things easier
bool is_cycle(int winner, int current)
{
    // if the person we are currently standing on is "winner"
    // it means we found a path from loser to winner
    if ( current == winner)
    {
        return true; // so we found a cycle if it comes down to this line.
    }
    // look for who "current" points to
    for (int i = 0; i < candidate_count; i++)
    {
        // check if there are any path connecting current and i
        if (locked[current][i])
        {
            // follow the arrow to i and check if i can reach the winner.
            if (is_cycle(winner, i)) // recursion loop that validates if we can go back to the winner from the loser.
            {
                return true; // the cycle continues
            }
        }      
    }
    return false; // no cycle found!!
}

// Lock pairs into the candidate graph in order, without creating cycles
void lock_pairs(void)
{
    // TODO

    // We have a list of pairs (e.g., pairs[0], pairs[1], pairs[2]...)
    // They are sorted by "Strength of Victory" (from strongest to weakest)
    for (int i = 0; i < pair_count; i++)
    {
        // We pick ONE pair from the list: pairs[i]
        int winner = pairs[i].winner;
        int loser = pairs[i].loser;
        
        // We ask our detector: "If I add this pair to the board, will I form a circle?"
        if (!is_cycle(winner, loser)) // -----> this is our helper function on top of this function, this was the hardest part!!
        {
            // If the detector says "NO CIRCLE", we add the arrow to the board!
            locked[winner][loser] = true; 
        }
        // If the detector says "YES CIRCLE", we do nothing. We skip this arrow.
    }
    return;
}

// Print the winner of the election
void print_winner(void)
{
    // TODO

    for (int candidate = 0; candidate < candidate_count; candidate++) // designate a potential candidate starting with the first amd reiterate
    {
        bool is_loser = false; // assign him to be a winner and not a loser initially.

        for (int i = 0; i < candidate_count; i++) // designate someone who could possibly have beaten him and reiterate
        {
            if (locked[i][candidate] == true) // we check if any i candidate beat "candidate".
            {
                is_loser = true; // he is a loser even if one person were to beat him
                break; // break the function, we dont need to check him anymore.
            }
        }
        // after we check the above function and find out that the "candidate" is not a loser, we proceed to the following
        if (is_loser == false)
        {
          printf("%s\n",candidates[candidate]);
          return;
        }
    }
    return;
}