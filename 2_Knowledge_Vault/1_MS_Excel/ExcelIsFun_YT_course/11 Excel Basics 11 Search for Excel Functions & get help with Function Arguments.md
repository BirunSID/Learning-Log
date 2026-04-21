# 📊 Excel Basics 11: Search for Excel Functions & get help with Function Arguments

**Tags:** #excel #excel/insert-function #excel/PMT #excel/financial-formulas #excel/MEDIAN #excel/AVERAGE #excel/data-analysis #excel/shortcuts
**Source:** [Excel Basics 11: Search for Excel Functions & get help with Function Arguments](https://youtu.be/2MizbiiZgjg?si=680n2-R7bFOO6zoH)
**Lab File:** [Search For Functions](../../../3_Projects_and_Labs/2_MS_Excel/1_ExcelIsfu_lab/11_SearchForFunctions.xlsm)
**HW's:** No hw here on this note.

---
# 📅 2026-04-21: Excel Insert Function Dialog, PMT, and MEDIAN Calculations

> [!note] Progress: 00:00 - End

### 💡 Concepts & Logic

**The Mental Model: Discovering Functions & Guided Inputs**
You do not need to memorize every Excel function. When you know *what* you want to calculate but don't know the exact formula name, Excel has built-in search and guidance tools to help you build complex calculations flawlessly.

*   **The "Insert Function" Wizard:** Instead of manually typing a formula, using the Insert Function dialog allows you to search for tools using natural language (e.g., typing "loan payment" will suggest the `PMT` function).
*   **Function Arguments Dialog Box (The "Helper"):** Once a function is selected, this box acts as a wizard. It explains exactly what each argument means, tells you if an argument is required (bold text) or optional (non-bold text), and shows you real-time data previews of the cells you select.
*   **The Periodicity Rule (Time Matching):** In financial formulas like loans, your time periods **must** match. If you are calculating a *monthly* payment, your interest rate must be a *monthly* rate (Annual Rate / 12) and your number of periods must be in *months* (Years * 12). 
*   **Cash Flow Direction (Negative vs. Positive):** Financial functions like `PMT` return negative numbers. This is a deliberate accounting standard: a loan payment is cash *leaving* your pocket (an outflow), hence the negative value. 
*   **Mean vs. Median (Handling Outliers):** 
    *   The `AVERAGE` (Arithmetic Mean) is highly sensitive to extreme outliers. A few massive house prices will heavily skew the mean upward, misrepresenting the "typical" house.
    *   The `MEDIAN` function calculates the exact middle of a sorted dataset. It is a much more robust and accurate reflection of a "typical value" when dealing with highly variable data like real estate prices or salaries.

### ⌨️ Shortcuts & Mouse Actions

| Action | Shortcut / Mouse Behavior |
| :--- | :--- |
| **Open Insert Function Dialog** | `Shift + F3` (or click the `fx` button next to formula bar) |
| **Select Contiguous Range** | `Ctrl + Shift + Down Arrow` |
| **Jump Screen Back to Active Cell** | `Ctrl + Backspace` (Keeps the range selected but snaps your view back to the formula cell) |
| **Enter Edit Mode / Verify Formula** | `F2` |

### 🧮 Formulas & Math Logic

**1. The PMT Function (Loan Payments)**
Calculates the constant periodic payment for a loan based on a constant interest rate.
*   **Formula:** `=PMT(rate, nper, pv, [fv], [type])`
*   **Workflow (Using the Dialog Box):**
    1. Press `Shift + F3` to open the Insert Function box.
    2. Search "Loan Payment", select `PMT`, and press Enter to open the Function Arguments box.
    3. **Rate (Interest Rate):** Click the cell containing the *Monthly* Interest Rate. (If you only have the Annual Rate, click it and type `/12` directly in the argument box).
    4. **Nper (Number of Periods):** Click the cell containing the *Total Months* of the loan. (If you only have Years, click it and type `*12`).
    5. **Pv (Present Value):** Click the cell containing the Total Loan Amount (Total Cost minus Down Payment).
    6. *Note on Optional Arguments:* `Fv` (Future Value / Balloon Payment) and `Type` (Payment at Beginning `1` or End `0` of period) can be left blank for standard consumer loans.
    7. **Pre-verification:** Look at the "Formula result =" text at the bottom left of the dialog box to verify the math looks correct *before* clicking OK.

**2. The MEDIAN Function**
Returns the number in the middle of a set of given numbers.
*   **Formula:** `=MEDIAN(number1,[number2], ...)`
*   **Workflow:**
    1. Type `=MEDIAN(` and select the first cell of your dataset.
    2. Press `Ctrl + Shift + Down Arrow` to instantly highlight the whole list.
    3. Press `Ctrl + Backspace` to snap your view back to the top where you are typing.
    4. Close the parentheses `)` and press Enter.

**3. The AVERAGE Function**
Returns the arithmetic mean. It adds all numbers in a range and divides by the count.
*   **Formula:** `=AVERAGE(number1, [number2], ...)`

### ✅ Verification Best Practices
*   **The F2 X-Ray:** Always press `F2` on your completed `PMT` or `MEDIAN` formula. Excel will color-code the referenced cells. Visually verify that your `PMT` formula is pulling the *monthly* variables, not accidentally clicking the *annual* variables just above them in your raw data table.

***

