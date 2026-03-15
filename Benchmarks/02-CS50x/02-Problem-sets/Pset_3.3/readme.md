# tideman

plurality is simple, but the issue is that there could be multiple winners here.
that is where ranked-choice voting system comes into play.

instead of a person voting for `one candidate`. The person now arranges the candidates in a `preference order`. If they wish for a candidate to win, they put him/her at the `top`, followed by the `2nd prefered candidate` and it goes until all the candidates are arranged by `order of preference`.

Now, each voter's vote needs an uniform system. We call these Ballots.

| Ballot  | Ballot  | Ballot  | Ballot  | Ballot  |
| ------- | ------- | ------- | ------- | ------- |
| Alice   | Alice   | Bob     | Bob     | Alice   |
| Bob     | Charlie | Alice   | Alice   | Charlie |
| Charlie | Bob     | Charlie | Charlie | Bob     |

In this kind of scenario, we put up comparison between every candidate.
for example, in the above table, Between Alice & Bob, Alice scores 3 and Bob scores 2. Alice wins. Now in case of Alice vs Charlie, Alice scores 5 and charlie scores 0, so Alice wins against both and thus, the winner.

## Now, There is something called the tideman algorithm

In this case, we draw the candidates in a graph and bring out arrows that point to other candidates. Between 2 candidates, the winner is the one from whom, the arrow is coming out and the loser is the one, to whom the arrow is pointing to.

From our example above, the graph would stand as:

Alice-----→ Bob  
|ㅤㅤㅤㅤㅤㅤ↑  
|ㅤㅤㅤㅤㅤㅤ/  
|ㅤㅤㅤㅤㅤ/  
↓ㅤㅤㅤㅤ/  
Charlie

in this case, the winner is Alice, because all arrows are pointing from her, towards others.
but if you take a closer look, between Charlie and Bob, Charlie wins.

# However, there is a exceptional case

| Ballot  | Ballot  | Ballot  | Ballot  | Ballot  | Ballot  | Ballot  | Ballot  | ballot  |
| ------- | ------- | ------- | ------- | ------- | ------- | ------- | ------- | ------- |
| Alice   | Alice   | Alice   | Bob     | Bob     | Charlie | Charlie | Charlie | Charlie |
| Bob     | Bob     | Bob     | Charlie | Charlie | Alice   | Alice   | Alice   | Alice   |
| Charlie | Charlie | Charlie | Alice   | Alice   | Bob     | Bob     | Bob     | Bob     |

Alice vs Bob results: Alice-7, Bob-2 : Alice wins
Alice vs Charlie results: Alice-3, charlie-6 : Charlie wins
Charlie vs Bob results: Charlie-4, Bob-5 : Bob wins 

so the graph is like so:

Alice ←--Charlie 
|ㅤㅤㅤㅤㅤ↑  
|ㅤㅤㅤㅤ/  
|ㅤㅤㅤ/  
↓ㅤㅤ/  
Bob

Alice defeats Charlie, Charlie defeats Bob, Bob defeats Alice, None one wins, everyone wins, `a contradictory resutl`

## this is called a cycle of winners where no one truly wins.

To avoid this, the algorithm must be careful not to create any cycles and only then, a definite winner can come out.
So, now, how can this `not-creating-a-cycle` solve the above dilemma?
It's simple, we lock on to the graphs by finding out the most diffrences between preferences.
Alice is prefered by 7 voters whilst Bob has only 2. This is the biggest margin we have come across.
So, we need to lock this graph:

Alice-----→ Bob


Charlie

Then, we can clearly see that the 2nd biggest margin of defeat was between Alice and Charlie where Charlie got 6 preferences and the former with only 3. we we lock this too.

Alice-----→ Bob  
↑  
|  
|  
Charlie

Then the final result which was charlie at 4 and bob winning at 5. But according to cs50x, we should NOT count this one at all. Like, no arrows here.

So, the final result is not a cycle and rather alice and bob losing to charlie and alice respectively and thus charlie endin up winning.

# `ThiS IS tideMan voting method`

It consistent of three parts as we can see from all the examples:

*Tally:* Once all of the voters have indicated all of their preferences, determine, for each pair of candidates, who the preferred candidate is and by what margin they are preferred.

*Sort:* Sort the pairs of candidates in decreasing order of strength of victory, where strength of victory is defined to be the number of voters who prefer the preferred candidate.

