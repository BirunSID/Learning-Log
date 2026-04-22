# 📊Excel Basics 12: Complete Formula Lesson of Formula Types & Formula Elements 12 Examples

**Tags:** #excel/PMT basics #excel/formula-elements #excel/logical-formulas #excel/text-formulas #excel/order-of-operations #excel/accounting-logic
**Source:** [Excel Basics 12 Complete Formula Lesson of Formula Types & Formula Elements 12 Examples](https://youtu.be/HN4QEHN0NtI?si=j45ObFnYqvtmQOMj)
**Lab File:** [Formula Elements](../../../3_Projects_and_Labs/2_MS_Excel/1_ExcelIsfu_lab/12_FormulaElements.xlsm)
**HW's:** 

---
# 📅 2026-04-22: Complete Formula Lesson of Formula Types & Formula Elements 12 Examples


> [!note] Progress: 00:00 - END
> This session covers the foundational architecture of Excel formulas, including the three primary result types (Number, Text, Logical), the elements that comprise a formula, and the strict hierarchy of the calculation order.

---

### 💡 Concepts & Logic

*   **The Three Result Types:**
    *   **Number Formulas:** Deliver a numeric value (e.g., taxes, totals, deductions).
    *   **Text Formulas:** Deliver a text string. Often used for combining data (e.g., "First Name" + "Last Name").
    *   **Logical Formulas (Boolean):** Deliver only one of two values: **TRUE** or **FALSE**. Essential for data validation and "If/Then" scenarios.
*   **Excel’s Golden Rule:** 
    *   If a value can change, put it in a cell and reference it in the formula. 
    *   Constants are only acceptable if they are universal and unchanging (e.g., 12 months in a year, 7 days in a week).
*   **The "Text String" Rule:** Excel is programmed to look for functions (like SUM). When you want literal text inside a formula, you **must** wrap it in double quotes (`" "`). If you don't, Excel will return a `#NAME?` error because it thinks the text is a broken function name.
*   **Pattern Recognition:** Before using extraction functions (`LEFT`, `RIGHT`), identify the pattern. If state abbreviations are always 2 characters at the end, use `RIGHT(cell, 2)`.
*   **Verification Mental Model:** Always assume a visual match might be a formatting lie. Use logical formulas (`=CellA=CellB`) to verify if totals are truly in balance.

---

### ⌨️ Shortcuts & Mouse Actions

| Action | Shortcut / Mouse Behavior |
| :--- | :--- |
| **AutoSum** | `Alt` + `=` |
| **Toggle Absolute/Relative** | `F4` (while the cursor is on a cell reference) |
| **Enter & Stay in Cell** | `Ctrl` + `Enter` |
| **Edit / Verify Formula** | `F2` (shows color-coded ranges) |
| **Format Cells Dialog** | `Ctrl` + `1` |
| **Apply General Format** | `Ctrl` + `Shift` + `~` (Grave Accent/Tilde) |
| **Zoom In/Out** | `Ctrl` + `Mouse Wheel` |
| **Jump to A1** | `Ctrl` + `Home` |

---

### 🧮 Formulas & Math Logic

#### 1. The Join Operator (`&`)
Used to concatenate different elements into one text string.
*   **Example:** `="Item #" & C70`
*   **Workflow:** Type `=`, then the text in quotes `"Item #"`, then the ampersand `&`, then click the cell containing the number.

#### 2. Rounding Logic
Prevents "floating-point" errors in accounting.
*   **Formula:** `=ROUND(GrossPay * TaxRate, 2)`
*   **Logic:** Always round to the penny (2 decimal places) when the result will be used in further sub-totals to ensure the math "adds up" visually.

#### 3. Extraction Functions (`LEFT` / `RIGHT`)
*   **LEFT:** `=LEFT(Text, Num_Chars)` — Pulls from the start of the string.
*   **RIGHT:** `=RIGHT(Text, Num_Chars)` — Pulls from the end of the string.

#### 4. Conditional Counting
*   **Formula:** `=COUNTIFS(Absolute_Range, Relative_Criteria)`
*   **Workflow:** Select the range of data → Press `F4` to lock it → Select the single criteria cell (leave relative).

#### 5. Comparative Arithmetic (The Reorder Logic)
- **Concept:** Combining subtraction and comparison to determine if stock levels hit a "Hurdle."
- **Formula:** =$D$172 > B165 - C165
- **Workflow:**
    1. Select the Hurdle cell (Locked with F4).
    2. Type the comparative operator (>).
    3. Select Beginning Quantity.
    4. Type the minus sign (-).
    5. Select Units Sold.
- **Mental Model:** Excel calculates (B165 - C165) first, then asks if the Hurdle is greater than that result.

---

### 📊 Excel’s Calculation Order (The Hierarchy)

Excel follows a specific order of operations. If a formula isn't working, check it against this list:

1.  **Parentheses `( )`** (Forces specific math to happen first)
2.  **Reference Operators** (Colon `:` and Comma `,`)
3.  **Negation** (e.g., `-1`)
4.  **Percent `%`** (Converts 1% to .01)
5.  **Exponents `^`**
6.  **Multiplication `*` and Division `/`** (Left to Right)
7.  **Addition `+` and Subtraction `-`** (Left to Right)
8.  **Ampersand `&`** (Joining text)
9.  **Comparative Operators** (`=`, `<>`, `<`, `>`, `<=`, `>=`)

> [!warning] Common Pitfall
> In the formula `=69 > 114 - 45`, Excel will calculate the subtraction (`114-45`) **before** checking if it is greater than 69. Comparative operators are almost always the very last thing Excel calculates.

---

### 🔍 Verification & Auditing
*   **F2 Key:** The primary way to check which cells a formula is looking at. Ensure your **Absolute** (`$`) references are locked on the correct table and your **Relative** references move with the formula.
*   **Evaluate Formula Tool:** 
    *   Location: `Formulas Tab` > `Formula Auditing` > `Evaluate Formula`.
    *   Use this to step through complex logical formulas to see exactly where a `TRUE` turns into a `FALSE`.

---

