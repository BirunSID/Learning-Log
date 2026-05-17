# Speller

<details>
  <summary>Performance Results:</summary>
  My implementation achieved a total execution time of 0.07s on texts/lalana.txt, matching the performance of the CS50 Staff solution. While the staff solution was 0.01s faster in the check function, my implementation was 0.01s faster in load, demonstrating a highly efficient file-parsing and memory-allocation strategy.

### staff code
  WORDS MISSPELLED:     955  
WORDS IN DICTIONARY:  143091  
WORDS IN TEXT:        17756  
TIME IN load:         0.03  
TIME IN check:        0.03  
TIME IN size:         0.00  
TIME IN unload:       0.01  
TIME IN TOTAL:        0.07  

---
### my code
WORDS MISSPELLED:     955  
WORDS IN DICTIONARY:  143091  
WORDS IN TEXT:        17756  
TIME IN load:         0.02  
TIME IN check:        0.04  
TIME IN size:         0.00  
TIME IN unload:       0.00  
TIME IN TOTAL:        0.07  
</details>

## problem to solve
For this problem, we’ll implement a program that spell-checks a file, a la the below, using a hash table.

## Background
Theoretically, on input of size n, an algorithm with a running time of n is “asymptotically equivalent,” in terms of O, to an algorithm with a running time of 2n. Indeed, when describing the running time of an algorithm, we typically focus on the dominant (i.e., most impactful) term (i.e., n in this case, since n could be much larger than 2). In the real world, though, the fact of the matter is that 2n feels twice as slow as n.

The challenge ahead of you is to implement the fastest spell checker you can! By “fastest,” though, we’re talking actual “wall-clock,” not asymptotic, time.

In `speller.c`, we’ve put together a program that’s designed to spell-check a file after loading a dictionary of words from disk into memory. That dictionary, meanwhile, is implemented in a file called `dictionary.c`. (It could just be implemented in `speller.c`, but as programs get more complex, it’s often convenient to break them into multiple files.) The prototypes for the functions therein, meanwhile, are defined not in `dictionary.c` itself but in `dictionary.h` instead. That way, both `speller.c` and `dictionary.c` can `#include` the file. Unfortunately, we didn’t quite get around to implementing the loading part. Or the checking part. Both (and a bit more) we leave to you! But first, a tour.

## Understanding

### dictionary.h
Open up `dictionary.h`, and you’ll see some new syntax, including a few lines that mention `DICTIONARY_H`. No need to worry about those, but, if curious, those lines just ensure that, even though `dictionary.c` and `speller.c` (which you’ll see in a moment) `#include` this file, `clang` will only compile it once.

Next notice how we `#include` a file called `stdbool.h`. That’s the file in which `bool` itself is defined. You’ve not needed it before, since the CS50 Library used to `#include` that for you.

Also notice our use of `#define`, a “preprocessor directive” that defines a “constant” called `LENGTH` that has a value of `45`. It’s a constant in the sense that you can’t (accidentally) change it in your own code. In fact, `clang` will replace any mentions of `LENGTH` in your own code with, literally, `45`. In other words, it’s not a variable, just a find-and-replace trick.

Finally, notice the prototypes for five functions: `check`, `hash`, `load`, `size`, and `unload`. Notice how three of those take a pointer as an argument, per the `*`:
```C
bool check(const char *word);
unsigned int hash(const char *word);
bool load(const char *dictionary);
```
Recall that `char * `is what we used to call `string`. So those three prototypes are essentially just:
```C
bool check(const string word);
unsigned int hash(const string word);
bool load(const string dictionary);
```
And `const`, meanwhile, just says that those strings, when passed in as arguments, must remain constant; you won’t be able to change them, accidentally or otherwise!

### dictionary.c
Now open up `dictionary.c`. Notice how, atop the file, we’ve defined a `struct` called `node` that represents a node in a hash `table`. And we’ve declared a global pointer array, table, which will (soon) represent the hash table you will use to keep track of words in the dictionary. The array contains `N` node pointers, and we’ve set `N` equal to `26` for now, to match with the default `hash` function as described below. You will likely want to increase this depending on your own implementation of `hash`.