*Lock:* Starting with the strongest pair, go through the pairs of candidates in order and “lock in” each pair to the candidate graph, so long as locking in that pair does not create a cycle in the graph.

---


Now, we shall understand the distributed code of `tideman.c`---> [click here](<tideman distro.c>)

# Understanding
Let’s take a look at `tideman.c`.

First, notice the two-dimensional array `preferences`. The integer `preferences[i][j]` will represent the number of voters who prefer candidate `i` over candidate `j`.

The file also defines another two-dimensional array, called `locked`, which will represent the candidate graph. `locked` is a boolean array, so `locked[i][j]` being true represents the existence of an edge pointing from candidate `i` to candidate `j`; `false` means there is no edge. (If curious, this representation of a graph is known as an “adjacency matrix”).

Next up is a `struct` called `pair`, used to represent a pair of candidates: each pair includes the `winner`’s candidate index and the `loser`’s candidate index.

The candidates themselves are stored in the array `candidates`, which is an array of `string`s representing the names of each of the candidates. There’s also an array of `pairs`, which will represent all of the pairs of candidates (for which one is preferred over the other) in the election.

The program also has two global variables: `pair_count` and `candidate_count`, representing the number of pairs and number of candidates in the arrays `pairs` and `candidates`, respectively.

Now onto `main`. Notice that after determining the number of candidates, the program loops through the `locked` graph and initially sets all of the values to `false`, which means our initial graph will have no edges in it.

Next, the program loops over all of the voters and collects their preferences in an array called `ranks` (via a call to `vote`), where `ranks[i]` is the index of the candidate who is the `i`th preference for the voter. These ranks are passed into the `record_preference` function, whose job it is to take those ranks and update the global `preferences` variable.

Once all of the votes are in, the pairs of candidates are added to the `pairs` array via a called to `add_pairs`, sorted via a call to `sort_pairs`, and locked into the graph via a call to `lock_pairs`. Finally, `print_winner` is called to print out the name of the election’s winner!

Further down in the file, you’ll see that the functions `vote`, `record_preference`, `add_pairs`,`sort_pairs`, `lock_pairs`, and `print_winner` are left blank. That’s up to you!

---

# TODO solving

## bool vote(int rank, string name, int ranks[])
 
 - think of vote() as a officer in a polling station and checks if a voter gives correct name and write it down. if its invalid, then dont write it down and tell them that it is invalid.
 - the input variables: 
   - `rank`: This is just which slot you are filling (e.g., "This is my 1st choice", "This is my 2nd choice").
   - `name`: The string the voter typed in (e.g., "Alice").
   - `ranks[]`: This is your notepad. You are going to write the index number (0, 1, or 2) of the candidate into this array at the specific position of rank.

- `the next steps are important`
- Iterate through the candidates: You have an array called candidates[] that holds the names of everyone running. You need to look through that list one by one.

- Compare strings: C doesn't let you compare strings with ==. You have to use the function strcmp(string1, string2).
  - If strcmp returns 0, it means the strings are identical! Match found!
- Update the notepad: If you find a match at index i of your candidates[] array, that means the voter wants that person in the current rank slot. So, you set ranks[rank] = i;.
- Return:
  - If you found the candidate, you successfully recorded the vote. Return true.
  - If you finish checking every candidate and none of them matched the name the voter typed, the voter messed up. Return false.

### see this below, the iteration explanation:

Iteration 1 (Rank 0 - The voter's 1st choice):
`main` calls `vote(0, "Charlie", ranks)`.
Inside `vote`, you loop through `candidates[0]`, `candidates[1]`, `candidates[2]`.
When you hit `candidates[2]`, strcmp says "Match!"
You execute `ranks[0] = 2`;. The "Notepad" now holds: `[2, ?, ?]`

Iteration 2 (Rank 1 - The voter's 2nd choice):
`main` calls `vote(1, "Alice", ranks)`.
You loop through the candidates again.
Match found at index `0`.
You execute `ranks[1] = 0`;. The "Notepad" now holds: `[2, 0, ?]`

Iteration 3 (Rank 2 - The voter's 3rd choice):
`main` calls `vote(2, "Bob", ranks)`.
Match found at index `1`.
You execute `ranks[2] = 1`;. The "Notepad" now holds: `[2, 0, 1]`


## void record_preferences(int ranks[])
