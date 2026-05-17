# 📊 Excel Basics 19: SUMIFS, COUNTIFS, AVERAGEIFS, MINIFS, MAXIFS

**Tags:** #excel/SUMIFS #excel/COUNTIFS #excel/AVERAGEIFS #excel/LogicalTests #excel/Formulas
**Source:** [Excel Basics 19: SUMIFS, COUNTIFS, AVERAGEIFS, functions calculations w 1 or more Criteria](https://youtu.be/Pw54WUA609w?si=YNfCfMlzbHHtQB-z)  
**Lab File:** [SUMIFS and Similar Functions](../../../3_Projects_and_Labs/2_MS_Excel/1_ExcelIsfun_lab/19_SUMIFSandSimilarFunctions.xlsm)  
**HW's:** 

---
# 📅 May 17, 2026: Multiple Criteria Calculations with "IFS" Functions

> [!note] Progress: 00:00 - END
> This session covers how to perform dynamic calculations (counting, summing, averaging, and finding the min/max) based on *two or more* conditions using the "IFS" family of functions. The core objective is mastering the "AND Logical Test" to accurately filter and calculate data directly within cells, creating reports that automatically update when source data changes.

---

### 💡 Concepts & Logic
*Focus on the 'Why' and the mental models.*

*   **The "AND" Logical Test:** When a function has two or more logical tests, *all* tests must evaluate to TRUE for the record to be included in the calculation. Think of it like a parent's rule: "If you take out the garbage AND clean the table, you get dessert." Both must be done to get the result. 
*   **Formulas vs. PivotTables:** PivotTables are generally easier to create for basic summaries. However, formulas (like `SUMIFS`) instantly and automatically update when source data changes, whereas PivotTables require a manual "Refresh." Furthermore, using comparative operators (like `<10` or `>=3`) is much easier in formulas than setting up a PivotTable.
*   **Case Insensitivity:** Excel formulas and access are *not* case sensitive. Typing "BUSN" or "busn" or "bUsN" as criteria will yield the exact same matches.
*   **Order of Criteria Does Not Matter:** When building an "IFS" function, it does not matter which criteria/column pair you enter first, as long as you properly match Criteria Range 1 with Criteria 1.
*   **Exact Range Sizing Rule:** When selecting your criteria ranges and calculation ranges, they must be the *exact same size/dimensions* (e.g., all must be rows 2 through 24). If they do not match perfectly, the formula will fail.
*   **Excel Table Structural References:** When converting data to an Excel Table, you can reference the entire column by name. This makes formulas dynamic and immune to breaking when new data is added.

---

### ⌨️ Shortcuts & Mouse Actions
*Capture every physical keyboard or mouse action mentioned or implied.*

| Action | Shortcut / Mouse Behavior |
| :--- | :--- |
| **Verify / Edit Formula** | `F2` |
| **Lock Cell Reference (Absolute Reference)** | `F4` (cycles through locking options) |
| **Highlight Entire Column Downwards** | `Ctrl + Shift + Down Arrow` |
| **Jump Back to Active Cell** | `Ctrl + Backspace` (Great after highlighting a massive column) |
| **Undo Last Action** | `Ctrl + Z` |
| **Copy / Paste** | `Ctrl + C` / `Ctrl + V` |
| **Jump to Top of Worksheet** | `Ctrl + Home` |
| **Auto-Complete a Function Name** | `Tab` (e.g., Type `=AVERAGEI` and press `Tab`) |
| **Select Entire Table Column** | Hover cursor at the top of the column header until it turns into a **thick black downward-pointing arrow**, then click. |

---

### 🧮 Formulas & Math Logic
*Detail the formulas and the step-by-step clicking/typing process to execute them.*

*   **Dynamic Criteria Rule:** Always type your criteria (like `>=3`, `<10`, or `2017`) into a dedicated, labeled cell. Reference that cell in your formula instead of typing the criteria directly into the formula. This allows you to instantly update reports just by changing the criteria cell.
*   **`COUNTIFS` (Multiple Conditions):** Counts how many cells meet *all* specified conditions.
    *   *Syntax:* `=COUNTIFS(criteria_range1, criteria1, [criteria_range2, criteria2]...)`
    *   *Workflow:* Type `=COUNTIFS(`, select the first column to evaluate, type a comma, click the cell holding your first criteria, type a comma, select the second column, type a comma, click your second criteria cell, and close parentheses `)`.
*   **`SUMIFS` (Multiple Conditions):** Adds values based on multiple conditions. *Crucial distinction:* The range of numbers you want to add goes **first**.
    *   *Syntax:* `=SUMIFS(sum_range, criteria_range1, criteria1, ...)`
    *   *Workflow:* Type `=SUMIFS(`, highlight the column containing the numbers to add (`Ctrl + Shift + Down`, then `Ctrl + Backspace`), type a comma, highlight your first criteria column, type a comma, click your first criteria cell, repeat for subsequent criteria, and hit `Enter`. 
*   **`AVERAGEIFS`:** Averages values based on multiple conditions. Like `SUMIFS`, the range containing the numbers to calculate goes **first**.
    *   *Syntax:* `=AVERAGEIFS(average_range, criteria_range1, criteria1, ...)`
*   **`MAXIFS` & `MINIFS`:** Finds the largest or smallest number in a range that meets all conditions. *Note: These are newer functions available only in Office 365, Excel 2016, and later.*
    *   *Syntax:* `=MAXIFS(max_range, criteria_range1, criteria1...)` and `=MINIFS(min_range, criteria_range1, criteria1...)`. The number range to evaluate always goes first.

---

### 📊 Visualization, Formatting & Polish
*Group the remaining features into easy-to-read sub-headers.*

#### 1. Handling Comparative Operators
*   **Feature:** Using symbols like `>`, `<`, `>=`, `<=`. 
*   **Best Practice:** You can type these directly into the cell alongside the number (e.g., `>=3.5`). The "IFS" family of functions is smart enough to read the operator and the number together as a single logical test against the target range.

#### 2. Using Excel Tables for Clean Formulas
*   **Feature:** When building "IFS" functions, highlighting an Excel Table column will input the table nomenclature (e.g., `Table1[Sales]`).
*   **Why to use it:** This prevents you from needing to use `F4` to lock absolute references. Table references are automatically absolute to that column, making dragging formulas down perfectly safe and keeping the syntax incredibly easy to read.

---

### 🖨️ Verification & Final Checks
*Always include instructions on how to verify data.*

*   **Verification:** After dragging a formula down, go to the last cell in the column and press `F2`. Visually verify that the colored bounding boxes are pointing to the correct criteria cells and that the source ranges haven't shifted.
*   **Common Pitfalls:** 
    *   **Mismatched Range Sizes:** Ensure your `sum_range` and `criteria_ranges` start and end on the exact same rows. If `sum_range` is rows 2:24 and `criteria_range` is rows 2:23, the formula will return an error or incorrect data.
    *   **Forgetting to Lock Ranges:** If you are *not* using Excel Table features, you MUST press `F4` to apply absolute references (e.g., `$A$2:$A$24`) to your ranges before copying the formula down, otherwise, the ranges will slide out of place.