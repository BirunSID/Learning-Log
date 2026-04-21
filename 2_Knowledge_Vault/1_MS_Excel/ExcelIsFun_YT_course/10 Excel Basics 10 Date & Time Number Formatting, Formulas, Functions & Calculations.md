# 📊Excel Basics 10: Date & Time Number Formatting, Formulas, Functions & Calculations

**Tags:** #excel #excel/date-time #excel/formatting #excel/payroll #excel/formulas #excel/data-verification #excel/shortcuts #excel/time-calculations #excel/EOMONTH #excel/EDATE
**Source:** [Excel Basics 10: Date & Time Number Formatting, Formulas, Functions & Calculations](https://youtu.be/rQh8pqICt5E?si=5Q87EekrpIle9Hyt)
**Lab File:** [Date Time Number Formatting And Calculations](<10 Excel Basics 10 Date & Time Number Formatting, Formulas, Functions & Calculations.md>)
**HW's:** 

---
# 📅 2026-04-20: Excel Date & Time Formatting, Formulas, and Payroll Calculations

> [!note] Progress: 00:00 - End

### 💡 Concepts & Logic

**The Mental Model: Formats Mask the "Real" Numbers**
To master dates and times in Excel, you must realize that what you see on the screen is an illusion created by "Number Formatting". Excel does not calculate using days, months, hours, or minutes—it calculates using **Serial Numbers** and **Decimal Proportions**. 

*   **The Underlying Nature of Dates (Serial Numbers):**
    *   Excel tracks dates as integers (whole numbers) representing the number of days since December 31, 1899.
    *   `1` = January 1, 1900.
    *   If you type `10/28/2017`, Excel applies a Date Format to make it readable for you, but underneath, it stores the serial number `43036`.
*   **The Underlying Nature of Times (Decimal Proportions):**
    *   Time is stored as a fractional proportion of a 24-hour day. 
    *   `12:00 PM` represents exactly half of the day, so its underlying value is `0.5`. 
    *   `8:00 AM` is 8/24ths of a day, which equals `0.333333333`.
*   **The "Eraser" Technique:** 
    *   To see the true underlying number of any date or time, apply the **General Number Format**. This strips away the formatting illusion and acts as an "eraser". 
*   **Static vs. Dynamic Data:** 
    *   Use shortcuts (like `Ctrl + ;`) for static, transactional data (e.g., an invoice date) so it never changes. 
    *   Use volatile functions (like `=TODAY()`) for dynamic dashboards that need to update every time you open the workbook.
*   **Text vs. Number Pitfalls:** 
    *   If you type a time without a space before AM/PM (e.g., `8:00AM` instead of `8:00 AM`), Excel left-aligns it. Left-alignment is Excel's visual cue that it has interpreted your entry as **Text**, meaning you cannot use it in math calculations. 

### ⌨️ Shortcuts & Mouse Actions

| Action | Shortcut / Mouse Behavior |
| :--- | :--- |
| **Apply General Format (The "Eraser")** | `Ctrl + Shift + ~` (Tilde) or \` (Grave Accent) |
| **Insert Static Current Date** | `Ctrl + ;` |
| **Open Format Cells Dialog** | `Ctrl + 1` |
| **Enter Data & Stay in Active Cell** | `Ctrl + Enter` |
| **Toggle Ribbon Collapse/Expand** | `Ctrl + F1` |
| **Enter Edit Mode / Verify Formula** | `F2` |
| **Fill Down** | Double-click the green fill handle (bottom-right of cell) |

### 🧮 Formulas & Math Logic

**1. Date Math Operations**
Because dates are just integers, finding the difference between two dates is simple subtraction.
*   **Standard Difference:** `=Later Date - Earlier Date` (Returns the number of days between two dates).
*   **Inclusive Difference:** `=Later Date - Earlier Date + 1` (Used when you need to count the start date as day 1, such as calculating the total days a project took).
*   **Future Date Addition:** `=Date Cell + Number of Days` (Used to find a future deadline, e.g., an invoice due in 120 days).

**2. Time Math Operations (The 24 Rule)**
Because times are decimals, subtracting them gives you a fractional proportion of a day, *not* hours. 
*   **Hours Worked Calculation:** `=(Later Time - Earlier Time) * 24`
    *   *Why?* If someone works from 8:00 AM to 12:00 PM, `0.5 - 0.333` equals `0.166666`. Multiplying that decimal by `24` (the number of hours in a day) converts it back into actual hours worked (`4`).
    *   *Order of Operations Warning:* You **must** wrap the subtraction in parentheses before multiplying by 24, otherwise Excel will multiply the Earlier Time by 24 first, breaking the formula.

**3. Key Functions**
*   **`=TODAY()`**
    *   *Logic:* An argument-less function that always returns the current system date. Volatile (updates daily).
    *   *Workflow:* Type `=TODAY()`, hit `Enter`. No arguments needed.
*   **`=EDATE(start_date, months)`**
    *   *Logic:* Returns the exact same day, `X` months in the future or past.
    *   *Workflow:* Type `=EDATE(`, click your start date cell, type a comma, then type the number of months (e.g., `2` for two months ahead, `-2` for two months backwards).
*   **`=EOMONTH(start_date, months)`**
    *   *Logic:* Calculates the *End Of the MONTH* for a date `X` months in the future or past.
    *   *Workflow:* Type `=EOMONTH(`, click your start date cell, type a comma. To find the end of the *current* month, type `0` for the months argument. 
*   **`=ROUND(number, num_digits)`**
    *   *Logic:* Rounds a number to a specified digit. Crucial in payroll because calculating wages on time-fractions (like 8:30 AM to 11:15 AM) leaves hidden, extraneous decimals. If you don't round, your bottom-line totals will look mathematically incorrect by a few pennies.
    *   *Workflow:* Type `=ROUND(`, input your wage calculation (e.g., `Hours * Hourly_Rate`), type a comma, then `2` (to round to two decimal places for cents), and close parentheses `)`.

**4. Verification Workflows**
*   **The F2 Verification:** Always press `F2` on a completed formula. Excel will color-code the referenced cells, allowing you to visually verify if you are pulling the correct data (especially critical when checking Relative vs. Absolute references).
*   **Evaluate Formula Tool:** 
    *   *Logic:* Acts as an X-ray for complex formulas, showing you step-by-step how Excel is processing the math.
    *   *Workflow:* Select the cell with the formula -> Go to `Formulas` tab -> `Formula Auditing` group -> Click `Evaluate Formula`. Click the `Evaluate` button to step through the order of operations one calculation at a time.

***