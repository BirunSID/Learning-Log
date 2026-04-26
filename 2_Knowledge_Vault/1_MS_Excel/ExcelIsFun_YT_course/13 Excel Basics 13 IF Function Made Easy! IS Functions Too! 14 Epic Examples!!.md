# 📊Excel Basics 13 IF Function Made Easy! IS Functions Too! 14 Epic Examples!!

**Tags:** #excel/basics #excel/IF-function #excel/IS-functions #excel/logical-tests #excel/data-validation #excel/zero-length-string #excel/helper-columns #excel/accounting-excel
**Source:** [Excel Basics 13 IF Function Made Easy! IS Functions Too! 14 Epic Examples!!](https://youtu.be/ODQWV0Vo1kM?si=qWGuIWzLS7rwC6xl)
**Lab File:** [IF Function & IS Functions](<13 Excel Basics 13 IF Function Made Easy! IS Functions Too! 14 Epic Examples!!.md>)
**HW's:** 

---
# 📅 26 April 2026: The IF Function, IS Functions, and Logical Decision Making

> [!note] Progress: 00:00 - END
> This session deep-dives into Excel's decision-making engine. We move beyond simple Boolean formulas (TRUE/FALSE) to the **IF Function**, which allows for custom outputs, and the **IS family of functions** for data validation and "cleaning" spreadsheets.

---

### 💡 Concepts & Logic

*   **The Mental Model of IF:** Think of `IF` as a fork in the road. You provide a "Logical Test" (the signpost). If the test is TRUE, Excel takes the first path (`value_if_true`); if FALSE, it takes the second path (`value_if_false`).
*   **Logical Test Construction:** The first argument of an `IF` function is a Boolean expression. It *must* result in TRUE or FALSE. You can use comparative operators or `IS` functions here.
*   **The "Show Nothing" Trick:** To make a cell look empty based on a condition, use a **Zero-Length Text String** (`""`). This is two double quotes with nothing between them.
*   **Comparative Operator Syntax:**
    *   `>=` (Greater than or equal to): Use this for "at least," "no less than," or "minimum of."
    *   `<=` (Less than or equal to): Use this for "at most" or "maximum of."
    *   `<>` (Not equal to): The symbol for exclusion.
*   **IS Functions as "The Truth-Tellers":** Functions like `ISBLANK` or `ISNUMBER` are specifically designed to investigate the nature of a cell. They are most powerful when nested inside the `Logical_test` argument of an `IF` statement.
*   **Accounting Hygiene:** Visuals can be deceptive. A balance might look like `$0.00` but actually be `$0.001`. A logical test (`=Balance=0`) or an `IF` statement will reveal these hidden "floating point" errors that formatting hides.

---

### ⌨️ Shortcuts & Mouse Actions

| Action | Shortcut / Mouse Behavior |
| :--- | :--- |
| **Toggle Cell Locking** | `F4` (Absolute vs. Relative reference) |
| **Formula Audit/Edit** | `F2` (Essential for verifying color-coded cell paths) |
| **Undo Last Action** | `Ctrl` + `Z` |
| **Jump to Bottom of Data** | `Ctrl` + `Down Arrow` |
| **Insert Pivot Table** | `Alt` -> `N` -> `V` |
| **Evaluate Formula** | Formulas Tab > Formula Auditing > Evaluate Formula (Step-by-step debug) |
| **Stay in Cell on Enter** | `Ctrl` + `Enter` (Keeps the cell selected after typing) |

---

### 🧮 Formulas & Math Logic

#### 1. The Standard IF Function
Used to deliver one of two specific results (Numbers, Text, or Calculations).
*   **Formula:** `=IF(C6>=$C$11, $C$10, 0)`
*   **Workflow:**
    1.  Type `=IF(`.
    2.  Click the "Sales" cell (Relative).
    3.  Type `>=` and click the "Hurdle" cell (Locked with `F4`).
    4.  Type `,` then click the "Bonus Amount" (Locked with `F4`).
    5.  Type `,` then `0`. Close parenthesis.

#### 2. Delivering Text Results
*   **Formula:** `=IF(B22=C22, "In Balance", "NOT In Balance")`
*   **Logic:** Text outputs MUST be wrapped in double quotes `" "`. Using single quotes `' '` or omitting quotes will trigger a `#NAME?` error.

#### 3. The "Blank Check" Logic (Nested IS)
Used in checkbook registers to prevent calculations from showing in empty rows.
*   **Formula:** `=IF(ISBLANK(B5), "", G4-F5+E5)`
*   **Mental Model:** If the Date cell is empty, show nothing (`""`); otherwise, perform the [Previous Balance - Subtract + Add] math.
*   **Workflow:** Click the cell below the initial balance. Construct the `IF` using `ISBLANK(DateCell)` as the test.

#### 4. Data Validation with IS Functions
*   **ISNUMBER:** `=ISNUMBER(cell)` — returns TRUE if the cell contains an actual number.
*   **ISBLANK:** `=ISBLANK(cell)` — returns TRUE if the cell is completely empty (no formulas, no spaces).
*   **ISTEXT:** `=ISTEXT(cell)` — returns TRUE if the cell is formatted as text or contains a text string.

---

### 📊 Pivot Table Integration

When using formulas to categorize data (e.g., tagging sales as "Large" or "Small"), that column becomes a **"Helper Column"** for Pivot Tables.

*   **Construction Logic:**
    1.  Create the `IF` formula to categorize rows.
    2.  Select the entire dataset (including headers).
    3.  `Alt, N, V` to create the Pivot Table.
    4.  Drag your new Category column into the **Columns** area.
    5.  Drag your Value column into the **Values** area.
*   **Clean Up:** To remove "Row Labels" and "Column Labels" for a professional report, go to the **Design Tab** > **Report Layout** > **Show in Tabular Form**.

---

### 🔍 Verification & Troubleshooting

*   **Floating Point Errors:** If a balance check returns "FALSE" even though the numbers look the same, use the **Increase Decimal** button. Often, a tiny fraction (e.g., .001) is hiding in the cell.
*   **The F2 Rule:** Before copying any `IF` formula down a column, press `F2` on the first cell. Ensure that the "Hurdle" or "Bonus" references are **Absolute** (have `$` signs) and the "Sales" reference is **Relative** (no `$` signs).
*   **Evaluate Formula Tool:** Essential for nested logic. It allows you to see the exact moment a cell reference like `C6` turns into its value (e.g., `65000`) and how that compares to the hurdle.

---
