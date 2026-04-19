# 📊Excel Basics 8: Default Data Alignment In Excel & How it Can Help

**Tags:** #excel  #excel/underlying-data #excel/percentage-logic #excell/ROUND-function #excel/invoicing
**Source:** [Excel Basics 9: Number Formatting as Façade & the ROUND Function](https://youtu.be/EJXI0Puf_oQ?si=Iy9WHA0s2qCKTipm)  
**Lab File:** [Number Formatting And ROUND](../../../3_Projects_and_Labs/2_MS_Excel/1_ExcelIsfu_lab/9_NumberFormattingAndROUND.xlsx) 
**HW's:** 

---
# 📅 April 19, 2026: Number Formatting as Façade & The ROUND Function

> [!note] Progress: 00:00 — END
> This session covers the critical distinction between **displayed values** (Formatting) and **stored values** (Underlying Data), and how to use the `ROUND` function to prevent calculation errors in financial reports.

# 📅 October 26, 2023: Number Formatting as Façade & The ROUND Function

### 💡 Concepts & Logic

*   **The "Façade" Analogy:** Number formatting is like the ornate exterior of the Trevi Fountain. It changes the appearance but does not alter the internal structure. 
*   **The Invisible Decimal Pitfall:** Formatting a cell to show 2 decimal places (e.g., Currency) does **not** delete extraneous decimals (e.g., 0.00765). These hidden decimals remain in the cell's memory.
*   **Formula Blindness:** Formulas (like `SUM`) cannot "see" number formatting. They calculate using the raw, underlying number. This often leads to "Penny Errors" where the sum of displayed values doesn't match the calculated total.
*   **The General Format "Eraser":** Applying the *General* number format removes all cosmetic layers, revealing exactly what Excel is storing. Use this as a diagnostic tool.
*   **Accounting vs. Currency:**
    *   **Accounting:** Fixed dollar sign (left-aligned), zeros display as dashes (`-`), and negatives are always in parentheses.
    *   **Currency:** Floating dollar sign (stays next to the number), zeros display as `$0.00`, and negatives can be shown with a minus sign or in red.
*   **The Percentage Logic:** When you apply Percentage formatting, Excel multiplies the displayed value by 100 and adds the `%` symbol. Internally, `1%` is stored as `0.01`.
    *   *Warning:* The Ribbon percentage button defaults to **zero decimal places**, often hiding significant data (e.g., `1.45%` appearing as `1%`).

---

### ⌨️ Shortcuts & Mouse Actions

| Action | Shortcut / Mouse Behavior |
| :--- | :--- |
| **Open Format Cells Dialog** | `Ctrl` + `1` |
| **Apply AutoSum** | `Alt` + `=` |
| **Edit/Verify Cell** | `F2` (Highlights precedent cells and shows raw data) |
| **Stay in Cell after Entry** | `Ctrl` + `Enter` (Prevents the selection from moving down) |
| **Undo Last Action** | `Ctrl` + `Z` |
| **Decrease Decimal** | Ribbon: Home Tab > Number Group > Decrease Decimal icon |
| **Toggle Formula View** | `Ctrl` + `~` (Tildé) |

---

### 🧮 Formulas & Math Logic

#### 1. The ROUND Function
Use this when you need to physically remove unwanted decimals so they don't affect subsequent calculations.
*   **Syntax:** `=ROUND(number, num_digits)`
*   **Logic for `num_digits`:**
    *   `2`: Rounds to the **Penny** (Hundredths position).
    *   `0`: Rounds to the **Dollar** (Integer/Ones position).
    *   `-3`: Rounds to the **Thousands** position.

#### 2. Manual Rounding Rules
*   **4 or less:** Remove unwanted digits (Truncate).
*   **5 or more:** Add `1` to the rounding position and remove unwanted digits.

#### 3. Workflow: Rounding a Tax Calculation
If calculating tax on an invoice:
*   **Bad Practice:** `=Gross_Pay * Tax_Rate` (Result might be `52.727625`, displayed as `$52.73`).
*   **Best Practice:** `=ROUND(Gross_Pay * Tax_Rate, 2)` (Result is exactly `52.73`).
*   **Steps:**
    1.  Type `=ROUND(`.
    2.  Perform your calculation (e.g., click Gross Pay, type `*`, click Tax Rate).
    3.  Type `, 2)` to lock it to the penny.
    4.  Press `F4` on the Tax Rate reference if it needs to be an **Absolute Reference** before hitting Enter.

---

### 📊 Verification & Best Practices

*   **The Formula Bar Check:** Always look at the Formula Bar while a cell is selected. If the value there has more decimals than the cell displays, your totals will eventually be inaccurate.
*   **F2 Verification:** Use the `F2` key to audit formulas. It allows you to see the raw number while simultaneously highlighting the cells being referenced.
*   **The Rule of Thumb:** If you are multiplying decimals and the result will be used in a **Total** or **Subtotal**, you **must** use the `ROUND` function. Number formatting is for "looking at," `ROUND` is for "calculating with."

---

### 🖨️ Final Polish
*   **Consistency:** Ensure all columns in a financial table use either all *Currency* or all *Accounting* formats. Mixing them creates "Chart Junk" and makes the decimals harder to align visually.
*   **Data Entry Speed:** Format the column as *Currency* **before** typing. You can then type `45` and `Enter` instead of `$`, `4`, `5`, `.`, `0`, `0`. Excel will fill in the rest.