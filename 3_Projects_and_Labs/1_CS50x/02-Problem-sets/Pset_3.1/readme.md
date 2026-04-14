# sort

In this problem set, we will have to write up some answeres in the answer.txt and then submit it.

So, from week 3's lecture, we can come to the conclusion that we need to identify 3 algorithms such as selection sort, merge sort and bubble sort. 

**Selection sort** iterates through the unsorted portions of a list, selecting the smallest element each time and moving it to its correct location.
**Bubble sort** compares pairs of adjacent values one at a time and swaps them if they are in the incorrect order. This continues until the list is sorted.
**Merge sort** recursively divides the list into two repeatedly and then merges the smaller lists back into a larger one in the correct order.

# Distribution Code

For this problem, you’ll need some “distribution code”—that is, code written by CS50’s staff. Provided to you are three already-compiled C programs, sort1, sort2, and sort3, as well as several .txt files for input and another file, answers.txt, in which to write your answers. Each of sort1, sort2, and sort3 implements a different sorting algorithm: selection sort, bubble sort, or merge sort (though not necessarily in that order!). Your task is to determine which sorting algorithm is used by each file. Start by downloading these files.

# ins and outs :

So from the programmes and running them with the command `time ./sortx file.txt`, we gathered the following data. and now we have to conclude from these datas, what is which.

i gathered the data, ill provide it using the below architecture
`programme| randomruntime| sortedruntime| reverseruntime`

here is the data :  
sort1| 075| 036| 084  
sort2| 043| 034| 041  
sort3| 055| 050| 051  

this was gathered using the version of ...5000.txt. i ignored the others because i dont need that much data.

so the result i dervied is

sort3 is selection sort
sort1 is bubble sort
sort2 is merge sort

# Answer: 

sort1 uses: Bubble Sort

How do you know?: Slow on random input, slowest on reversed input, and a bit faster on already sorted input. This matches Bubble Sort’s behavior (O(n²) worst case, faster if nearly sorted).

sort2 uses: Merge Sort

How do you know?: Consistently fast across all inputs compared to the other two programs. Merge Sort’s O(n log n) complexity explains the stable runtimes.

sort3 uses: Selection Sort

How do you know?: Runtime is consistently slower than Merge Sort but not as sensitive as Bubble Sort to already sorted input. Selection Sort is always O(n²), which fits the observed pattern.

---

# some prerequisites: 

There is a need for some extra annoying steps to do this in local machine. The programmes are not obviously windows exe files and thus we need to bring in linux in our pc through linux sub system

how do we do that? 
we execute the command `wsl --install` to get linux in our windows system and then we open ubuntu.

Now this step is a little bit of a pain in the ass because we need to modify the file path and make them similar to how a linux system views file paths which is not with backward but rather with forward slashes and then we need to turn `c:\` into `mnt/c/...` and then turn all the slashes into forward slashes and then we can get in any directory we want and then we can do the code execution. 

VOILA~~~!