Next, notice that we’ve implemented `load`, `check`, `size`, and `unload`, but only barely, just enough for the code to compile. Notice too that we’ve implemented `hash` with a sample algorithm based on the first letter of the word. Your job, ultimately, is to re-implement those functions as cleverly as possible so that this spell checker works as advertised. And fast!

### speller.c

Okay, next open up `speller.c` and spend some time looking over the code and comments therein. You won’t need to change anything in this file, and you don’t need to understand its entirety, but do try to get a sense of its functionality nonetheless. Notice how, by way of a function called `getrusage`, we’ll be “benchmarking” (i.e., timing the execution of) your implementations of `check`, `load`, `size`, and `unload`. Also notice how we go about passing `check`, word by word, the contents of some file to be spell-checked. Ultimately, we report each misspelling in that file along with a bunch of statistics.
Notice, incidentally, that we have defined the usage of `speller` to be
```powershell
Usage: speller [dictionary] text
```
where `dictionary` is assumed to be a file containing a list of lowercase words, one per line, and `text` is a file to be spell-checked. As the brackets suggest, provision of `dictionary` is optional; if this argument is omitted, `speller` will use `dictionaries/large` by default. In other words, running
```powershell
./speller text
```
will be equivalent to running
```powershell
./speller dictionaries/large text
```
where `text` is the file you wish to spell-check. Suffice it to say, the former is easier to type! (Of course, `speller` will not be able to `load` any dictionaries until you implement load in `dictionary.c`! Until then, you’ll see `Could not load`.)

Within the default dictionary, mind you, are 143,091 words, all of which must be loaded into memory! In fact, take a peek at that file to get a sense of its structure and size. Notice that every word in that file appears in lowercase (even, for simplicity, proper nouns and acronyms). From top to bottom, the file is sorted lexicographically, with only one word per line (each of which ends with `\n`). No word is longer than 45 characters, and no word appears more than once. During development, you may find it helpful to provide `speller` with a `dictionary` of your own that contains far fewer words, lest you struggle to debug an otherwise enormous structure in memory. In `dictionaries/small` is one such dictionary. To use it, execute
```powershell
./speller dictionaries/small text
```
where `text` is the file you wish to spell-check. Don’t move on until you’re sure you understand how `speller` itself works!
Odds are, you didn’t spend enough time looking over `speller.c`. Go back one square and walk yourself through it again!

### texts/

So that you can test your implementation of `speller`, we’ve also provided you with a whole bunch of texts, among them the script from La La Land, the text of the Affordable Care Act, three million bytes from Tolstoy, some excerpts from The Federalist Papers and Shakespeare, and more. So that you know what to expect, open and skim each of those files, all of which are in a directory called `texts` within your `pset5` directory.

Now, as you should know from having read over `speller.c` carefully, the output of `speller`, if executed with, say,

`./speller texts/lalaland.txt`

will eventually resemble the below.
Below’s some of the output you’ll see. For information’s sake, we’ve excerpted some examples of “misspellings.” And lest we spoil the fun, we’ve omitted our own statistics for now.

```powershell
MISSPELLED WORDS

[...]
AHHHHHHHHHHHHHHHHHHHHHHHHHHHT
[...]
Shangri
[...]
fianc
[...]
Sebastian's
[...]

WORDS MISSPELLED:
WORDS IN DICTIONARY:
WORDS IN TEXT:
TIME IN load:
TIME IN check:
TIME IN size:
TIME IN unload:
TIME IN TOTAL:
```

`TIME IN load` represents the number of seconds that `speller` spends executing your implementation of `load`. `TIME IN check` represents the number of seconds that `speller` spends, in total, executing your implementation of `check`. `TIME IN size` represents the number of seconds that `speller` spends executing your implementation of `size`. `TIME IN unload` represents the number of seconds that `speller` spends executing your implementation of `unload`. `TIME IN TOTAL` is the sum of those four measurements.

