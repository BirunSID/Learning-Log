# 📊 Excel Basics 2: Introduction To Excel 2

**Tags:** #excel #excel/basics #excel/shortcuts #excel/tips_tricks #excel/summing #excel/counting 
**Source:** [# Excel Basics 3: # Intro Excel #3](https://youtu.be/fQsz6mKDobE?si=J9f8I0wXeFYxhgEZ)
**Lab File:** [click here](./../lab/3_CountingAddingWithCriteria.xlsx) --> **Home works done locally**

---

# 📅 9 April 2026: Counting & Adding with Criteria

> Progress: 00:00 - END
### 💡 Concepts & Logic
- **Counting vs. Adding:** 
	- **Counting:** Determines *how many* items or records exist (1, 2, 3...). 
	- **Adding (Summing):** Calculates the *total value* of numbers within those records ($100 + $200...).
- **The "S" in Functions:** Always prefer functions ending in "S" (e.g., `COUNTIFS`, `SUMIFS`). 
	- They allow for one *or more* conditions.
	- The argument structure is more logical and consistent than the older, non-S versions.
- **Criteria & Conditions:** When you specify a criteria, you are telling Excel: "Don't calculate everything; only look for items that meet this specific requirement."
- **The "Invisible" Character Trap:** Excel is literal. A cell containing `"Gigi"` is **not** the same as a cell containing `"Gigi "` (with an extra space). Spaces are characters. If your formula isn't working, check for trailing spaces using `F2`.
- **The Status Bar (Quick Check):** A powerful verification tool. If you highlight a range of cells, look at the bottom right of the Excel window. It automatically displays the **Average**, **Count**, and **Sum** of your selection.

### ⌨️ Shortcuts & Mouse Actions
| Action | Shortcut / Mouse Behavior |
| :--- | :--- |
| **AutoSum** | `Alt` + `=` |
| **Select Non-Adjacent Cells** | Hold `Ctrl` + `Left Click` |
| **Verify Cell Content** | `F2` |
| **Undo Action** | `Ctrl` + `Z` |
| **Quick Calculation View** | Look at the **Status Bar** (Bottom Right) |

### 🧮 Formulas & Math Logic
- **`=COUNT(range)`**: Counts only cells containing **Numbers**.
- **`=COUNTA(range)`**: Counts cells that are **Not Empty** (counts text, numbers, and dates). *Think: "Count All".*
- **`=COUNTBLANK(range)`**: Counts only **Empty** cells. Useful for finding missing data in a table.
- **`=SUM(range)`**: Totals all numeric values in a selection.

#### Formulas with Criteria
- **`=COUNTIFS(criteria_range1, criteria1)`**
	- **Logic:** "Look through this list, and count every time you see this specific item."
	- **Workflow:** Type `=COUNTIFS(` $\rightarrow$ Select the column of labels (e.g., SalesReps) $\rightarrow$ Type `,` $\rightarrow$ Select the cell containing the name you want to count $\rightarrow$ `Enter`.
- **`=SUMIFS(sum_range, criteria_range1, criteria1)`**
	- **Logic:** "Look through the criteria list for a match, but pull the numbers to add from the sum_range."
	- **Workflow:** Type `=SUMIFS(` $\rightarrow$ Select the column of **Values** to add $\rightarrow$ Type `,` $\rightarrow$ Select the column of **Labels** to filter by $\rightarrow$ Type `,` $\rightarrow$ Select the specific criteria cell $\rightarrow$ `Enter`.
	- **Note:** The `sum_range` and `criteria_range` **must** be the same size (e.g., Row 5 to Row 13). If they don't match, Excel will return an error.

### 🛠️ Best Practices & Verification
- **Dynamic Criteria:** Always link your `IFS` formulas to a cell containing the criteria (like the "Assumptions" table logic). If you change "Gigi" to "Chin" in that cell, all your counts and sums will update instantly.
- **Manual Verification:** Use the `Ctrl` + `Click` method to highlight the specific cells that meet your criteria, then glance at the **Status Bar** to see if the sum/count matches your formula result.
