# problem set 2:  
  
> A credit card is a huge digit based numeric sequence that follows certain sets of rules to be validated and properly patternized to eliminate chances of fraud. The method to make this encrypted set of digits uses `Luhn's algorithm`. 

We must create a program in `C` that validates or invalidates user given number and tags them as `AMEX` or `MASTERCARD` or `VISA` or `INVALID`(**this is any other number that isnt the former 3**) 

## A few things to keep in mind : 
- The main source code which is `credit.c` shall be inside of the folder called `credit`. 
- The user input will be just numeric . Which means that <mark>NO HYPHENS (-)</mark> or <mark>NO strings</mark> or <mark>NO special characters</mark> . Just pure numeric input validation.  
  It goes like this:
    ```powershell
    $ ./credit
    Number: 4003-6000-0000-0014
    Number: foo
    Number: 4003600000000014
    VISA
    ```
- The use of `get_long` to get user input which will auto elminate hyphens or such.
- The output should be like  
    ```powershell
    $ ./credit
    Number: 4003600000000014
    VISA
    ```
- And the invalid number input will be handled this way
    ```powershell
    $ ./credit
    Number: 6176292929
    INVALID
    ```
---

# Local compilation guide: 
> See [here](../Pset_1/readme.md#Local_compilation_guide) for detailed info on this.

# how to compile to exe with terminal
> use this command ```gcc credit.c ../../cs50.c -o credi``` to compile it to exe. and then ```./credit``` to execute.

# what to do after the code is done :

*run this command to get all smiley faces*  
```bash
check50 cs50/problems/2026/x/credit
```
if no smiley faces, then do the problem again and take insight from the saddy faces.
if all smiley faces, then do the command below:
```bash
style50 credit.c
```
then do the command below :
```bash
submit50 cs50/problems/2026/x/credit
```

# check mark progress
- [x] Take info on what cards to validate and card length and what algorithm to validate the cards.
- [x] take info on what method is used to validate the card.
- [x] checksum is used to validate, figure out how to use checksum validation and implement it.
- [x] figure out how to do the math issue and solve the summing.
- [x] prompt for input.
- [x] Do the programming of the checksum validation.
- [x] credit card length figure out math and programme
- [ ] credit card length validation.
- [ ] credit card starting digit validation.
- [ ] print output programming. (AMEX, VISA, MASTERCARD, INVALID)




---
# problem solving log:
lets look at the informations and find mathematical logics that we can solve using the information at hand.  
***Credit cards:***
- *American express(AMEX)* : 15 digits . start with 34 or 37 .
- *master-card*: 16 digits , starts with 51,52,53,54,55 .
- *Visa*: 13 or 16 digits , starts with 4 .

> [!warning] There is a checksum here . now what is a checksum? its basically check sum , checking the sum of the entire number in weird ways.

### Checksum math: ***Very important***
1. we multiply every `other` digit by 2 and we get the product from every digits multiplication. (starting with second placed last digit and ending with the one in first . skipping one everytime, like `1234`, we start with `3` and then `1` and then done, and if its `12345`, then `4` , then `2` and then done.)
<a id="Documented_till_here_day_1"></a>
2. Now the digit of the products are to be summed up (even if the multiplication product is `12` ,we dont add 12 in the sum, we add `1` & `2` and sum them)
3. and now this sum that we get from the sums of the digits that were multiplied by 2 ```SHALL BE ADDED``` with the sum of the digits that werent multiplied.
4. now, the final number that we get must have a zero on the last digit to be `valid`, otherwise, `invalid`

here is what how it will go:
- take user input
- checksum validation
- AMEX , VISA, MASTERCARD OR INVALID TAGGING as output.

# solving core issues(the development log)
1. how to get the digits? - divide by 10 and we get the righternmost digit as a remainder. AND also we get all the remaining digits of the main number as the product of the division ,  `excluding` the one we got as remainder.  
Now if we take the number that we got as product and divide it again by 10, we can get the last 2nd digit from the original main user input number (aka the 1st product's righternmost last) as remainder and then again another product `exlcuding` the 1st product's last righternmost digit which has been taken as the remainder. <a id="pset2_day_2"></a>
2. now as an example, `123456` , we wish to take 2nd last digit `5` and then `3` and then `1` and then sum them. The best way is to use `(number)/10` or `(number)%10` functions to take the digits and do whatever we wish with them. 
    - Now , we first try to understand how digit taking works, if we divide by `10` which is `(number?10`, then we get the product which is `12345`, but this isnt what we want. we want `6` and then `5` and so on, so we do a remainder division `(number)%10` which now gives us the remainder `6` , and then we put it up for sum using sum as a variable and then setting it up in a loop. then we put the product which we get by eliminating the already used `6`, how do we eliminate `6` ? We simply use the `/10` , meaning we divide by `10` to get the product which is `12345` , and then we put it back in with the `%10` and keep repeating the process to sum up every digit.
    - So. then how do we selectively just sum up the 2nd last digit and then skip one and then move onto the other one from right to left. It's simple, we , first slash the last digit off. remainder operation (`%10`) can extract the last digit, but to get the 2nd last digit, we need to cut off the last digit to make the 2nd last digit, the last digit. to do that , we use the division operator `/10` which kills of the last digit, and then we use the remainder operation on it to extract the 2nd last digit succesfully. And then to make it go from right to left skipping one and moving onto the 4th last digit (which is basically just skipping one after the 2nd last and going to the next), we simply slash off both the previously slashed digit and the remainder. Then we put it up in a loop which will by default go from right to left. And then give up the sum. 
3. But this isn't how we are supposed to solve it, we are to take the 2nd last & then ***multiply it with `2`*** and skip the next and go to the next and then again multiply by `2` then sum them up. how? look below.  
        - First we slash out the last digit as before.
        - then we take the 2nd last digit and multiply by 2 as planned
        - then, in order for us to find out the sum of the number of the digit AFTER it was multiplied by 2, We use the same digit summer function, but this time ,we will sum up all the digits, we will get number with 2 digits only. so we sum it up and then loop as usual, this is easy, then we slash of the used digit(remainder) from the main function . so that we can skip the next one and then go on. 
  4. so that was it for the summing up even the products of the 2 digits, as planned
  5. now, we need to take the sum of the last and then skip the 2nd last and then go on, this one is simple, we simply use another variable to take the last digit and then we use the same sum function to sum them up and then we use the division operation and then we slash off the the last digit and do the rest as before and continue with the 2nd last digit.
  6. Now how do we get the card lenght? simple, we try to calculate the card lenght using `+1` addition. we take a variable whose initial value is zero(0). so the lets say , `12345` , there are 5 digits here., and so the length is `5 digits`. now how do we figure it using pure c programming. simple, we just take the number , and then assign it a new variable, called `d`,. then we use a while(){} function, we say as long as `d>0` (d is greater than zero in value), do this `take card_length variable which was zero and increase it by 1 everytime the loop happens` . so we are using a loop to increase a variable's number by 1 to figure out the length of the card. then after this, we slash off a digit, `12345` goes in, and card_length is increased by 1 and then we use `/10` to slash off `"5"` from `12345` , and then loop `1234` . then again it goes and card_length increases by 1 and now its at 2 , and then 123 ,then 3 digit,. then 12 , then 4 digit, then 1 then 5 digit, then 0 , thus break!!/