**Note that these times may vary somewhat across executions of speller, depending on what else your codespace is doing, even if you don’t change your code.**

Incidentally, to be clear, by “misspelled” we simply mean that some word is not in the dictionary provided.

### makefile

And, lastly, recall that `make` automates compilation of your code so that you don’t have to execute `clang` manually along with a whole bunch of switches. However, as your programs grow in size, `make` won’t be able to infer from context anymore how to compile your code; you’ll need to start telling `make` how to compile your program, particularly when they involve multiple source (`i.e., .c`) files, as in the case of this problem. And so we’ll utilize a Makefile, a configuration file that tells make exactly what to do. Open up Makefile, and you should see four lines:

1. The first line tells make to execute the subsequent lines whenever you yourself execute make speller (or just make).
2. The second line tells make how to compile speller.c into machine code (i.e., speller.o).
3. The third line tells make how to compile dictionary.c into machine code (i.e., dictionary.o).
4. The fourth line tells make to link speller.o and dictionary.o in a file called speller.

**Be sure to compile speller by executing make speller (or just make). Executing make dictionary won’t work!**

# Specification

Alright, the challenge now before you is to implement, in `order`, `load`, `hash`, `size`, `check`, and `unload` as efficiently as possible using a hash table in such a way that `TIME IN load`, `TIME IN check`, `TIME IN size`, and `TIME IN unload` are all minimized. To be sure, it’s not obvious what it even means to be minimized, inasmuch as these benchmarks will certainly vary as you feed `speller` different values for `dictionary` and for `text`. But therein lies the challenge, if not the fun, of this problem. This problem is your chance to design. Although we invite you to minimize space, your ultimate enemy is time. But before you dive in, some specifications from us.

- You may not alter `speller.c` or `Makefile`.
- You may alter `dictionary.c` (and, in fact, must in order to complete the implementations of `load`, `hash`, `size`, `check`, and `unload`), but you may not alter the declarations (i.e., prototypes) of `load`, `hash`, `size`, `check`, or `unload`. You may, though, add new functions and (local or global) variables to dictionary.c.
- You may change the value of `N` in `dictionary.c`, so that your hash table can have more buckets.
- You may alter `dictionary.h`, but you may not alter the declarations of `load`, `hash`, `size`, `check`, or `unload`.
- Your implementation of `check` must be case-insensitive. In other words, if `foo` is in dictionary, then `check` should return true given any capitalization thereof; none of `foo`, `foO`, `fOo`, `fOO`, `fOO`, `Foo`, `FoO`, `FOo`, and `FOO` should be considered misspelled.
- Capitalization aside, your implementation of `check` should only return `true` for words actually in `dictionary`. Beware hard-coding common words (e.g., `the`), lest we pass your implementation a `dictionary` without those same words. Moreover, the only possessives allowed are those actually in `dictionary`. In other words, even if `foo` is in `dictionary`, `check` should return `false` given `foo's` if `foo's` is not also in `dictionary`.
- You may assume that any `dictionary` passed to your program will be structured exactly like ours, alphabetically sorted from top to bottom with one word per line, each of which ends with `\n`. You may also assume that `dictionary` will contain at least one word, that no word will be longer than `LENGTH` (a constant defined in `dictionary.h`) characters, that no word will appear more than once, that each word will contain only lowercase alphabetical characters and possibly apostrophes, and that no word will start with an apostrophe.
- You may assume that `check` will only be passed words that contain (uppercase or lowercase) alphabetical characters and possibly apostrophes.
- Your spell checker may only take `text` and, optionally, `dictionary` as input. Although you might be inclined (particularly if among those more comfortable) to “pre-process” our default dictionary in order to derive an “ideal hash function” for it, you may not save the output of any such pre-processing to disk in order to load it back into memory on subsequent runs of your spell checker in order to gain an advantage.
- Your spell checker must not leak any memory. Be sure to check for leaks with `valgrind`.
- The hash function you write should ultimately be your own, not one you search for online.

### What I have to do:

- Implement load.
- Implement hash.
- Implement size.
- Implement check.
- Implement unload.

