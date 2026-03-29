# This is the log of my cs50x journey in short.
---

# 20th January, 2026, Tuesday (Day 1)
C is easy. I'm using Chrome for cs50.dev because Opera is unsupported. The Chrome setup was fairly easy, though.  
.  
.  
.  
---
---

# 21st January, 2026, Wednesday
C is good. Conditions are good—sexy, even—and easy to understand, thanks to Sarwar Sir prior to this. He is the main reason why C is so easy for me now.  
.  
.  
.  
---
---
# 22nd January, 2026, Thursday
Learned some logical comparators and conditions. Especially the loop where `i` is an *n*th number, `i` is greater than 0, and `i` decreases by one. That’s all for today.  
.  
.  
.  
---
---

# 23rd January, 2026, Friday
*Rest Day*  
.  
.  
.  
---
---
# 24th January, 2026, Saturday
Done with the main lectures on C and got a glimpse of Mario pyramid making. Now moving onto Sections.  
.  
.  
.  
---
---
# 25th January, 2026, Sunday
Yeah, Section was done. It was the same thing all over again, but not an issue here. Done and now moving onto Shorts.  
.  
.  
.  
---
---

# 26th January, 2026, Monday
It was just data types. No need to memorize anything; just have to make sure to put the correct placeholders for the data types.  
.  
.  
.  

---
---

> **Note:** Log from 27th January will undergo radical changes, with more advanced logging methods applied.
---

# 27th January, Tuesday : 

**C Operators & Logic Deep Dive**
1. **Arithmetic:** Mastered `+`, `-`, `*`, `/`, and `%` (Modulus) for remainders and parity.
2. **Shorthand:** Used `x += n`, `x *= n`, `x++`, and `x--` to update variables efficiently.
3. **Boolean Truth:** C treats `0` as False and any non-zero as True; utilized `&&`, `||`, and `!`.
4. **The Pitfall:** Differentiated `=` (assignment/sets value) from `==` (equality/checks value).
5. **Implementation:** Applied these operators to refine control flow and conditional logic.  
.  
.  
.  
---
---

# 28th January Wednesday :

### **Control Flow, Iteration, and CLI Foundations**

*   **Conditional Logic:** 
    *   Used `if/else` for boolean branching and `switch` statements for discrete value mapping (always including `break` to prevent fall-through). 
    *   Implemented **Ternary Operators** (`condition ? true : false`) for concise variable assignments.
*   **Iteration (Loops):**
    *   `for`: Preferred for a known number of iterations.
    *   `while`: Used when the count is unknown (e.g., game loops).
    *   `do-while`: Guaranteed at least one execution; ideal for user-input validation.
*   **Linux Command Line:** 
    *   Navigation & Management: `ls` (list), `cd` (change directory), `pwd` (print working directory), and `mkdir` (create folder).
    *   File Operations: `cp` (copy), `mv` (move/rename), and `rm` (remove). 
    *   *Key Flags:* Used `-r` for recursive directory actions and `-f` to force operations. Note: `rm -rf` is powerful and permanent.
*   **Code Quality & Preprocessor:** 
    *   Eliminated **"Magic Numbers"** to prevent hardcoding errors. 
    *   Used `#define` macros in **ALL_CAPS** to create immutable, readable constants before compilation, improving long-term maintainability.

---

### **Quick Syntax Reference**
```c
// Ternary & Switch
int y = (x > 5) ? 100 : 200;
switch(n) { case 1: /* code */ break; default: /* code */ }

// The Preprocessor
#define LIMIT 50 // Replaces Magic Numbers

// CLI Management
cp -r folder_a folder_b  // Recursive copy
rm -rf old_directory     // Force delete directory
```

# 29th January , Thursday :

### started pset1.1 : mario.c , need to create a program that can simulate a mario double triangle using #'s and also within the range of 1 to 8{including 1 and 8 too}.
***output should be like this :***
```bash
   #  #
  ##  ##
 ###  ###
####  ####
```

```C
//
#include <cs50.h>
#include <stdio.h>
void brk(int h);
//
int main(void)
{
    //
     int h=0;
     do
     {
         h=get_int("Height: ");
     }
     while(h<=0 || h>8);
     //
     //
    for (int i=0; i<h ;i++)
    {
         int k=h-i-1;
        for(int e=k;e>0;e--)
        {
         printf(" ");
        }
       brk(i);
    }
    //
}
//
void brk(int h)
{
    for(int i=0; i<=h ;i++)
    {
        printf("#");
    }
    printf("\n");
}
//
```

***this one outputs : ***
```bash
    # 
   ##
  ### 
 ####
#####
```

---
---
