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