### LOAD implementation

#### Overview
The `load` function is responsible for migrating words from a dictionary file into a memory-resident data structure—specifically a **Hash Table**. This allows for near-constant time lookup ($O(1)$ or $O(n/k)$) during the spell-checking process.

#### Implementation Details

The implementation follows a strict 7-step process to ensure data integrity and memory safety:

1.  **File Stream Initialization**:
    The function opens the dictionary file using `fopen` in read mode (`"r"`). It includes a safety check to ensure the file exists; if the file pointer returns `NULL`, the function exits early to prevent a crash.

2.  **Efficient Word Parsing**:
    Using a `while` loop, the function employs `fscanf` to read strings from the file one by one. The loop terminates automatically when `fscanf` reaches the End Of File (`EOF`).

3.  **Dynamic Memory Allocation**:
    For every word read, a new `node` is created using `malloc`. This is the most memory-intensive part of the program.
    *   **Safety Logic**: If `malloc` fails (returning `NULL`), the function captures this, closes the open file stream to prevent a resource leak, and returns `false`.

4.  **Data Population**:
    The dictionary word is copied into the node's `word` array using `strcpy`.

5.  **Index Determination (Hashing)**:
    The function calls the `hash` function, passing the word to receive an integer index. This index determines which "bucket" in the hash table the word will reside in.

6.  **Linked List Insertion (Prepend Logic)**:
    To keep the insertion time at $O(1)$ (constant time), the function performs a **prepend** operation:
    *   The new node’s `next` pointer is set to the current head of the list at that hash index (`n->next = table[index]`).
    *   The head of the hash table is then updated to point to the new node (`table[index] = n`).
    *   This ensures that no existing data is "orphaned" or lost during the insertion.

7.  **Telemetry and Cleanup**:
    A global variable `word_count` is incremented during every successful loop iteration. This allows the `size` function to return the total word count instantly without re-scanning the table. Finally, `fclose` is called to release the file system resources.
#### Design Challenges Solved
*   **Preventing Memory Leaks**: I ensured that if a memory allocation fails mid-load, the file is closed properly before the program exits.
*   **Collision Handling**: By using an array of linked lists (Chaining), the function can store multiple words that hash to the same index without data loss.
*   **Pointer Maintenance**: The order of operations in Step 6 was critical. By pointing the new node to the list *before* updating the table head, I maintained the integrity of the linked list chain.

## HASH implementation
The `hash` function is the "Sorting Machine" of the program. It converts a string (a word) into a specific numerical index. By using a **three-letter positional system**, this function distributes words across **17,576 buckets**, ensuring that each linked list remains short and fast to search.

### The "Base-26" Logic
This implementation treats the first three letters of a word like a 3-digit number, but instead of "Base-10" (0–9), it uses **"Base-26"** (A–Z).

1.  **The 1st Letter (The "676s" place):** 
    We take the first letter and multiply it by $26 \times 26$ (676). This creates 26 massive "zones" in the hash table, one for every starting letter of the alphabet.
2.  **The 2nd Letter (The "26s" place):** 
    We take the second letter and multiply it by 26. This divides each "starting letter zone" into 26 smaller "sub-zones" based on the second letter.
3.  **The 3rd Letter (The "1s" place):** 
    We add the value of the third letter directly. This pinpoints the exact bucket for that specific three-letter combination (e.g., "ABA", "ABB", "ABC").

### Step-by-Step Breakdown

#### 1. Case Insensitivity
The function uses `toupper()` on every character. This ensures that "Apple", "APPLE", and "aPpLe" all calculate the exact same hash value, which is a requirement for a case-insensitive spell-checker.

#### 2. Bounds Safety (The `\0` checks)
Before accessing `word[1]` or `word[2]`, the function checks `word[i] != '\0'`. 
*   **Why:** If a word only has one letter (like "I"), trying to look at the second or third letter would cause the program to read "garbage" memory or crash. These checks act as safety gates.

