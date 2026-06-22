# Credit

## Problem to Solve
In a file called `credit.py` in a folder called `sentimental-credit`, write a program that prompts the user for a credit card number and then reports (via print) whether it is a valid American Express, MasterCard, or Visa card number, exactly as you did in Problem Set 1. Your program this time should be written in Python!

---

## Technical Overview
The program validates credit card numbers using **Luhn’s Algorithm** and identifies the card type based on its length and starting digits (prefixes). While the underlying logic matches the C counterpart from Problem Set 1, Python handles variables, division, and data types differently.

---

## Block-by-Block Documentation and C Counterparts

### 1. Input Processing
```python
card = int(input("Number: "))
```
*   **What it does:** Prompts the user for input and converts the resulting string into an integer.
*   **C Counterpart:**
    ```c
    long card = get_long("Number: ");
    ```
*   **Comparison:** 
    *   In C, `get_long` handles type safety and ensures the input is stored directly as a 64-bit integer. 
    *   In Python, `input()` always returns a string. It must be explicitly wrapped in `int()` to perform mathematical operations. Since Python handles arbitrarily large integers automatically, we do not need to worry about overflow limits like we do with `long` in C.

---

### 2. Luhn's Algorithm Validation Loop
```python
sum = 0
card_app1 = card
while card_app1 > 0:
    a = card_app1 % 10            
    sum = sum + a                 
    card_app1 = card_app1 // 10   
       
    b = card_app1 % 10            
    b = b * 2                     
    temp_b = b
    while temp_b > 0:             
        b = temp_b % 10                
        sum = sum + b             
        temp_b = temp_b // 10     
    card_app1 = card_app1 // 10   
```
*   **What it does:** Iterates through the digits from right to left. It extracts the last digit (`a`), adds it to the sum, and cuts it off. It then extracts the next digit, multiplies it by 2 (`b`), and uses a nested loop (`temp_b`) to separate and add the digits of the product if it is greater than 9 (e.g., `12` becomes `1 + 2`).
*   **C Counterpart:**
    ```c
    long sum = 0;
    long card_app1 = card;
    while (card_app1 > 0) {
        long a = card_app1 % 10;
        sum = sum + a;
        card_app1 = card_app1 / 10;

        long b = card_app1 % 10;
        b = b * 2;
        long temp_b = b;
        while (temp_b > 0) {
            b = temp_b % 10;
            sum = sum + b;
            temp_b = temp_b / 10;
        }
        card_app1 = card_app1 / 10;
    }
    ```
*   **Comparison:**
    *   **Integer Truncation:** In C, dividing an integer by an integer automatically truncates the decimal part (`card_app1 / 10`). In Python, using `/` would convert the variable to a float, causing an infinite loop. Python requires the **double slash** `//` (floor division) to explicitly truncate decimals [1].
    *   **Type Declaration:** C requires explicit types (`long sum`, `long a`), whereas Python initializes variables dynamically.

---

### 3. Card Length Calculation
```python
if card == 0:
    card_length = 1 
else:
    card_length = math.floor(math.log10(abs(card))) + 1
```
*   **What it does:** Calculates the number of digits in the card. It uses a logarithmic approach: the base-10 logarithm of a number gives its power of 10, which represents the number of digits minus one.
*   **C Counterpart:**
    ```c
    int card_length = 0;
    long temp = card;
    while (temp > 0) {
        temp /= 10;
        card_length++;
    }
    ```
*   **Comparison:**
    *   While we can use a loop in both languages, this Python code utilizes a mathematical shortcut via the `math` library.
    *   Because `math.log10(0)` is mathematically undefined, a conditional `if card == 0` check is used to avoid a crash.

---

### 4. Prefix Extraction
```python
# Amex & Master
card_app2 = card
Am_Ma = card_length
Am_Ma -= 2

while (Am_Ma > 0):
    card_app2 = card_app2 // 10
    Am_Ma -= 1
```
*   **What it does:** Reduces the card number down to its first two digits by shifting the decimal point to the left using floor division `// 10` [1]. This prepares the prefix for Amex and Mastercard checks.
*   **C Counterpart:**
    ```c
    long card_app2 = card;
    int Am_Ma = card_length - 2;
    while (Am_Ma > 0) {
        card_app2 /= 10;
        Am_Ma--;
    }
    ```
*   **Comparison:**
    *   **Decrement Operators:** C supports postfix decrementing (`Am_Ma--`). Python does not support `--` or `++` operators; it requires explicit arithmetic assignments like `Am_Ma -= 1`.

---

### 5. Card Classification Logic
```python
if card_length in (13, 15, 16) and (sum % 10) == 0:
    if card_app2 in (34, 37):
        print("AMEX")
    elif card_app2 in (51, 52, 53, 54, 55):
        print("MASTERCARD")
    elif card_app3 in (4, ):
        print("VISA")
else:
    print("INVALID")
```
*   **What it does:** First, it validates whether the total sum modulo 10 equals 0 (as required by Luhn's Algorithm) and confirms the card length. If valid, it matches the extracted prefixes (`card_app2` or `card_app3`) to print the correct brand.
*   **C Counterpart:**
    ```c
    if ((card_length == 13 || card_length == 15 || card_length == 16) && (sum % 10 == 0)) {
        if (card_app2 == 34 || card_app2 == 37) {
            printf("AMEX\n");
        } else if (card_app2 >= 51 && card_app2 <= 55) {
            printf("MASTERCARD\n");
        } else if (card_app3 == 4) {
            printf("VISA\n");
        } else {
            printf("INVALID\n");
        }
    } else {
        printf("INVALID\n");
    }
    ```
*   **Comparison:**
    *   **Membership Operator:** Python uses the `in` keyword to check if a value exists within a tuple (e.g., `card_app2 in (34, 37)`). In C, this must be written out with explicit logical OR (`||`) operators.
    *   **Single-Element Tuples:** In Python, checking a single element in a tuple requires a trailing comma: `(4, )`. Without the comma, Python treats it as a standard grouping parenthesis rather than a collection.