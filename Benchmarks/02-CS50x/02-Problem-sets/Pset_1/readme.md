# Problem Set 1: Mario (More Comfortable)

### **Project Overview**

This project recreates the double-sided pyramids from Super Mario Bros. The program prompts the user for a height and renders a symmetric structure using `#` characters, separated by a consistent two-space gap. (The problem didnt mention this 2 space gap , i had to figure it out)

---



### 🛠️ Local Compilation Guide

If you are running these programs on a local machine (not the CS50 Sandbox), you will encounter a "Linker Error" if you try to run the code normally. This is because the programs depend on the `cs50.c` library located in the parent directory. This surely is a hassle. Here's the solution below.

#### **The Command**
To compile properly, you must manually link both your source code and the library source:
```bash
gcc mario.c ../cs50.c -o mario
```
#### **Why is this necessary?**
When you use `#include "cs50.h"`, you are only telling the compiler what the functions *look like*. You are not giving it the actual **code** inside those functions. By adding `../cs50.c` to the command, you are handing the compiler the actual "toolset" it needs to build the final exe file that we can run.

#### **Command Breakdown:**
*   **`gcc`**: The compiler used to turn C code into an exe.
*   **`mario.c`**: Your main source code file.
*   **`../cs50.c`**: Tells the compiler to look one folder up to find the implementation of the CS50 functions (like `get_int`).
*   **`-o mario`**: Tells the compiler to **Output** the result as a file named "mario".

#### **How to Run**
Once compiled, run the program directly from your terminal:
```powershell
./mario
```
---



### **Current Progress & Logic**

so, we have done the following so far:

*   **Input Validation:** A `do-while` loop ensures the program only accepts integers between 1 and 8 (inclusive).
*   **Vertical Rendering:** An outer `for` loop manages the row count based on the user's height input. AND MUST KEEP it in mind! The first row with one hash on both sides is not considered row=1st , its row=0th. like not the 1st row, but the 0th row. that made things easier.
*   **Whitespace Calculation:** An inner loop manages the leading spaces using the formula `height - row - 1` to create the right-aligned slope for the first pyramid.
*   **Function and prototyping:** The hash-printing logic is offloaded to a helper function `brk()`, which currently prints the character sequence and handles the line break. And the prototype is put over the main() function.
```powershell
    #
   ##
  ###
 ####
```

Now we have done the following:  
* In the brk function we put 2 whitespace printer using ("  ") inside of printf. This is putting 2 spaces inside after the leftern pyramids last hashes as we find the pattern from the problem we are supposed to solve.  
* Then we insert the same has generator as the former brk() function. it creates the same amount of hash as the left side. It also accounts for the value of i which was incremented to the derived value from the first for() loop. it basically turns that i into 0 simply and also the p that comes from the first for() loop is untouched, so no need for any tweaks there.
```powershell
    #  #
   ##  ##
  ###  ###
 ####  ####
```

---
### **Current Status**
*   [x] User input validation (1-8).
*   [x] Calculation of leading whitespaces.
*   [x] Rendering of the first (right-aligned) pyramid.
*   [x] Implementation of the middle 2-space gap.
*   [x] Mirroring the second (left-aligned) pyramid.

### **Execution Example**
The program currently outputs the first half of the structure:
```bash
Height: 4
   #
  ##
 ###
####
```

~~### **Next Objectives**~~

~~The immediate focus is to modify the `brk()` function to allow for the gap and the second pyramid to be printed on the same line before the newline character is triggered.~~

### **updated objective**

done, we have went to this 
The program currently outputs the first half of the structure:
```bash
Height: 4
   #  #
  ##  ##
 ###  ###
####  ####
```

Voila, we are done.