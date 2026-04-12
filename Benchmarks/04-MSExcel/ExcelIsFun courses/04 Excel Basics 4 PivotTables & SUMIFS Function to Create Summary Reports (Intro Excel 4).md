# 📊 Excel Basics 2: Introduction To Excel 2

**Tags:** #excel #excel/basics #excel/shortcuts #excel/tips_tricks #excel/summing #excel/counting 
**Source:** [  Excel Basics 4: PivotTables & SUMIFS Function to Create Summary Reports](https://youtu.be/uGNdFW_3NnY?si=x6m-YbKeMo6dUP3u)
**Lab File:** [click here for the file](../lab/4_SUMIFSandPivotTables.xlsx)

---


# 📅 12 April 2026: Summary Reports with PivotTables & SUMIFS

> [!abstract] Progress: 00:00 - end
> This module covers the fundamental logic of converting raw data into business intelligence using two primary methods: the `SUMIFS` function and PivotTables. Key focus areas include data set integrity and the trade-offs between formula-based reports and PivotTable reports.

---
### 💡 Concepts & Logic

*   **Data Analysis vs. Calculations:** 
	*   *Calculations* are basic math operations (e.g., Net Income = Revenue - Expenses). 
	*   *Data Analysis (Business Intelligence)* is the process of converting "lots of raw data" into "useful information" (e.g., a regional sales report).
*   **The "Proper Data Set" Rule:** For Excel's analysis tools to function, your data must follow these three rules:
	1.  **Field Names:** The first row must contain unique column headers.
	2.  **Records:** Each row must represent a single transaction or item.
	3.  **The "Island" Rule:** The data set must be surrounded by empty cells (or the edge of the sheet). **Never** type unrelated notes directly adjacent to your data.
*   **Unique vs. Distinct Lists:** When creating summary reports, you are condensing a long list of repeated items (e.g., "Northwest") into a single unique instance to calculate its total.
*   **Static vs. Dynamic Updates:**
	*   **Formulas (`SUMIFS`):** Update instantly when source data changes.
	*   **PivotTables:** Require a manual "Refresh" to reflect data changes.

---
### ⌨️ Shortcuts & Mouse Actions

| Action | Shortcut / Mouse Behavior |
| :--- | :--- |
| **Audit/Edit Cell** | `F2` (The most important tool for verifying range locks). |
| **Toggle Absolute Reference** | `F4` (Cycles between $A$1, A$1, $A1, and A1). |
| **Open Format Cells** | `Ctrl + 1` |
| **Enter and Stay** | `Ctrl + Enter` (Enters data/formula and keeps the cell selected). |
| **Auto-Fill Range** | **Double-click** the "Angry Rabbit" (Fill Handle) at the bottom-right of a cell. |
| **Create PivotTable** | Select **one** cell → `Alt + N + V` (or Insert > PivotTable). |

---
### 🧮 Formulas & Math Logic

#### The `SUMIFS` Function
Used to add numbers based on one or more conditions.
`=SUMIFS(sum_range, criteria_range1, criteria1)`

*   **Logic:** Excel looks at the `criteria_range`, checks if it matches the `criteria`, and if "True," it adds the corresponding value from the `sum_range`.
*   **The Locking Rule:** When copying formulas down a report, the `sum_range` and `criteria_range` must be **Absolute ($)**, while the `criteria` (the specific item name) must be **Relative**.

> [!todo] **Workflow for SUMIFS:**
> 1. Type `=SUMIFS(`.
> 2. Click the top of the **Sales** column, use `Ctrl + Shift + Down Arrow` to select the range.
> 3. Press `F4` immediately to lock it.
> 4. Type `,` then select the **Criteria Range** (e.g., Region column).
> 5. Press `F4` to lock it.
> 6. Type `,` then select the **single cell** containing the item name (e.g., "Northwest"). Leave this relative.
> 7. Close parenthesis and `Ctrl + Enter`.

---

### 📊 PivotTable Logic & Polish

PivotTables automate the "Unique List" and "SUMIFS" process with drag-and-drop actions.

*   **Field List Task Pane:**
    *   **Rows:** Drag a text field here to create a unique/distinct list.
    *   **Values:** Drag a number field here to perform a calculation (Default is "Sum").
*   **Cleaning 'Chart/Report Junk':**
    *   **Tabular Layout:** By default, PivotTables use "Compact Form" which hides field names. Go to `Design > Report Layout > Show in Tabular Form` to see actual headers.
    *   **Field Formatting:** Do **not** use `Ctrl + 1` to format cells in a PivotTable. Instead, **Right-click a value → Number Format**. This ensures the formatting sticks to the "Field" even if the PivotTable changes shape.

---

### ✅ Verification & Best Practices

*   **The F2 Audit:** Always go to the **last cell** of a copied formula range and press `F2`. Verify that the blue and orange ranges are still correctly pointing at the source data and have not shifted downward.
*   **Status Bar Verification:** Highlight the raw data records for a specific category (e.g., all "Northwest" sales) and look at the "Sum" in the Excel Status Bar (bottom right) to see if it matches your report.
*   **Naming Conventions:** When adding formatting to PivotTables, always ensure the headers (e.g., "Total Sales") are clear and descriptive.