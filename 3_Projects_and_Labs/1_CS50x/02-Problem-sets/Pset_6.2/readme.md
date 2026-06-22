# Mario
## Problem to Solve
In a file called `mario.py` in a folder called `sentimental-mario-more`, write a program that recreates a half-pyramid using hashes (`#`) for blocks, exactly as you did in Problem Set 1. Your program this time should be written in Python!

## Specification
- To make things more interesting, first prompt the user with `get_int` for the half-pyramid’s height, a positive integer between `1` and `8`, inclusive. (The height of the half-pyramids pictured above happens to be `4`, the width of each half-pyramid `4`, with a gap of size `2` separating them).
- If the user fails to provide a positive integer no greater than `8`, you should re-prompt for the same again.
- Then, generate (with the help of `print` and one or more loops) the desired half-pyramids.
- Take care to align the bottom-left corner of your pyramid with the left-hand edge of your terminal window, and ensure that there are two spaces between the two pyramids, and that there are no additional spaces after the last set of hashes on each row.


*This Python script generates a symmetric, double-sided "pyramid" pattern in the console. The user defines the height of the pyramid, and the script handles input validation to ensure the output remains within a manageable range (1 to 8).*

### 1. Input Validation Module
The script utilizes a `while True` loop to ensure robust input handling.

-   **`while True:`**: Creates an infinite loop that continues to prompt the user until valid input is received.
-   **`try...except ValueError`**: 
    *   **Purpose**: Protects the program from crashing if a user enters non-numeric text (e.g., "abc").
    *   **Behavior**: If `int()` fails to convert the input, the `ValueError` block catches the error, displays a friendly message, and the loop restarts.
-   **Logic Check**: 
    *   The `if 1 <= height <= 8:` statement ensures the pyramid adheres to specific project restrictions.
    *   **`break`**: Once a valid integer between 1 and 8 is provided, the loop terminates, and the program proceeds to the generation phase.

---

### 2. Pyramid Generation Module
The script uses a `for` loop to calculate and print each row of the pyramid based on the user-defined `height`.

-   **Iteration**: `for i in range(height):` 
    *   The variable `i` represents the current row index (starting at 0).
-   **Calculations**:
    *   **`initial_spaces_count`**: Calculated as `height - 1 - i`. This determines how many empty spaces appear before the first set of hashes. As `i` increases, the number of spaces decreases, creating the pyramid slope.
    *   **`Hash_print_count`**: Calculated as `i + 1`. This dictates how many `#` characters appear in each segment, growing as the loop progresses.
-   **String Manipulation**:
    *   Python's string multiplication (`' ' * count`) is used to dynamically construct the spacing and the visual blocks.
    *   **Concatenation**: The components (`Left_spaces`, `hashes`, `second_spaces`, and `hashes`) are joined together using the `+` operator to form the complete string for each row.

---

## Example Output
If the user inputs `3` as the height, the script outputs:

```text
  #  #
 ##  ##
###  ###
```

---

## Variables Glossary

| Variable | Type | Description |
| :--- | :--- | :--- |
| `height` | `int` | The total number of rows requested by the user. |
| `i` | `int` | The current loop iteration index (0 to height-1). |
| `initial_spaces_count` | `int` | Calculated count of leading whitespace. |
| `Left_spaces` | `str` | The actual string of spaces for the current row. |
| `Hash_print_count` | `int` | The number of hash symbols per side. |
| `hashes` | `str` | The actual string of hashes for the current row. |
| `second_spaces` | `str` | The fixed-width gap (2 spaces) between the two hash blocks. |

---
