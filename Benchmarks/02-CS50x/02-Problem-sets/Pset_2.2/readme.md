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

- [ ] get user input with the following `Text: `.
- [ ] Send the user input to 2 functions which are `L calculator` and `S calculator`
- [ ] put the value of `L` and `S` inside of `coleman liau` to calculate the index.
- [ ] index is grade number, round it to nearest full number.
- [ ] If grade = 16 or higher, output `"16+"`. if grade = 1 or lower, output `"Before Grade 1"`. do so using `if else` function.
- [ ] Do the `L functions` and return the values to L.
- [ ] Do the `S functions` and return the values to S.
- [ ] Done

---

# Inside - Outs

1. 