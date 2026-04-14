# Substitution

So, this is a cipher called substitution and in this sort of cipher, what we do is: we take a plain text and then we transform it in a patternized cipher text, or implement encryption that IS NOT as simple as ceasarian but rather more sophisticated and uses a user input key to do the encryption.

There are 26 letters in the english alphabet, from A to Z. In case of substitution cipher, we randomize the order of all letters to encrypt the user input plain text.

For example, the following is a random 26 letter key, `NQXPOMAFTRHLZGECYJIUWSKDVB`, as you can see, this is not the standard serial alphabet order but rather a complete random sequence of alphabets that starts with N and ends with B, NOTE THAT THE LETTER A OR ANY OTHER LETTER DOES NOT COME UP TWICE HERE, THIS IS JUST THE USER PROVIDED PATTERN FOR THE ORDER OF THE ALPHABET.

After inputting this key, if a user were to input `Hello`, it will be encrypted to `Folle` as the order of H is designated as F and so on.

---

# Checkmarks :

- [ ] program must take user input in a single command line and must be case-sensitive. UPPER and LOWER case must not affect the program. So, usage of `main(int argc, string argv[])` will be used
- [ ] If user inputs something that is multiple CLA, the program shall print output message of value `1`. 
- [ ] if the user does not put the alphabets or types something else and puts one alphabet multiple times or so, then it shall print value of `1`
- [ ] The program must output `plaintext:` (without a newline) and then prompt the user for a string of plaintext (using get_string).
- [ ] Then, the output shall be `ciphertext:` (without a new line). and with every single letter in the plaintext substituted for the `key`'s order of alphabet and any other non alphabet unchanged.
- [ ] The program must preserve case: capitalized letters must remain capitalized letters; lowercase letters must remain lowercase letters.
- [ ] After outputting ciphertext, The program should print a newline. the program should then exit by returning 0 from main.

---

# inside-outs :
0. First, we declare all the psuedocodes.

1. First, we need to make sure to write `main(int argc, string argv[])`, so we can collect the user key and directly run the code itself. And then we have to take the user input when executing it.

2. For the user input to be valid, there has to be 2 arguments, i mean the value of `argc should be 2`. but if it is less than 1 or more than one, im given the choice to print an `error message` of my own and `return 1` from main().  BUT HOWEVER, this isnt the only way that the user input can be invalid:
   1. length: the string length should be 26 or return 1 and print error message.
   2. character type should only be alphabetic and not anything else, otherwise return 1 and print error message.
   3. if a letter typed more than once, then it will return 1 and print error message.
   4. argument check which we details before this list.

3. First we use the argument check. The main string count is `argc` as it contains the user input and the command too and so, there are the value of argc must be 2. for example, `./substitution ABCDEFGHIJKLMNOPQRSTUVWXYZ`, it has the command and the key. the key is the 2nd argument and the command is the first argument. and so, we are going to check whether or not the argument count is 2. for that we simply just put it in `if()` and then inside of the condition, we put in `argc != 2`, this says `if the argument count is not 2, then do this` and then we simply printf the error message and `return 1`. DONE

4. Now for the length count, we are going to be using `argv[]` where the argument itself is stored. We now pass on this array to another array named `user_key` and this acts as a pointer to the original array and then we put it in a if argument and check for `strlen()` and inside of it, we put `user_key` that points to the original array and now, it points to the argv and it will check for the string length and to print error if string length isnt 26, we simply put up `!=` after `strlen()` and thus it sees if or not the strlen value is 26 and if not, then prints error and returns 1.

5. As for validating whether or not the characters are alphabetical, we put it up in a for loop going on till the end of the string where the null is. Afterwards we put up a `if()` which now uses the condition `!isalpha()` to find if this is not an alphabet and if it is not, then error message and returns 1. Notice the `!` here which is placed before `isalpha()`.

6. For the last validation type which checks for duplicates. This gets a little complicated. Heres the approach that i have figured out. So, the ascii character values are the same. so if one ascii value exists twice in the key, then it should spit out error. So, what we shall do is, we take one character and we compare its ascii values with all the chracters after it. for example, we take `a`, we take this and then we put it up against the ascii of everything that comes after it, such as b, c, d, etc. and this has to be true for upper and lower case all, so what im going to do is not do this hassle twice and just convert everything to uppercase inside of the loop to validate it and watch out for error. So, this process requires nested for loops
   1. So, first step is to set up the loop that will take the character one by one, we will achieve this with `for (int i = 0; i < 26; i++)`,
   2. 2nd step is to, take the characters and then we turn them into uppercase letters. `char temporary = toupper(user_key[i]);`
   3. and then we create another loop and then we put up `for (int f = i + 1; f < 26; f++)` and then it keeps looping and then starts checking from the next character onwards.
   4. then inside of this new loop,we put up the if condition and start comparing like so: `if(temporary == toupper(user_key[f]))` and then we print the error messages and done.

7. Now we get the user input for the plaintext that is to be provided. we use get_string and it is done easily.

8. Now, its time for the substitution part. we are going to substitute the letter of the plaintext according to the order of the key
   1. so, first of all, we have to deal with this character by character, we so have to find out the index of the character in the alphabet sequence and then we can exchange the alphabet in the plain text for the one in the key and repeat this to gradually cipher the entire plain text and then print it at the end. 
   2. So, how ? first we have to understand what we can possibly have. we can have upper cases and lower case and also special characters such as spaces or ! or ? or . or , and all sorts of stuffs. So, 3 cases that i have to deal with.
   3. First case, uppercase. we first set up a loop that goes on till the plain text ends. and then inside the loop, we set up our first case which is uppercase validation and swap. In this scenario, we have to first do an `if()` and inside we ask `isupper()` which means, is it upper case. and inside the brackets, we put in `plain_text[i]` and it checks whether or not the plain_text is uppercase, and if it is, then
      1. we now designate a numeric integer value for the position of the character in the alphabet circle by subtracting 'A'. this is `index_position[]`
      2. now , we swap plaintext character position by equating `toupper(user_key[index_position])`, basically we take the position of the character from user input and then we find that same position in the key and then we turn them into uppercase and then we swap them with the key. Afterwards, we print the character and done.
      3. we do the same for the lowercase 
      4. As for the special cases. we do nothing, we print them as they are. done. 

9. and at the end, we print a line break `\n` and done.
