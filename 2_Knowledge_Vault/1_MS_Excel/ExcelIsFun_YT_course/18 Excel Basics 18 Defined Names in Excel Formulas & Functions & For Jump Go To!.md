# 📊 Excel Basics 18: Defined Names in Excel Formulas & Functions & For Jump Go To!

**Tags:** #excel/Basics #excel/DefinedNames #excel/PMTFunction #excel/SpreadsheetAudit #excel/efficiency  
**Source:** [Excel Basics 18: Defined Names in Excel Formulas & Functions & For Jump Go To!](https://youtu.be/lTvQ-D31eVo?si=G7DHBmUdL35UYWvM)  
**Lab File:** [Defined Names Start File](../../../3_Projects_and_Labs/2_MS_Excel/1_ExcelIsfun_lab/18_DefinedNamesStartFile.xlsm)
**HW's:** none here.  

---
# 📅 May 14th, 2026: Mastering Defined Names for Formulas and Navigation

> [!note] Progress: [00:00 - END]
### 💡 Concepts & Logic
* **The "Readable Formula" Goal:** Instead of `=PMT(B4, B5, B3)`, defined names allow you to write `=PMT(Month_Rate, Total_Months, Loan_Amount)`. This makes spreadsheets self-documenting and easier to audit for non-technical users.
* **The Naming Syntax (The Rules):**
	* **First Character:** Must be a letter or an underscore (`_`). Never a number.
	* **No Spaces:** Use underscores instead (e.g., `Sales_Rep`).
	* **No Conflict:** You cannot name a range "A1" or "C100" because those are already valid cell addresses.
	* **Length:** Maximum of 255 characters.
* **Default Behavior:** Defined names are **Absolute References** by default. When you use a name in a formula and drag it, the name will always point back to that specific fixed range.
* **Static vs. Dynamic:** Names created via selection are **static**. Unlike Excel Tables (`Ctrl + T`), if you add data below the named range, the name will *not* automatically expand to include the new rows unless you edit it in the Name Manager.

---

### ⌨️ Shortcuts & Mouse Actions

| Action | Shortcut / Mouse Behavior |
| :--- | :--- |
| **Open Name Manager** | `Ctrl + F3` |
| **Create Names from Selection** | `Ctrl + Shift + F3` |
| **Jump to Range** | Click the **Name Box** dropdown (top left, next to Formula Bar). |
| **Go To Dialog** | `F5` |
| **Quick Name Creation** | Select cell -> Type name in **Name Box** -> **Press Enter**. |

---

### 🧮 Formulas & Math Logic

#### 1. The PMT Function with Defined Names
* **Formula:** `=PMT(Month_Rate, Total_Months, Loan_Amount)`
* **Workflow:**
	1. Define names for your input cells (Rate, Months, Loan).
	2. Type `=PMT(`.
	3. Instead of clicking cells, start typing the names; Excel’s **Intellisense** will suggest the names (identified by the "Golden Tag" icon).
	4. Close parentheses and Enter.

#### 2. SUMIFS with Batch Names
* **Formula:** `=SUMIFS(Sales, SalesRep, "Jo")`
* **Logic:** By naming an entire column `Sales` and another `SalesRep`, you eliminate the need to highlight ranges and press `F4` to lock them. The name handles the absolute referencing automatically.

#### 3. Creating Names from Selection (The Power Move)
* **Workflow:**
	1. Highlight the data including the header row/column (e.g., A3:B6).
	2. Press `Ctrl + Shift + F3`.
	3. Select "Left Column" (if names are to the left of numbers) or "Top Row" (if names are column headers).
	4. Excel automatically converts text with spaces into valid names by inserting underscores.

---

### 📊 Navigation: Names as Bookmarks
* **Mental Model:** Treat Defined Names as "Hyperlinks."
* **Workflow:**
	1. Select a key cell on a distant worksheet (e.g., the "Cash" Ledger).
	2. Name it `Cash_Account` in the Name Box.
	3. From any other sheet, click the Name Box dropdown and select `Cash_Account`. Excel will instantly jump you to that specific sheet and cell.

---

### 📁 Management & Verification
* **Name Manager (`Ctrl + F3`):** This is the "Control Center." Use it to:
	* **Delete** broken names (REF! errors).
	* **Edit** the "Refers To" range if your data set grows.
	* **Scope:** Check if the name works for the entire **Workbook** or just a specific **Worksheet**.
* **Verification (F2):** Always press `F2` on your result. Even when using names, Excel will show color-coded boxes around the ranges being used, allowing you to visually verify the math.
