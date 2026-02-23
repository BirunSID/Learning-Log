# pset 2.1 is about a game called scrabble

- all 26 alphabets are given a score { 1, 3, 3, 2, 1, 4, 2, 4, 1, 8, 5, 1, 3, 1, 1, 3, 10, 1, 1, 1, 1, 4, 4, 8, 4, 10 } `NOTE: A ---> Z chronologically`
- 2 players will input some words, and then the scores of the characters of those words will be summed and the player with the higher score count will be declared the winner

# Roadmap

- [x] get user input through
- [x] write pseudo code: `user input`, `inputs thrown inside function`, `function spits out sum`, `compare the 2 word's score` , `use a if statement to declare a winner`
- [x] Figure out the math behind the ASCII codes to designate the scores to the alphabet regardless of their state of upper case or lower case.
- [ ] implement the code to get the first character and subsequently get the other characters at hand
- [ ] implement the code to sum up the input string's score
- [ ] implement the code to return the string score.


# inside outs:

1. everything else except the ascii code is easy to figure out, we just have to figure out how to put in the POINT[] array values for the chronological alphabets and then calculate the sum
2. OKay, i figure out the math, so, according to ASCII standards, alphabets are serial and starts from numeric values such as `65 for A`, and so `B is 66`, now if i wish to have A the first array value of POINT[], then i need the index for it to be alphabet[0] which is A and this [0] also goes to POINT[0] and assigns the first value to A, SO THE FORMULA IS `SOMETHING minus A` which designates it a position in the index that is serial. like `C=67`, and then `C-A`=`67-65`=`2` , so the position of `C` is `2`. THIS IS true in fact!! 
3. now we implement this 