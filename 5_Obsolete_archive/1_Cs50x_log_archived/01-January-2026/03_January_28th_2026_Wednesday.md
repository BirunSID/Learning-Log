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