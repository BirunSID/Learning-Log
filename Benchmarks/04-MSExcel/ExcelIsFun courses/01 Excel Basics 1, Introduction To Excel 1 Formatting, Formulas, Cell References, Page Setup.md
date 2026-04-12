# 📊 Excel Basics 1: Introduction To Excel

**Tags:** #excel #excel/basics #excel/tips_tricks #excel/shortcuts #excel/practices
**Source:** [Excel Basics 1: Introduction To Excel 1](https://www.youtube.com/watch?v=uzm9m9Hw0D4)
**Lab File:** [gradebook](../lab/1_Gradebook.xlsx)

---
# 📅 05 April 2026: Navigation, Cursors, and AutoSum

> Progress: 00:00 - 26:19
### 💡 Concepts & Logic
- **Understanding Cursors:** Excel's mouse cursor changes depending on where you hover:
	- **Selection Cursor (Thick White Cross):** Appears in the *middle* of a cell. Used for selecting ranges.
	- **Move Cursor (4-Directional Arrow):** Appears on the *edges* of a selected cell. Used to move contents.
	- **Fill Handle / "Angry Rabbit" (Thin Black Cross):** Bottom-right corner. 
		- **Copies:** Plain text/numbers.
		- **Increments:** Dates, months, or "Text + Number" combinations (e.g., "Day 1" $\rightarrow$ "Day 2").
- **Formatting Rules:**
	- **Alignment:** By default, Text aligns Left; Numbers align Right.
	- **The "Squint Test":** If you squint and can't read the text against the background color, the contrast is too low. Adjust colors accordingly.
	- **Visual vs. Data:** Everything you change visually is just "cell formatting"—the underlying raw data remains unchanged.

### ⌨️ Shortcuts & Mouse Actions
| Action | Shortcut / Mouse Behavior |
| :--- | :--- |
| **Selection** | Hover middle of cell (White Cross) |
| **Move Content** | Hover edges of cell (4-Way Arrow) |
| **Auto-Fill / Increment** | Drag bottom-right corner (Angry Rabbit) |
| **Move Right** | `Tab` |
| **Move Down** | `Enter` |
| **Stay in cell after typing** | `Ctrl` + `Enter` |
| **Select entire Table/Region** | `Ctrl` + `Shift` + `8` (or `Ctrl` + `*`) |
| **AutoSum** | `Alt` + `=` |
| **Edit/Verify Mode** | `F2` |

### 🧮 Formulas
- `=SUM(range)` : Instantly totals a range of numbers.
	- **Workflow:** Select cell $\rightarrow$ `Alt` + `=` $\rightarrow$ `Enter`. (Use `F2` to verify the range).

---
# 📅 07 April 2026: Formulas, Absolute References, Formatting, & Page Setup

> Progress: 26:19 to END
### 💡 Concepts & Logic
- **Formula Activation:** Typing an `=` sign instantly turns a cell into a formula mode. 
- **Relative vs. Absolute Cell References:**
	- **Relative Reference (Default):** Normal cells (e.g., `H6`) shift relative to their position when dragged with the fill handle ("Angry Rabbit"). 
	- **Absolute Reference (`$`):** Locks a cell so it does not move when copied. For example, `$H$6` locks both column H and row 6. This is crucial when calculating percentages against a fixed total amount, ensuring the divisor doesn't shift and mess up your data.
- **Circular Reference Error:** Occurs if you accidentally include the cell containing the active formula inside the range you are trying to calculate.
- **Number Formatting:** Visually changes numbers without altering the raw data. It *does not* affect text/strings.
	- **Currency:** Adds `$`, commas, and decimals.
	- **Percentage:** Converts standard decimal division (e.g., numbers between 0 and 1) into a clean `%` with a default 2-decimal precision.
	- **Increase/Decrease Decimals:** Adjusts numerical precision cleanly.
	- **General:** Effectively acts as a reset button, erasing all applied formatting.
- **Visual Organization:** Always use subtle background colors (distinct from default white) to differentiate cells containing formulas from cells meant for raw data entry.
- **Page Setup & Printing (The 4 Tabs):**
	- **Page:** Choose Portrait vs. Landscape. Use "Fit to" to squeeze large data onto one page, or adjust scaling (e.g., 125%).
	- **Margins:** Usually left untouched, but highly useful for centering data *Horizontally* and *Vertically* on the page.
	- **Header/Footer:** Create custom headers/footers (Left, Center, Right sections). Add elements like "Page 1 of ?", Print Date, Name, and Sheet Name (pay attention to the `&` ampersand placement).
	- **Sheet:** Define specific print areas. Use "Rows/Columns to repeat at top" so headers print on every page. Best page order setting: *Down, then over*.
- **Sheet Management:** You can right-click a sheet to move/copy it within the same document or into a completely new workbook.

### ⌨️ Shortcuts & Mouse Actions
| Action | Shortcut / Mouse Behavior |
| :--- | :--- |
| **Accept Formula from Dropdown** | `Tab` *(DO NOT hit Enter, it will move to next cell)* |
| **Undo / Cancel Entry** | `Esc` |
| **Navigate Formula Dropdown** | `Up` / `Down` Arrow Keys |
| **Select Cells for Formula (Fast)** | Type `= ` $\rightarrow$ Navigate with `Arrow Keys` |
| **Ribbon Shortcut Activator** | `Alt` |
| **Open Page Setup Dialogue Box** | `Alt` $\rightarrow$ `P` $\rightarrow$ `S` $\rightarrow$ `P` |
| **Open Print Menu** | `Ctrl` + `P` |
| **Select Non-Adjacent Cells** | Hold `Ctrl` + `Left Click` multiple cells |
| **Cycle through Selected Cells** | `Enter` (While multiple cells are selected) |
| **Move a Sheet (Fast)** | Click & Drag sheet tab |
| **Copy a Sheet (Fast)** | `Ctrl` + Click & Drag sheet tab |

### 🧮 Formulas
- `=AVERAGE(range)` : Calculates the average of selected numbers.
	- **Workflow:** Type `=AV` $\rightarrow$ Use arrow keys to find AVERAGE $\rightarrow$ Press `Tab` $\rightarrow$ Select range with mouse (hold until done) $\rightarrow$ `Enter`.
- **Finding Percentages (Division):** `=Numerator / $Denominator$`
	- **Workflow:** Type `=` $\rightarrow$ Select individual score cell $\rightarrow$ Type `/` (division operator) $\rightarrow$ Select Total cell $\rightarrow$ Press `F4` (or manually type `$`) to make it Absolute $\rightarrow$ `Enter`.
	- *Note:* Use the "Angry Rabbit" to drag this down. Press `Tab` and `F2` afterward to verify that the numerator shifted relative to the row, but the total denominator stayed perfectly locked.