#### 3. Handling Non-Alphabetic Characters (`isalpha`)
Since the dictionary contains words with apostrophes (like `can't`), the function uses `isalpha()`.
*   **Logic:** If the second or third character is an apostrophe, the math for that specific letter is skipped. This prevents the function from returning a negative index or a value that is mathematically "off the map."

#### 4. The Modulo Lock (`% N`)
Even though the math is designed to produce a number within the range of $N$ ($17,576$), the function concludes with `return hash_value % N;`.
*   **Purpose:** This is a standard "Defensive Programming" technique. It guarantees that the index returned will **always** be a valid index within the hash table array, preventing "Segmentation Faults" (crashes).

### Performance Impact
By shifting from a 1-letter hash (26 buckets) to a 3-letter hash (17,576 buckets):
*   **Collision Reduction:** Words are spread out much more thinly.
*   **Search Speed:** Instead of searching through a list of 5,000+ words in `check`, the computer only has to look at a tiny list (usually fewer than 10 words). This moves the program's efficiency closer to $O(1)$ (constant time).



## Size Implementation
The `size` function is responsible for returning the total number of words successfully loaded into the hash table. In this implementation, the function is a **constant-time ($O(1)$)** operation, meaning it returns the answer instantly regardless of whether the dictionary has 10 words or 10 million.

### Implementation Strategy: "Pre-calculation"
The `size` function is implemented as a single line of code:
```c
return word_count;
```

#### Why is it only one line?
In many programming tasks, there are two ways to find the "size" of a data structure:
1.  **The "Count-on-Demand" Method (Slow):** Every time `size` is called, the computer iterates through all 17,576 buckets and traverses every linked list to count the nodes. This is extremely slow ($O(N)$).
2.  **The "Running-Total" Method (Fast):** You keep a counter that you update as you go. By the time `size` is called, the work is already done.

We chose the **Running-Total** method to ensure our spell-checker is as fast as possible.

### The Synergy with `load`
The `size` function relies entirely on the work done in the `load` function. Here is how they work together:

*   **Step 1 (Initialization):** A global variable `unsigned int word_count` is initialized to `0` at the top of the program.
*   **Step 2 (The Load Loop):** Inside the `load` function’s `while` loop, every time a new word is successfully read from the file and inserted into the hash table, the code executes `word_count++;`.
*   **Step 3 (Hand-off):** By the time `load` finishes and closes the dictionary file, `word_count` contains the exact final tally of nodes in memory.
*   **Step 4 (Instant Retrieval):** When the main program calls `size()`, the function doesn't perform any math or searching. It simply hands over the value already stored in the `word_count` variable.

### Efficiency and Speed
By moving the "work" of counting into the `load` function (which only runs once), we have optimized the `size` function to be a **zero-cost** operation during the actual spell-checking phase. This is a classic example of **Space-Time Tradeoff**: we use a tiny bit of space (one integer variable) to save a massive amount of time.

## Check Implementation
The `check` function is the core of the spell-checker. Its job is to determine if a specific word exists in the dictionary that was loaded into memory. Thanks to the hash table structure, this search does not require looking through the entire dictionary. Instead, it uses the "Jump and Search" method to find the word in **near-constant time**.

### The "Jump and Search" Logic

#### 1. The Instant Jump (Hashing)
The very first step is to run the input word through the `hash` function:
```c
unsigned int index = hash(word);
```
Because the `hash` function is a mathematical formula, the computer doesn't "search" for the index—it **calculates** it. This gives the program a direct "address" (an index between 0 and 17,575). 

Instead of checking 140,000 words, the program instantly **jumps** to that specific index in the `table` array. This effectively ignores 99.9% of the dictionary instantly.

#### 2. The Finger (The Cursor)
Once the program is at the correct "drawer" (bucket) in the hash table, it needs to look at the chain of words inside. 
```c
node *cursor = table[index];
```
A "cursor" pointer is created to act like a finger pointing at the folders. We use a cursor instead of the `table[index]` itself so that we don't lose the "hook" at the top of the drawer.

