# Readability

According to Scholastic, E.B. White’s Charlotte’s Web is between a second- and fourth-grade reading level, and Lois Lowry’s The Giver is between an eighth- and twelfth-grade reading level. What does it mean, though, for a book to be at a particular reading level?

In many cases, a human expert might read a book and make a decision on the grade (i.e., year in school) for which they think the book is most appropriate. But an algorithm could likely figure that out too!

We’ll implement a program that calculates the approximate grade level needed to comprehend some text. The program should print as output “Grade X” where “X” is the grade level computed, rounded to the nearest integer. If the grade level is 16 or higher (equivalent to or greater than a senior undergraduate reading level), The program should output “Grade 16+” instead of giving the exact index number. If the grade level is less than 1, The program should output “Before Grade 1”.

---

# Determining complexity of texts :
*Now*, the question is, what kind of attributes are characteristics of a higher reading level? 
*The answer is* longer words and longer sentences.

One good readability testing formula developed is **Coleman-Liau index**.
The *coleman liau* index of any given text is designed to output **US** grade levels 

---

## The formula:

`index = 0.0588 * L - 0.296 * S - 15.8`

*where L is the average number of letters per 100 words in the text, and S is the average number of sentences per 100 words in the text.*

> This is the real math here, we have to work with strings and fullstops and nulls(\0)
---

# The step map:

- [x] get user input with the following `Text: `.
- [x] Send the user input to 2 functions which are `L calculator` and `S calculator`
- [x] put the value of `L` and `S` inside of `coleman liau` to calculate the index.
- [x] index is grade number, round it to nearest full number.
- [x] If grade = 16 or higher, output `"16+"`. if grade = 1 or lower, output `"Before Grade 1"`. do so using `if else` function.
- [x] Do the `L functions` and return the values to L.
- [x] Do the `S functions` and return the values to S.
- [x] Done

---

# Inside - Outs

1. First issue is, use input , which is a string and easily taken using the cs50x library. the specific is the get_string() function and then giving it to a variable called s which is a string type.

2. now, we shall plug the user input inside of 2 functions and then put them to 2 variables called L and S which are float type , that will calculate the average number of letters per 100 words in the text, and S is the average number of sentences per 100 words in the text respectively and then return the value of both L and S after the value of s is passed and function calculates all.

3. Now, we write up the coleman liau formula with all the variables in it and then give that value to another float variable called index. This one is easy to do. 

4. now, we round up the value of index which is presently a float to the nearest integer. For this, we need the math.h header and then we use the lround function, this take the index and then gives round it to the nearest integer and then we assign it to the variable rounded_index which is a integer type.

5. now we plug this rounded_index inside of the if else_if else function and then print the grade. So, this is a little tricky. Firstly, we have grade 16 and up, which we will print as grade 16+. And then we have normal grades from 1 to 15 , which we will print as normal: grade x. at last, we have grades less than 1 , which we will print as before grade 1. Using these 3 conditions, we can print the outputs without much hassle.

6. Now comes the real issue, we need to make 2 functions, called calculate_L and calculate_S respectively, each will be taking in the s from the main function as string, and then there will be a float of valueL or valueS respectively,. and then we will make the main function inside of it, and at last, we will return valueL. 

7. now, time for the main part, how do we figure out the value of L which is basically the average letter per 100 words in the text. This is a important concept to aborb.
   1. we need the average letter count against all the words of the sentence. like for example `I am a man of no fear`, there are a total of `7` words and the total letter count is `15`. So the average letter per word is `number of letter divided by number of word` which is in this case, `15/7`. now, how do we get the per 100 words? well, we simply multiply with times 100. like `(15/7)*100`. and that is L.
   2. Now, as for the inner mechanism of this: First, we need to declare the 2 variables `letters` & `words`. letters start at `0`, but words start at `1` because `for every two word, there is one space`, and we are going to be using spaces to increase the counter of words, thus this rule.
   3. now, we need to increase the letters count and the words count, so the entire `words[]` is a string and the spaces and alphabets inside of it are counted inside of the indexes of this massive array. Furthermore, the null  `'\0'` exists at the end, not after every words. Therfore, we can make a loop to go through every index of words[], the loop condition is , `i = 0; word[i] !='\0'; i++` so this goes on until the null is found and only then, it stops.
   4. and then inside of the loop, we first target the letter count increment, which is done by first identifying whether or not, an index is an alphabet. we use header `ctype.h` and then we use the identified `isalpha()` we put `words[i]` inside of isalpha like this: `isalpha(words[i])` and then this searches for all the alphabets in the entire string and if the index is an alhpabet, it does `letters++` which increases the letter count by 1.
   5. As for the word count, a word is separated by space. so the word count is set to 1 initially and starts from there as we have discussed before. and now we put another if condition to verify if its an empty space, because, its a word only if there exists an empty space. so the condition is `if (words[i] = ' ')` and then we do `words++` and thus the word is also increased and then the entire formula of average letter count per 100 words is now complete and we get the value of L properly.
   6. another issue to watch out for is that both are separate if conditions. not one single if else_if else condition. so its sorted properly. And another issue would be the float integer dividing, we put in a (float) inside of the division of letters by words, because without that, we would not have the float values if the average is something like `5.4` or `3.56`.

8. Now it is time to figure out S. So S works the exactttt same way
   1. but this time , we need the number of sentences. To get this, we need to know how sentences are defined or even made. so as cs50x told us, `. or ! or ?` are sentence separators, so whenever these appear, we have a sentence. so we use `OR (||)` logical assignment and then we put them in a `if condition` and then increment sentence counter using sentence++ and then we put them in the formula to figure out the average per 100 words and done.
9. done, voila!!! 