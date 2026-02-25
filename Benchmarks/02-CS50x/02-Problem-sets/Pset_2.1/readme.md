# pset 2.1 is about a game called scrabble

- all 26 alphabets are given a score { 1, 3, 3, 2, 1, 4, 2, 4, 1, 8, 5, 1, 3, 1, 1, 3, 10, 1, 1, 1, 1, 4, 4, 8, 4, 10 } `NOTE: A ---> Z chronologically`
- 2 players will input some words, and then the scores of the characters of those words will be summed and the player with the higher score count will be declared the winner

# Roadmap

- [x] get user input through
- [x] write pseudo code: `user input`, `inputs thrown inside function`, `function spits out sum`, `compare the 2 word's score` , `use a if statement to declare a winner`
- [x] Figure out the math behind the ASCII codes to designate the scores to the alphabet regardless of their state of upper case or lower case.
- [x] implement the code to get the first character and subsequently get the other characters at hand
- [x] implement the code to sum up the input string's score
- [x] implement the code to return the string score.


# inside outs:

1. Everything else except the ascii code is easy to figure out, we just have to figure out how to put in the POINT[] array values for the chronological alphabets and then calculate the sum

2. Okay, i figure out the math, so, according to ASCII standards, alphabets are serial and starts from numeric values such as `65 for A`, and so `B is 66`, now if i wish to have A the first array value of POINT[], then i need the index for it to be alphabet[0] which is A and this [0] also goes to POINT[0] and assigns the first value to A, SO THE FORMULA IS `SOMETHING minus A` which designates it a position in the index that is serial. like `C=67`, and then `C-A`=`67-65`=`2` , so the position of `C` is `2`. THIS IS true in fact!! 

3. Now we implement this. In the main function that counts the score, we first declare a variable called `score = 0`. Now, this is the sum of the characters of the use input string. Now, we need a loop to give the score to the alphabet. To do this, use a `for loop`, we set the variable `i = 0`. and now, we need to increase it. 

4. the value of `i = 0` will increase as long as there are characters in the word, so the characters end when `null(\0)` in reached, every string of word has a null at the end of it. so we put up the condition , `as long as i is not null, keep going`, which is basically this -----> `word[i] != '\0'`, Now, we can keep increamenting with `i++`.

5. Now, in the the array `POINT[]`, the scores are arranged alphabetically, so , `C` is `3` as apparent. now, in the score_counter function, we have to sum in the point of `C` which is `3`, inside of `score`. 

6. So, we try to figure out the position of C which is 2nd in alhpabetic order(`BECAUSE we are counting A as the 0th`). in ascii, A is 65, and C is 67, so, basically, C is `2` steps ahead, so `67 minus 65 = 2`, so now, we take another variable called `index` and assign it this exact positional value `int index = word[i] - 'A' ` , not index is the position of C. 

7. The value of `C` is 3 as seen in POINT[], and now we need to assign this value to C, `(This is tricky because we are not assigning to directly C)`, rather we are taking the position of `C` and assigning it the value of C in POINT[] array using `POINT[index]`, so now `POINT[2]` gets value `{3}`. In other words, we are using the position of C to solve this problem rather than C itself explicitly.

8. no, we are going to assign `POINT[index]` to another variable called `a` or anything. and then we sum it to score using `score += a`. and this goes go be summed up in score

9. then we return the score to the relevent variables and voila ! program complete!

10. some problems, we need to turn the `lowercases` to `uppercases` too. To do this, we need to use function header file `#include <ctype.h>` and then we can use 2 good functions now
    1.  first one is , `isalpha()`, this validates whether or not a given character is a letter or not. like if someone were to say `cow!`. the characters: `c`, `o`, `w` are letters, but `!` is not a letter and can have unpredictable behaviour. so, we use `if function` and then `isalpha(word[i])`  to find out whether or not a given character is letter. if not, then its false and the if statement is skipped and the loop starts again and goes to the next chracter.
    2.  second one is, `toupper()`, this one turns any lower letter to capital ones. We must do this to `word[i]`, because we only have `uppercase A` to subtract from any user input letter. We dont have `lowercase a`, that will be more complex. So, rather we just turn them into uppercase and get on with it.

11. and thus done!!! voila