#### 3. Navigating the Chain (The Traversal)
The function uses a `while` loop to move the cursor from node to node:
```c
while (cursor != NULL)
{
    // ... logic ...
    cursor = cursor->next;
}
```
If the cursor reaches `NULL`, it means we have reached the end of the chain without finding the word.

#### 4. Case-Insensitive Comparison
The program uses `strcasecmp` to compare the word from the text with the word stored in the current node:
```c
if (strcasecmp(word, cursor->word) == 0)
```
*   **Why `strcasecmp`?** This function is essential because it treats "APPLE", "apple", and "ApPlE" as the exact same word. 
*   **The Match:** If `strcasecmp` returns `0`, it means a match was found, and the function returns `true` immediately.

### This is Fast!!
By using 17,576 buckets, we have divided the dictionary into thousands of tiny piles. 
*   In a standard list, you might have to check **70,000 words** on average.
*   In this Hash Table, you only check the **~8 words** that happen to share the same 3-letter hash index.

### Design Safety
*   **Pointer Safety:** The loop condition `while (cursor != NULL)` ensures that we never try to read a word from a "non-existent" node, preventing crashes on empty buckets or at the end of a list.
*   **Read-Only:** The `check` function does not move or change any data in the hash table; it only reads it.



## Unload Implementation
The `unload` function is the program's "cleanup crew." It is responsible for releasing all the memory borrowed from the system via `malloc`. This implementation uses a **Recursive Helper Function** called `free_chain` to perform a **Post-Order Traversal**, ensuring that every node is freed without losing pointers to the rest of the list.

### 1. The Main Function: `unload`
The primary `unload` function serves as the orchestrator. Its job is simple:
*   It iterates through every "hook" (index) in the hash table from `0` to `N-1`.
*   For each index, it calls the helper function `free_chain` and passes in the head of the linked list found at that index (`table[i]`).
*   Once all buckets have been processed, it returns `true` to signal a successful cleanup.

### 2. The Helper Function: `free_chain(node *n)`
Because the standard `unload` function (defined by CS50) takes no arguments, a helper function is required to perform recursion. This function follows the **"Parent-Child"** logic:

#### **A. The Base Case (The Stop Sign)**
```c
if (n == NULL)
{
    return;
}
```
Every recursive function needs a way to stop. When the function reaches the end of a linked list (where the pointer is `NULL`), it stops "diving" and starts returning.

#### **B. The Recursive Step (The Dive)**
```c
free_chain(n->next);
```
Before the function frees the current node (the "Parent"), it calls itself on the next node (the "Child"). This creates a stack in the computer's memory. The computer "freezes" the parent and moves to the child. This continues until the very last node in the chain is reached.

#### **C. The Backtrack (The Cleanup)**
```c
free(n);
```
This line is only reached **after** the recursive call to the child has finished and returned. By the time `free(n)` executes for a parent, the computer has already finished freeing all of its children. This prevents "orphaned memory" because we never destroy a node until we are 100% finished with the pointers it contains.

---

### 🧠 Design Justification: Why Recursion?

1.  **Logical Flow**: Since a linked list is a recursive data structure (a node contains a pointer to another node), using recursion is the most mathematically elegant way to traverse it.
2.  **No Temporary Pointers**: Unlike the iterative approach (using `while` loops), the recursive approach doesn't require creating a manual `tmp` pointer. The **System Stack** acts as the temporary storage, remembering the address of the "Parent" while the "Child" is being processed.
3.  **Safety and Scale**: While recursion can sometimes risk a "Stack Overflow" if chains are too long, this program is safe. Because we used a **3-letter hash function** with **17,576 buckets**, our word chains are very short (averaging ~8 nodes). This depth is easily handled by modern computer memory.

### Summary of the "Demolition" Order
If a chain is **[A] -> [B] -> [C] -> NULL**, the function:
1. Dives to **A**, then **B**, then **C**, then **NULL**.
2. Hits **NULL** and returns.
3. Frees **[C]**.
4. Returns to **B** and frees **[B]**.
5. Returns to **A** and frees **[A]**.
6. **Result**: The memory is perfectly clean.
---

# VOILA~!