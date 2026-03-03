# Substitution

So, this is a cipher called substitution and in this sort of cipher, what we do is: we take a plain text and then we transform it in a patternized cipher text, or implement encryption that IS NOT as simple as ceasarian but rather more sophisticated and uses a user input key to do the encryption.

There are 26 letters in the english alphabet, from A to Z. In case of substitution cipher, we randomize the order of all letters to encrypt the user input plain text.

For example, the following is a random 26 letter key , `NQXPOMAFTRHLZGECYJIUWSKDVB`, as you can see, this is not the standard serial alphabet order but rather a complete random sequence of alphabets that starts with N and ends with B, NOTE THAT THE LETTER A OR ANY OTHER LETTER DOES NOT COME UP TWICE HERE, THIS IS JUST THE USER PROVIDED PATTERN FOR THE ORDER OF THE ALPHABET.

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

1. First, we need to make sure to write `main(int argc, string argv[])`, so we can collect the user key and directly run the code itself. And then we have to take the user input 

2.

