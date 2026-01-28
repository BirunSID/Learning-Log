week 0
week 1 main lecture
week 1 section
week 1 shorts 1 ...
---


# This is a logging of what is being learnt after today (JAN 27th), prior to this, more were learnt but not logged then.
---

# 27th January, Tuesday : 

### **Core Topic:** Operators in C (*used gemini 3 pro to gain more information and formatting suggestions*)

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

**TL;DR:**(Too long,didnt read)
C provides tools to manipulate data via arithmetic (including modulus `%` and shorthand `++`/`+=`) and control flow via logical comparisons (`&&`, `||`), but you must strictly distinguish between setting a value (`=`) and checking a value (`==`).

---
---

# 28th January Wednesday :


### **Topic 1: Conditional Statements**

**Core Concept:** Logic flow and decision making.

**Key Takeaways:**
*   **If / Else If / Else:** Allows the program to take different "forks in the road" based on boolean expressions. Branches are mutually exclusive.
*   **Switch Statement:** Checks a variable against specific **cases** (integer or char).
    *   **Crucial:** You must use `break;` after each case, otherwise the code "falls through" and executes the next case automatically (sometimes useful, usually a bug).
*   **Ternary Operator (`?:`):** A shorthand for simple if-else assignments. `condition ? value_if_true : value_if_false`.

**Syntax:**
```c
// Switch Example
switch (x) {
    case 1: printf("One\n"); break;
    case 2: printf("Two\n"); break;
    default: printf("Other\n"); break;
}

// Ternary Operator
int y = (x > 5) ? 100 : 200; // If x > 5, y is 100, else y is 200
```

**TL;DR:**
Use `if/else` for ranges and boolean logic, `switch` for specific discrete values, and the ternary operator (`?:`) for short, one-line decisions.

***

### **Topic 2: Loops**

**Core Concept:** Repeating code execution.

**Key Takeaways:**
*   **While Loop:** Checks the condition **before** the loop runs. Good when you don't know how many times you need to loop (e.g., game state).
    *   *Note:* `while(true)` creates an infinite loop.
*   **Do-While Loop:** Checks the condition **after** the loop runs. **Guaranteed to run at least once**. Perfect for prompting user input.
*   **For Loop:** Handles initialization, condition, and incrementing in one line. Best when you know exactly how many times to repeat (e.g., iterating 0 to 9).

**Syntax:**
```c
// For Loop (Repeat specific times)
for (int i = 0; i < 10; i++) {
    printf("%i\n", i);
}

// Do-While (Run at least once)
do {
    x = get_int("Enter pos num: ");
} while (x < 0);
```

**TL;DR:**
Use `for` when you know the count, `while` when the count is unknown, and `do-while` when you must execute the code at least once (like input validation).

***

### **Topic 3: Linux Command Line**

**Core Concept:** Navigating the OS without a mouse. (**one day, i should get a custom pc with a good linux os installed and then we can enjoy the full power of command line interfaces**)

**Key Commands:**
*   **`ls`**: List files. (Blue = Directory, Green = Executable, White/Black = File). ( **Not always true but DIY possible.**)
*   **`cd`**: Change Directory.
    *   `cd .` (Current dir), `cd ..` (Parent dir), `cd` (Home/Tilde `~`).
*   **`pwd`**: Present Working Directory (Where am I?).
*   **`mkdir`**: Make Directory (Create folder).
*   **`cp`**: Copy. Usage: `cp source destination`.
    *   Use `cp -r` to copy a **directory** recursively.
*   **`rm`**: Remove (Delete). **Permanent** (No recycle bin).
    *   Use `rm -f` to force (no confirmation).
    *   Use `rm -r` to remove a **directory**.
    *   *Danger Zone:* `rm -rf` deletes folders forcibly without asking.
*   **`mv`**: Move. Also used to **Rename** files.

**Syntax:**
```bash
ls              # See files
cd pset1        # Go into folder
cd ..           # Go back up
cp hello.c hi.c # Copy file
mv hi.c bye.c   # Rename file
rm -rf pset2    # Force delete folder (Careful!)
```

**TL;DR:**
The terminal is faster than a mouse: `ls` to look, `cd` to move, `cp` to copy, `mv` to move/rename, and `rm` to delete (but be careful with `rm -rf`).

***

### **Topic 4: Magic Numbers & Preprocessor**

**Core Concept:** Avoid hardcoding raw numbers into logic. (**Basically , in easy way, just dont let numbers be changed just because of a line in code and then crash the entire code after 500 lines.**)

**Key Takeaways:**
*   **Magic Numbers:** Raw numbers (like `52` or `23`) appearing in code are bad practice. They lack context and are hard to update if the value changes in multiple places.
*   **`#define`:** A preprocessor directive (Macro). It works like a "Find and Replace" tool *before* the code compiles.
*   **Safety:** You cannot accidentally change a defined constant (e.g., `52++` is impossible), whereas a variable holding 52 could be accidentally changed.
*   **Convention:** Always use **ALL CAPS** for constants to distinguish them from variables.

**Syntax:**
```c
// BAD:
for (int i = 0; i < 52; i++) { ... } // What is 52?

// GOOD:
#define DECK_SIZE 52  // No semicolon at the end! & define it before the main()

for (int i = 0; i < DECK_SIZE; i++) { ... }
```

**TL;DR:**
Never write raw numbers in your logic; use `#define NAME VALUE` to give them symbolic meaning and make your code easier to read and update.

---
---

# 29th January , Thursday :
