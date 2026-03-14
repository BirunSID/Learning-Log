# Plurality

First, we need to download the distributed files.
For this, we use the command `wget -O plurality.zip https://cdn.cs50.net/2026/x/psets/3/plurality.zip` instead of `wget https://cdn.cs50.net/2026/x/psets/3/plurality.zip` because we are downloading it in our local machine.

Then we switch to gitbash and then unzip the `plurality.zip` file using this command: `unzip plurality.zip`.
Afterwards, we remove the zip file and open the main `.c` file that we got and finally we have to understand the file itself and fortunately, cs50x already explained it to us.
see the [source](<plurality distributable.c>) and then see below to understand what cs50x told us:
and then work on the main file [here](Plurarlity/plurality.c).

# Explained:

Whenever you’ll extend the functionality of existing code, it’s best to be sure you first understand it in its present state.

Look first at the top of the file. The line #define MAX 9 is some syntax used here to mean that MAX is a constant (equal to 9) that can be used throughout the program. Here, it represents the maximum number of candidates an election can have.

```c
// Max number of candidates
#define MAX 9
```
Notice that plurality.c then uses this constant to define a global array—that is, an array that any function can access.

```C
// Array of candidates
candidate candidates[MAX];
```
But what, in this case, is a candidate? In plurality.c, a candidate is a struct. Each candidate has two fields: a string called name representing the candidate’s name, and an int called votes representing the number of votes the candidate has.

```C
// Candidates have name and vote count
typedef struct
{
    string name;
    int votes;
}
candidate;
```
Now, take a look at the main function itself. See if you can find where the program sets a global variable candidate_count representing the number of candidates in the election.

```C
// Number of candidates
int candidate_count;
```

What about where it copies command-line arguments into the array candidates?

```C
// Populate array of candidates
candidate_count = argc - 1;
if (candidate_count > MAX)
{
    printf("Maximum number of candidates is %i\n", MAX);
    return 2;
}
for (int i = 0; i < candidate_count; i++)
{
    candidates[i].name = argv[i + 1];
    candidates[i].votes = 0;
}
```

And where it asks the user to type in the number of voters?

```C
int voter_count = get_int("Number of voters: ");
```

Then, the program lets every voter type in a vote, calling the vote function on each candidate voted for. Finally, main makes a call to the print_winner function to print out the winner (or winners) of the election. We’ll leave it to you to identify the code that implements this functionality.

If you look further down in the file, though, you’ll notice that the vote and print_winner functions have been left blank.

```C
// Update vote totals given a new vote
bool vote(string name)
{
    // TODO
    return false;
}

// Print the winner (or winners) of the election
void print_winner(void)
{
    // TODO
    return;
}
```

This part is up to you to complete! You should not modify anything else in plurality.c other than the implementations of the vote and print_winner functions (and the inclusion of additional header files, if you’d like).


# Upto me TODO

As we can see, our job is to work and extend and correctly make up the two function file `vote()` and `print_winner()`.

## vote():

- When an user types in a candidate's name to vote, the program has to go and check the name of all the candidates and match it to see if the candidate really exists, if it does, it should increment the vote count of that specific candidate by one, and if not, it should return `invalid vote`

- the function is executed via `if (!vote(name))`, inside here, there is a exclamation that reverses the boolean value and then moves onto printing error in case if the voters name is not matching with the candidates.

- Now, going inside of the main function, we try to match the voter given name and the name of the candidate in the entire array and then we increase their voter count by 1 if the name matches.

- we use a `for loop` here. And inside of this,we put `i < candidate_count`, NOTE that we cannot put any string to make the comparison, but rather the length of the string. Next up, we compare the strings for matching name. we take the user given string and then we use `strcmp` to compare and subtract the ASCII values of the strings to figure out if the sum comes to zero. if it does, then it means that we have a MATCH.

- If we have a match, we increase the vote count of the candidate by `one(1)` using this code `candidates[m].votes += 1;` and then we `return true` for this. The reason we return true after each increment is because the boolean true goes up to the main `if (!vote(name))` and then because of the exclamation mark, the boolean values are reversed and thus the if function becomes false and the error print is not executed.

- then at the end, we `return false` outside of the entire `for loop`. So, if the names dont match, we return false and the false goes up and is reversed to true and the error message is printed and the programme stopped.

VOila!

## print_winner():

- In case of print winner, i initially thought about using recursion but nothing came to mind and so i stick to the OG rules of iteration.

- we need to figure out the highest number of votes that a candidate receives. For that, we first give the first index of the `votes sub array`, a variable called `high_vote`.

- Afterwards, we do a `for loop`, we do `for (int i = 0; i < candidate_count; i++)` and then in the execution body, what we do is, compare the high_vote variable with the `sub array` of the `vote count` in the `candidate array` and then each time we find a bigger value than high_vote, we give the value of the arrays vote to the variable high_vote and keep comparing again and again and do this until we end up with a variable high_vote that has the value of the highest vote count in the entire array of the candidates.

- then in order to print out the winner(s) with the highest vote count, we simply use another for loop , `for (int j = 0; j < candidate_count; j++)` and then we do an if function inside of this where the candidates final total vote count is compared with the high_vote variable which is the highest vote count and then if it matches with a candidate, we print the candidates name like so: `candidates[j].name`  and then at the end of the function, righ outside of the two for loops, we do a simple return;

- VOILA!!