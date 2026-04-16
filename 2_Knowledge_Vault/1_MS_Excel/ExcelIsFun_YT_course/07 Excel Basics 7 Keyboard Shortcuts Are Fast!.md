# 📊 Excel Basics 7 Keyboard Shortcuts Are Fast!

**Tags:** #excel #excel/ribbon #excel/addin   
**Source:** [# Excel Basics 7: Keyboard Shortcuts Are Fast!](https://youtu.be/57HvO5k-iEU?si=ZPo8miBfa7RiG4k5)  
**Lab File:** [6-8 Excel Basics 7: Keyboard Shortcuts Are Fast!](file:///C:/Users/birun/Synk/Project_LIFE/Rb_Excel_Lab/6-8-QATKeyboardsDefaultAlign.xlsx)   

---
# 📅 April 16, 2026: Excel Basics - Keyboard Shortcuts & Efficiency

> [!note] Progress: 00:00 - END

### 💡 Concepts & Logic
*   **The Power of Shortcuts:** Utilizing the keyboard instead of the mouse vastly increases formatting, navigation, and calculation speed, especially in large datasets.
*   **Holding vs. Succession Keys:** 
    *   **Hold Keys:** Modifiers like `Ctrl` and `Shift` require you to hold them down simultaneously with other keys.
    *   **Succession Keys:** The `Alt` key acts sequentially. You press and release `Alt`, then press the subsequent keys one by one (e.g., `Alt` then `1` to trigger QAT actions).
*   **Absolute vs. Relative Referencing:** When copying a formula down a column, you must lock ranges that shouldn't move (Absolute Reference, using `F4`) while leaving specific criteria cells unlocked so they shift dynamically with each row (Relative Reference).
*   **Active Cell Management:** Keeping the active cell in view while highlighting massive data sets prevents you from getting visually lost in the spreadsheet. 

### ⌨️ Shortcuts & Mouse Actions

| Action | Shortcut / Mouse Behavior |
| :--- | :--- |
| **Jump to Bottom of Data** | `Ctrl` + `↓` (Stops at the last cell before an empty row) |
| **Highlight to Bottom of Data** | `Ctrl` + `Shift` + `↓` |
| **Jump to Cell A1** | `Ctrl` + `Home` |
| **Jump Back to Active Cell** | `Ctrl` + `Backspace` (Returns view to active cell without losing your highlighted selection) |
| **Access QAT (Quick Access Toolbar)** | `Alt` + `[Number]` (e.g., `Alt`, `1` to decrease decimals if set up in QAT) |
| **Highlight Entire Data Table** | `Ctrl` + `*` (Numpad) OR `Ctrl` + `Shift` + `8` (Standard Keyboard) |
| **AutoSum** | `Alt` + `=` (Press simultaneously) |
| **Select AutoComplete Function** | `↓` (to highlight function) then `Tab` (to insert and open parentheses) |
| **Lock Cell Reference (Absolute)**| `F4` (Adds `$` signs to lock row/column) |
| **Enter Data & Stay in Cell** | `Ctrl` + `Enter` (Prevents the active cell box from dropping down a row) |
| **Verify Formula (Edit Mode)** | `F2` (Highlights referenced cells in color to quickly spot errors) |
| **Copy Formula Down** | Double-Click the Fill Handle (Small green square at bottom right of the active cell) |

### 🧮 Formulas & Math Logic

*   **`SUM`**
    *   **Logic:** Quickly adds a continuous range of numbers. 
    *   **Shortcut:** Use `Alt` + `=` at the bottom of a data column to automatically wrap the data directly above it.
*   **`SUMIFS`**
    *   **Logic:** Adds specific cells based on one or multiple criteria (e.g., Summing sales totals *only* if the date matches a specific day).
    *   **Workflow:** Creating a highly efficient, copy-ready formula:
        1. Type `=SUMI` and press the `↓` arrow to highlight `SUMIFS`.
        2. Press `Tab` to lock in the function and open the parenthesis.
        3. Highlight your **Sum Range** (the numbers to add) using `Ctrl` + `Shift` + `↓`.
        4. Press `F4` to lock it (Absolute Reference). Type a comma `,`.
        5. Highlight your **Criteria Range** (the category column, like Dates) using `Ctrl` + `Shift` + `↓`.
        6. Press `F4` to lock it. Type a comma `,`.
        7. Use the `←` arrow key to select your **Criteria** (the specific date next to your formula). *Do not lock this*, as it needs to move relatively when copied down. Type `)`.
        8. Press `Ctrl` + `Enter` to apply the formula while keeping the cell selected.
        9. Double-click the Fill Handle to shoot the formula down the column.
        10. **Verification Step:** Go to the bottom-most cell of your new formulas and press `F2` to ensure the locked ranges stayed in place and the relative criteria moved down correctly.

### 🖨️ Page Setup & Final Polish 

*   **Insert Pivot Table:** Press `Alt`, `N`, `V` sequentially. 
*   **Page Setup Dialog Box:** Press `Alt`, `P`, `S`, `P` sequentially. This accesses deep printing and organization settings not immediately visible on the ribbon. 
*   **Add Borders:** After selecting the entire table (`Ctrl` + `Shift` + `8`), access the borders menu via the Home Tab font group, or right-click to use the mini-toolbar for a cleaner, polished look.