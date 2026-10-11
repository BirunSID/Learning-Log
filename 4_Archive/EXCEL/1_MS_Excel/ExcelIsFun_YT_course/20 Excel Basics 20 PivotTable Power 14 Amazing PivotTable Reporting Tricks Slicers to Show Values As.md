# 📊 Excel Basics 20: Excel Basics 20: PivotTable Power: 14 Amazing PivotTable Reporting Tricks: Slicers to Show Values As

**Tags:** #excel/pivot-tables #excel/data-analysis #excel/slicers #excel/show-values-as #excel/vlookup #excel/date-grouping  #excel/formatting  
**Source:** [Excel Basics 20 PivotTable Power 14 Amazing PivotTable Reporting Tricks Slicers to Show Values As](https://youtu.be/Sv9-P50CGog?si=cA7x5-54MhpgSfnj)  
**Lab File:** [Pivot Tables Start](../../../3_Projects_and_Labs/2_MS_Excel/1_ExcelIsfun_lab/20_PivotTablesStart.xlsm)
**HW's:** 

---
# 📅 June 1, 2026: PivotTable Power: 14 Amazing PivotTable Reporting Tricks

> [!note] Progress: 00:00 - END
> This session covers advanced PivotTable reporting workflows, transitioning raw, transaction-level data into polished business intelligence dashboards. We explore dimensional mapping with VLOOKUP helper columns, automated date grouping, visual filtering via multi-table slicer connections, and utilizing "Show Values As" calculations to analyze month-over-month differences, percentages, and running totals [1, 2].

---

### 💡 Concepts & Logic
*   **Data Analysis & Business Intelligence (BI):** The process of converting raw transactional data (unstructured list of facts) into structured, meaningful, and actionable information to support business decision-making [1, 2].
*   **Proper Data Set Rules:** To build an error-free PivotTable, your source data must be formatted as a structured table [1]:
    *   **First Row:** Must contain unique column headers (Field Names) [1].
    *   **Rows:** Each row must represent a single, unique transaction or record [1].
    *   **Boundaries:** The data set must be surrounded on all sides by empty cells or the outer boundaries of the worksheet (no adjacent, unrelated data) [1].
*   **Helper Columns vs. Dimensional Modeling:** When transactional data only contains short keys (e.g., country codes like `USA`, `FRA`), you must map them to full descriptive fields (e.g., Country Names) using lookup functions before executing the PivotTable. This prevents incomprehensible row labels in your final presentation [1].
*   **Number Format vs. Format Cells:** 
    *   *Format Cells (`Ctrl + 1`):* Formats the specific grid cells. If you pivot, expand, or rearrange your fields, the cell-level formatting remains in place, leading to misaligned formats [1].
    *   *Number Format:* Configures the underlying data field within the PivotTable's cache [1]. Right-click the values, select **Number Format**, and apply the style [1]. This ensures the formatting dynamically travels with the field no matter how the report is restructured [1].
*   **Slicer Filtering Logic:** A slicer acts as a highly visual, interactive filter [1, 2]. When a slicer value is selected, Excel filters the entire source cache, applying that criteria globally across all calculations in any connected PivotTables [2].
*   **Slicers vs. Row Fields:** Slicers apply a static filter to the entire dataset (e.g., showing only 2016 data) [2]. Row/Column fields, conversely, establish coordinates that dynamically change cell-by-cell as you navigate down or across the report grid [2].
*   **The Golden Rule of Slicing (Naming Tables):** Always assign a descriptive name to every PivotTable immediately upon creation [2]. When you later configure a slicer's **Report Connections**, this naming prevents you from having to guess which generic table (e.g., `PivotTable1`, `PivotTable2`) you are linking [2].
*   **Text Fields in Values Area:** Dragging a numeric field to the Values area defaults to `SUM` [1, 2]. Dragging a text field (non-numeric) to the Values area automatically defaults to `COUNTA` (Count) [1, 2].

---

### ⌨️ Shortcuts & Mouse Actions

| Action | Shortcut / Mouse Behavior |
| :--- | :--- |
| **Open PivotTable Dialog Box** | `Alt + N + V` (Insert > PivotTable) [1, 2] |
| **Absolute Reference Lock** | Press `F4` to cycle through absolute reference styles (e.g., `$G$4:$H$129`) [1] |
| **Select Column to Bottom** | `Ctrl + Shift + Down Arrow` [1] |
| **Enter Formula / Fill Selection** | `Ctrl + Enter` (populates the formula to all highlighted cells) [1] |
| **Copy Formula Down Column** | Double-click the **Fill Handle** (bottom-right corner of the active cell) [1] |
| **Verify Formulas / Edit Mode** | `F2` (enters edit mode to verify cell ranges and reference colors) [1] |
| **Jump to Cell A1** | `Ctrl + Home` [1] |
| **Jump to Bottom of Dataset** | `Ctrl + Down Arrow` [1] |
| **Expand Entire Nested Field** | Right-click grouped header item $\rightarrow$ **Expand/Collapse** $\rightarrow$ **Expand Entire Field** [2] |

---

### 🧮 Formulas & Math Logic

#### 1. Dimensional Mapping with VLOOKUP Exact Match
Before pivoting, map raw codes to full descriptive names using helper columns [1].
$$\text{Formula: } =VLOOKUP(\text{lookup\_value}, \text{table\_array}, \text{col\_index\_num}, \text{range\_lookup})$$

*   **Workflow for Country Code Mapping:**
    1. Click in cell `G4` (first cell of the helper column) [1].
    2. Type `=VLOOKUP(` [1].
    3. Select cell `C4` (the transactional Country Code) [1].
    4. Type a comma `,` and highlight the country lookup range (e.g., `$K$4:$L$129`) [1].
    5. Press `F4` to lock the range as an absolute reference (`$K$4:$L$129`) [1].
    6. Type `, 2` (to retrieve the country name from the second column) [1].
    7. Type `, 0` (or `FALSE` for an exact lookup match) and close parentheses [1].
    8. Press `Ctrl + Enter` and double-click the **Fill Handle** to copy down to row 73,180 [1].

*   **Workflow for Product Category Mapping:**
    1. Click in cell `H4` [1].
    2. Type `=VLOOKUP(D4, $N$4:$O$156, 2, 0)` (where `D4` is the Product Name and column 2 contains the Product Category) [1].
    3. Press `Ctrl + Enter` and copy down [1].

---

#### 2. Advanced "Show Values As" Math Logic

| Calculation Type      | Underlying Mathematical Logic                                                     | Use Case [1, 2]                                                                               |
| :-------------------- | :-------------------------------------------------------------------------------- | :-------------------------------------------------------------------------------------------- |
| **Difference From**   | $Value_{\text{Current}} - Value_{\text{Base}}$                                    | Showing month-over-month sales increases/decreases in absolute dollars [2].                   |
| **% Difference From** | $\frac{Value_{\text{Current}} - Value_{\text{Base}}}{Value_{\text{Base}}}$        | Analyzing rate of change (growth/contraction) relative to the prior month [2].                |
| **Running Total In**  | Cumulative sum of values up to current row index: $\sum_{i=1}^{n} Value_i$        | Visualizing year-to-date sales accumulation, resetting at the beginning of each year [2].     |
| **% of Column Total** | $\frac{\text{Sales of Product}_X}{\text{Total Column Sales}}$                     | Creating a market share or frequency distribution profile [2].                                |
| **% of Row Total**    | $\frac{\text{Passed Prep Course}}{\text{Total Passed + Failed in that category}}$ | Cross-tabulating binary outcomes (e.g., Pass vs. Fail) to evaluate program effectiveness [2]. |

---

### 📊 Visualization, Formatting & Polish

#### 1. Professional Tabular Layout Setup
By default, Excel creates PivotTables in a "Compact Layout" with generic "Row Labels" and "Column Labels" [1, 2]. 
*   **The Polish:** Go to **PivotTable Tools Design** $\rightarrow$ **Layout** $\rightarrow$ **Report Layout** $\rightarrow$ **Show in Tabular Form** (or **Show in Outline Form**) [1, 2].
*   **Result:** This replaces the generic headers with the actual field names (e.g., "Country" and "ProductCategory") and splits nested fields into separate, dedicated columns [1, 2].

#### 2. Visual Theme & Style Consistency
*   To clean up visual clutter, avoid harsh, fully-saturated block colors.
*   **Workflow:** Click inside the PivotTable $\rightarrow$ Go to the **Design** tab $\rightarrow$ Open the style gallery dropdown [1, 2]. Choose a high-contrast style that utilizes dark text over light/muted backgrounds (such as **Light Green, Pivot Style Medium 14**) [1, 2]. This style keeps the text highly readable while utilizing zebra-striping to guide the reader's eye [1, 2].

#### 3. Slicer Connection and Settings Optimization
When setting up interactive dashboards with slicers, apply these structural changes to prevent "ghost" elements [2]:
*   **Eliminating Empty Filter Items:** If your dataset updates or filters change, slicers can show dimmed, unclickable buttons for items with no current data (ghost items) [2]. 
*   **Slicer Settings Fix:** Right-click the Slicer $\rightarrow$ Select **Slicer Settings** $\rightarrow$ Check **Hide items with no data** $\rightarrow$ Click **OK** [2].
*   **Connecting Multiple PivotTables:** Click the Slicer $\rightarrow$ **Slicer Tools Options** $\rightarrow$ **Report Connections** (or right-click Slicer $\rightarrow$ **Report Connections**) [2]. Check the boxes next to all named PivotTables you want to filter simultaneously [2].

---

### 🖨️ Verification & Final Checks

#### 1. Multi-Step Formula Audit
*   **Audit Procedure:** Navigate to the bottom-most cell in your newly populated helper columns (e.g., row 73,180) [1]. Press `F2` [1]. Confirm that the relative cell reference changed appropriately (e.g., looking up cell `C73180`), while the lookup table array remained perfectly locked to `$K$4:$L$129` [1]. 

#### 2. Show Values As Calculation Reference Logic
*   When utilizing **Difference From** or **% Difference From**, your settings must be structurally configured as follows [2]:
    *   **Base Field:** Set to your chronological tracker (e.g., `Month` or `Date`) [2].
    *   **Base Item:** Set to `(previous)` [2].
*   *Note:* If you select a specific month (like `Jan`) instead of `(previous)`, every subsequent row will calculate its change against January, rather than showing month-over-month trends [2].

#### 3. Turning Off "GetPivotData"
*   **Pitfall:** By default, referencing a PivotTable cell inside an external cell formula generates a complex `=GETPIVOTDATA()` function instead of a simple cell reference (e.g., `=C11-C10`) [2].
*   **Remedy:** Go to **File** $\rightarrow$ **Options** $\rightarrow$ **Formulas** [2]. Under **Working with formulas**, uncheck **Use GetPivotData functions for PivotTable references** $\rightarrow$ Click **OK** [2]. This allows standard, flexible cell referencing when building ad-hoc manual validation tables beside your reports 