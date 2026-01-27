week 0
week 1 main lecture
week 1 section
week 1 shorts 1 ...
---


# This is a logging of what is being learnt after today (JAN 27th), prior to this, more were learnt but not logged then.
---

# 27th January : 

### **Core Topic:** Operators in C

**Key Takeaways:**
*   **Arithmetic:** Standard math uses `+`, `-`, `*`, `/`. The **Modulus operator** (`%`) returns the remainder of division (useful for finding even/odd numbers or limiting random number ranges , tbh, this went over my head cause it was too advanced).
*   **Shorthand Syntax:** C allows short ways to update variables:
    *   `x *= 5` is the same as `x = x * 5`. (extremely useful for shortening stuffs!!)
    *   `x++` and `x--` increment or decrement a variable by exactly 1.
*   **Boolean Truth:** In C, **0 is False**, and **any non-zero value is True**. (I still prefer using `true` or `false`)
*   **Logical Operators:** Used to combine boolean conditions:
    *   `&&` (AND): True only if *both* sides are true.
    *   `||` (OR): True if *at least one* side is true.
    *   `!` (NOT): Inverts the value (True becomes False).
*   **The "Big Mistake":** Never confuse **Assignment** (`=`) with **Equality** (`==`). Using `=` inside an `if` statement is a common bug.(tbh, no one makes these kinds of mistakes easily)

**Syntax & Examples:**
```c
int x = 11;
int y = 0;

// Shorthand Arithmetic
x += 1;       // x is now 12 (same as x++)
int rem = x % 5;  // rem is 2 (12 divided by 5 leaves remainder 2)

// Logical & Relational
// Checks if x is not equal to 5 AND y is less than 10
if (x != 5 && y < 10) {
    // This block executes
}

// CRITICAL DIFFERENCE
if (x == 10) { /* Checks if x is 10 */ }
if (x = 10)  { /* ERROR/BUG: Sets x to 10, evaluating as TRUE */ }[it literally assings 10 to x]
```

**TL;DR:**
C provides tools to manipulate data via arithmetic (including modulus `%` and shorthand `++`/`+=`) and control flow via logical comparisons (`&&`, `||`), but you must strictly distinguish between setting a value (`=`) and checking a value (`==`).

# 28th January :





