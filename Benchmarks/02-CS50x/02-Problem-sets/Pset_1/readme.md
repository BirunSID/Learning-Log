# Problem Set 1: Mario (More Comfortable)

### **Project Overview**
This project recreates the double-sided pyramids from Super Mario Bros. The program prompts the user for a height and renders a symmetric structure using `#` characters, separated by a consistent two-space gap.

### **Current Progress & Logic**
As of the latest update, the following logic has been implemented:

*   **Input Validation:** A `do-while` loop ensures the program only accepts integers between 1 and 8 (inclusive).
*   **Vertical Rendering:** An outer `for` loop manages the row count based on the user's height input.
*   **Whitespace Calculation:** An inner loop manages the leading spaces using the formula `height - row - 1` to create the right-aligned slope for the first pyramid.
*   **Modular Abstraction:** The hash-printing logic is offloaded to a helper function `brk()`, which currently prints the character sequence and handles the line break.

### **Current Status**
*   [x] User input validation (1-8).
*   [x] Calculation of leading whitespaces.
*   [x] Rendering of the first (right-aligned) pyramid.
*   [ ] Implementation of the middle 2-space gap.
*   [ ] Mirroring the second (left-aligned) pyramid.

### **Execution Example**
The program currently outputs the first half of the structure:
```bash
Height: 4
   #
  ##
 ###
####
```

### **Next Objectives**
The immediate focus is to modify the `brk()` function to allow for the gap and the second pyramid to be printed on the same line before the newline character is triggered.