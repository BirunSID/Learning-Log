# 📊 Excel Basics 2: Introduction To Excel 2

**Tags:** #excel #excel/basics #excel/tips_tricks #excel/shortcuts #excel/practices #excel/golden_rule #excel/chart_junk 
**Source:** [Excel Basics 2: Introduction to Excel 2](https://youtu.be/PNnvuADkg1o?si=Ok4yDiPXQqUwyZN7)
**Lab File:** [click here](./../lab/2_NetIncomeProjections.xlsx)

---
# 📅 08 April 2026: Formula Inputs, Excel's Golden Rule, and Charts

> Progress: 00:00 - END
### 💡 Concepts & Logic
- **Terminology:** The word "Spreadsheet" is often used as a loose synonym for either an individual *Worksheet* or the entire *Workbook* file.
- **Data Entry Pitfalls (AutoComplete):** When typing labels, Excel may try to "help" by auto-completing based on previous cells. Always check that it hasn't inserted unwanted text (e.g., changing "Net Income" to "Net Income Projections").
- **Stylistic Formatting:** 
	- **Select Region:** Use the shortcut to jump selection to the edges of your data in all directions. It stops at the first completely empty row/column.
	- **Fill Handle (Months):** Dragging "Jan" horizontally will automatically increment to Feb, Mar, Apr, etc.
- **The "Assumptions" Table:** Always separate **Formula Inputs** (numbers that might change, like tax rates or growth percentages) from the actual calculation table.
- **Excel’s Golden Rule:** 
	1. If a number can change, put it in a cell and refer to it in your formula using a cell reference.
	2. Never "hard-code" (type) a changing number directly into a formula (e.g., use `*B7` instead of `*0.05`).
	3. Label every input clearly so any user understands what the variables represent.
- **Math Logic (Factoring):** To increase a value by a percentage, you can multiply by `(1 + percentage)`. In Excel, if a cell is formatted as `105%`, multiplying by that cell is mathematically identical to multiplying by `1.05`.
- **Eliminating "Chart Junk":** Any visual element that doesn't help articulate the data or clutters the message.
    - **Redundancy:** If you add **Data Labels** (exact numbers above bars), the **Vertical Axis** becomes redundant "junk."
    - **Gridlines:** Usually considered junk if the bars are already labeled with exact values.
    - **3D Effects:** Avoid these; they make data harder to read accurately.

### ⌨️ Shortcuts & Mouse Actions
| Action                       | Shortcut / Mouse Behavior                                |
| :--------------------------- | :------------------------------------------------------- |
| **Save As**                  | `F12`                                                    |
| **Zoom In/Out**              | `Ctrl` + `Mouse Wheel`                                   |
| **Select Current Region**    | `Ctrl` + `Shift` + `8` (or `Ctrl` + `*`)                 |
| **Open Format Cells Dialog** | `Ctrl` + `1`                                             |
| **Enter Edit Mode**          | `F2`                                                     |
| **Lock Cell (Absolute)**     | `F4` (while cursor is on the reference)                  |
| **Cut and Paste**            | `Ctrl` + `X` $\rightarrow$ `Ctrl` + `V`                  |
| **Snap Chart to Grid**       | Hold `Alt` while dragging or resizing a chart            |
| **Format Chart Elements**    | Select element $\rightarrow$ `Ctrl` + `1`                |
| **Rename Sheet**             | Double-click the Sheet Tab                               |
| **Delete Chart Element**     | Click element (axis/gridline) →→ Delete                  |
| **Add Chart Elements**       | Click chart `→→` Green `+` icon (top right of chart)<br> |

### 🧮 Formulas & Math Logic
- **Linking Cells:** `=CellReference` (e.g., `=B7`). This pulls the value from the assumptions table into your main table.
- **Growth Formula:** `=Previous_Month * $Growth_Rate$`
	- **Workflow:** Type `=` $\rightarrow$ Select Jan Revenue $\rightarrow$ Type `*` $\rightarrow$ Select Growth Rate cell $\rightarrow$ Press `F4` to lock it $\rightarrow$ `Enter`.
- **Expense Calculation:** `=Revenue * $Expense_Rate$`
- **Net Income:** `=Revenue - Expenses`
- **Verification:** Always hit `F2` on the *last* cell of a dragged range to ensure the relative reference moved correctly while the absolute reference stayed locked on the assumption cell.

### 📊 Charts & Visualization
- **Selecting Data:** Highlight the labels (Months) $\rightarrow$ Hold `Ctrl` $\rightarrow$ Highlight the data (Net Income). 
- **Insertion:** Insert $\rightarrow$ Charts $\rightarrow$ 2D Clustered Column.
- **Dynamic Chart Titles:**
	- **Workflow:** Click the Chart Title once (solid border) $\rightarrow$ Click into the **Formula Bar** $\rightarrow$ Type `=` $\rightarrow$ Click the cell containing your spreadsheet title (e.g., `A1`) $\rightarrow$ `Enter`. Now, the chart title updates automatically if you change cell `A1`.
- **Formatting Series:** Use `Ctrl + 1` to open the task pane. Select "Vary colors by point" under the Fill (Paint Bucket) icon to give each bar a unique color.
- Cleaning the Visual:
	- Add Labels: Click the Green `+` →→ Check Data Labels.
	- Remove Vertical Axis: Click the numbers on the left until a selection box appears →→ Press Delete.
	- Remove Gridlines: Click a single horizontal gridline (tiny blue dots will appear on all lines) →→ Press Delete.

### 🖨️ Page Setup & Final Polish
- **Center Across Selection:** A cleaner alternative to "Merge and Center." Found in `Ctrl + 1` $\rightarrow$ Alignment Tab $\rightarrow$ Horizontal Dropdown. It centers the text across highlighted cells without actually merging them into one cell.
- **Printing Professionalism:**
	- **Orientation:** Use *Landscape* for wide tables.
	- **Centering:** Under Margins, check "Center on page: Horizontally."
	- **Footer Codes:** Use `&[File]` to show the filename and `&[Tab]` to show the sheet name.
	- **Print Area:** Highlight the table and chart $\rightarrow$ Page Layout $\rightarrow$ Print Area $\rightarrow$ Set Print Area. This prevents extra data or calculations from appearing on the printout.