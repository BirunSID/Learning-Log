# Sentimental Readability: Python vs. C Documentation

## Problem to Solve
Write, in a file called `readability.py` in a folder called `sentimental-readability`, a program that first asks the user to type in some text, and then outputs the grade level for the text, according to the Coleman-Liau formula, exactly as you did in Problem Set 2, except that your program this time should be written in Python.

---

## Architecture & Structural Breakdown

In C, you had to follow a strict structure: declaring function prototypes at the very top, writing your `int main(void)` function, and then defining your helper functions underneath. 

Python follows a similar modular flow, but achieves it differently.

### 1. Code Flow & Execution Guard
* **The Pythonic Way:**
  ```python
  if __name__ == "__main__":
      coleman()
  ```
* **The C Counterpart:**
  ```c
  int main(void) {
      // code runs here
  }
  ```
* **The Logic Shift:** 
  C programs require `int main(void)` as the hardcoded starting point. Python does not have a mandatory entry function. Instead, the Python interpreter executes code starting from the top of the file. To mimic C's clean structure, we wrap our main logic inside a `coleman()` function and trigger it at the very bottom using the `if __name__ == "__main__"` block. This ensures our helper functions (`get_L` and `get_S`) are fully parsed and memorized before we trigger the main execution.

### 2. User Input
* **The Pythonic Way:**
  ```python
  user_input = input("text: ")
  ```
* **The C Counterpart:**
  ```c
  string user_input = get_string("text: ");
  ```
* **The Logic Shift:** 
  In C, you had to import the custom CS50 library to use `get_string()`. In Python, `input()` is built directly into the language. It pauses the program, grabs whatever the user types, and automatically stores it as a string—no external libraries or typecasting required.

---

## Function-by-Function Comparison

### `get_L(text)`: Calculating Letters per 100 Words

This function calculates the average number of letters per 100 words ($L$).

#### Part A: Counting Words
* **The Pythonic Way:**
  ```python
  word_list = text.split()
  words = len(word_list)
  ```
* **The C Counterpart:**
  ```c
  int words = 1;
  for (int i = 0, n = strlen(text); i < n; i++) {
      if (text[i] == ' ') {
          words++;
      }
  }
  ```
* **The Logic Shift:** 
  In C, counting words meant manually scanning for space characters (`' '`). This required tracking index variables and was prone to bugs if the user typed double spaces. 
  In Python, the `.split()` method automatically splits a string into a list of words, naturally ignoring duplicate spaces or trailing whitespace. We then use `len()` to get the total number of items in that list. It is much safer and requires fewer lines of code.

#### Part B: Counting Letters
* **The Pythonic Way:**
  ```python
  letters = 0
  for char in text:
      if char.isalpha():
          letters += 1
  ```
* **The C Counterpart:**
  ```c
  int letters = 0;
  for (int i = 0, n = strlen(text); i < n; i++) {
      if (isalpha(text[i])) {
          letters++;
      }
  }
  ```
* **The Logic Shift:** 
  In C, a string is a `char` array, requiring you to iterate using an index variable `i` up to the string's length (`strlen`), manually checking `text[i]`. 
  In Python, strings are iterable objects. `for char in text` directly extracts each character one by one. You do not need to manage array indices or watch out for the null terminator (`\0`).

---

### `get_S(text)`: Calculating Sentences per 100 Words

This function calculates the average number of sentences per 100 words ($S$).

#### The Punctuation Check
* **The Pythonic Way:**
  ```python
  for char in text:
      if char in ".?!":
          sentence_counter += 1
  ```
* **The C Counterpart:**
  ```c
  for (int i = 0, n = strlen(text); i < n; i++) {
      if (text[i] == '.' || text[i] == '?' || text[i] == '!') {
          sentence_counter++;
      }
  }
  ```
* **The Logic Shift:** 
  In C, checking for multiple possible characters required linking several logical OR (`||`) operators together. 
  Python uses the **`in`** membership keyword. Writing `char in ".?!"` performs a quick substring search. It checks if the character currently in hand matches any of the characters inside the string `".?!"`. This keeps your conditional statements incredibly short and readable.

---

### Rounding and Formatting the Output

Once $L$ and $S$ are returned to the main `coleman()` function, we calculate and output the index.

* **The Pythonic Way:**
  ```python
  index = round(0.0588 * L - 0.296 * S - 15.8)
  print(f"Grade {index}")
  ```
* **The C Counterpart:**
  ```c
  int index = round(0.0588 * L - 0.296 * S - 15.8);
  printf("Grade %i\n", index);
  ```
* **The Logic Shift:** 
  C requires importing `math.h` to use the `round()` function, and then formatting the console output using placeholders like `%i` inside `printf()`. 
  Python's `round()` function is built-in and does not require any imports. Additionally, Python uses **f-strings** (formatted string literals) by placing an `f` before the quotation marks, allowing you to inject variables directly into the print statement using curly braces `{index}`.