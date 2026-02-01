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

# problem solving log:
lets look at the informations and find mathematical logics that we can solve using the information at hand.  
***Credit cards:***
- *American express* : 15 digits . start with 34 or 37 .
- *master card*: 16 digits , starts with 51,52,53,54,55 .
- *Visa*: 13 or 16 digits , starts with 4 .

> [!warning] There is a checksum here . now what is a checksum? its basically check sum , checking the sum of the entire number in weird ways.

### Checksum math:
1. we multiply every `other` digit by 2 . (starting with second place and ending witht the one that comes at last skipping one everytime, like `1234`, we start with `2` and then `4` and then done, and if its `12345`, then `2` , then `4` and then done.)
2. 
<a id="Documented_till_here_day_1"></a>