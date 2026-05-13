# 📊 Excel Basics 17: Style Formatting: By Hand, Cell, Table & Conditional Formatting

**Tags:** #excel/ExcelFormatting #excel/AccountingStyle #excel/ConditionalFormatting #excel/ExcelEfficiency #excel/DataVisualization
**Source:** [Excel Basics 17: Style Formatting: By Hand, Cell, Table & Conditional Formatting](https://youtu.be/ZByIUBX00qI?si=QsNr8tIfD8YJHbbC)
**Lab File:** [Style Formatting](../../../3_Projects_and_Labs/2_MS_Excel/1_ExcelIsfun_lab/17_StyleFormatting.xlsm)
**HW's:** 

---
# 📅 May 13th, 2026: Master Class on Style Formatting (Hand, Cell, Table & Conditional)

> [!note] Progress: [00:00 - END]
> This session covers the transition from raw data to professional reports, focusing on the strict standards of Accounting formatting, the efficiency of Cell Styles, and the dynamic nature of Conditional Formatting.

---

### 💡 Concepts & Logic
*   **The "Top/Bottom" Accounting Rule:** Professional financial reports (Income Statements, Balance Sheets) should only display currency symbols on the **first row** of a column and the **final total row**. Intermediate rows should be formatted as "Comma Style" (numbers only) to reduce visual clutter.
*   **Accounting vs. Currency (The Fine Details):**
    *   **Accounting:** Fixed dollar sign (left-aligned), zeros appear as dashes (`-`), and negative numbers are always in parentheses `( )`.
    *   **Currency:** Floating dollar sign (stays next to the number), zeros appear as `$0.00`, and negatives can be shown with a minus sign or in red.
*   **The Border Logic:** In accounting, a **single line** above a number indicates a calculation is being performed on the numbers above it. A **double-underline** (bottom border) signifies the final "Bottom Line" or result of the report.
*   **The Golden Rule of Conditional Formatting:** Always link your formatting rules to a **Hurdle Cell** (Criteria cell) rather than typing a hard-coded number into the rule. This follows the "One Source" logic, allowing the entire report's formatting to update by changing one cell.

---

### ⌨️ Shortcuts & Mouse Actions

| Action | Shortcut / Mouse Behavior |
| :--- | :--- |
| **Open Format Cells Dialog** | `Ctrl + 1` (The most essential formatting shortcut). |
| **Apply Bold** | `Ctrl + B` |
| **Manual Line Break** | `Alt + Enter` (While typing inside a cell). |
| **Auto-Fit Column Width** | Double-click the boundary between column headers. |
| **Multi-Use Format Painter** | **Double-click** the Format Painter icon to keep it "loaded" for multiple clicks. |
| **Select Non-Adjacent Cells** | Hold `Ctrl` while clicking/dragging. |
| **Convert Range to Table** | `Ctrl + T` (Or use 'Format as Table' from the Styles group). |
| **Exit Format Painter** | `Esc` |

---

### 🧮 Formulas & Math Logic
While this video focuses on formatting, the relationship between formatting and underlying math is critical:
*   **Verifying Totals:** Before applying borders, use `Alt + =` to ensure the sum range is correct.
*   **Dynamic Formatting Logic:**
    *   **Workflow for "Greater Than" CF:**
        1.  Highlight target range.
        2.  Conditional Formatting > Highlight Cell Rules > Greater Than.
        3.  Instead of typing "18000", **click the cell** containing your criteria.
        4.  This creates a "volatile" format that reacts to data changes instantly.

---

### 📊 Visualization & Final Polish

#### 1. Conditional Formatting Types
*   **Data Bars:** Creates an "in-cell" bar chart. The longest bar represents the maximum value in the range, providing an instant relative scale.
*   **Top 25% Rule:** Automatically calculates the top quartile and applies a custom fill.
*   **Loss Highlighting:** Use a "Less Than 0" rule with Red Fill/White Font for immediate risk identification.

#### 2. Wrap Text vs. Manual Breaks
*   **Wrap Text (Toggle):** Adjusts automatically if you resize the column.
*   **Manual Break (`Alt + Enter`):** Forces the text to break at a specific word, regardless of column width. *Best practice: Use manual breaks for specific header alignment.*

#### 3. Professional Table Setup
*   **Naming Convention:** When using the "Table Format" button, immediately go to the **Table Tools Design** tab and name the table (e.g., `SalesTable`). **Never leave spaces in table names.**
*   **Self-Healing:** Tables automatically expand formatting and formulas to new rows added at the bottom.

---

### 🖨️ Final Polish: Cell Styles
*   **Why use Cell Styles?** Instead of repeating 5-6 clicks (Bold, Center, Blue Fill, White Font) for every header, save it as a "New Cell Style." 
*   **Consistency:** If you change a Cell Style's definition later, **every cell** using that style across the entire workbook updates automatically.
*   **Verification:** Press `F2` on a formatted cell to ensure that "Accounting Underlines" aren't hiding incorrect formula ranges.