# 📊 Excel Basics 21 Relationships Rather than VLOOKUP for PivotTable Reports (Excel 2016 Data Model)

**Tags:** 
**Source:** [Excel Basics 21 Relationships Rather than VLOOKUP for PivotTable Reports (Excel 2016 Data Model)](https://youtu.be/yFxjkaXKjPM?si=uL9aaQRIzafZNEA9) 
**Lab File:** [Pivot Tables Relationships Start](../../../3_Projects_and_Labs/2_MS_Excel/1_ExcelIsfun_lab/21_PivotTablesRelationshipsStart.xlsm) 
**HW's:** 

---
# 📅 June 9th, 2026: PivotTables, Relationships, and the Data Model

> [!note] Progress: 00:00 - END
> In this session, we transition from memory-intensive VLOOKUP helper columns to leveraging Excel's Data Model and relationships. By connecting a central transaction table directly to independent country and product lookup tables, we eliminate over 140,000 calculation-heavy formulas. This workflow reduces workbook file size and allows us to construct a clean, multi-table PivotTable report.

---

### 💡 Concepts & Logic
*   **VLOOKUP Formula Overhead:** Adding physical columns to large datasets (e.g., 73,000 rows) using VLOOKUP copies redundant data down the sheet. This introduces thousands of cell formulas that must recalculate, leading to slow response times and bloated file sizes.
*   **The Data Model:** A "behind-the-scenes" database environment built into Excel. Instead of bringing lookup data into your sheet with cell formulas, you import the raw tables into the Data Model and link them virtually in memory.
*   **One-to-Many Relationship:**
    *   **The "One" Side (Primary/Related Table):** The lookup table (e.g., Country Lookup). Its key column must contain strictly unique, non-duplicate values. 
    *   **The "Many" Side (Foreign/Table):** The transaction or sales table (e.g., Sales Table). Its key column can have repeated occurrences of the lookup value because a country can have multiple sales.
*   **Primary Key vs. Foreign Key:**
    *   **Primary Key (Related Column):** The unique identifier column on the "One" side of the relationship (e.g., `CountryCode` in the Lookup Table).
    *   **Foreign Key (Column):** The matching column on the "Many" side of the relationship (e.g., `CountryCode` in the Sales Table).
*   **Exact Matches Only:** Unlike VLOOKUP, which can accommodate approximate matches, relationship connections in Excel's Data Model operate strictly on exact matches.
*   **Excel Version Requirements:** Creating relationships and running PivotTables from the Data Model is fully supported in basic Excel 2013 and Excel 2016. However, accessing the visual "Manage Data Model" (Power Pivot window) requires professional licensing (such as Office 365 Pro Plus, Professional Office, or Standalone Excel).
*   **Best Practice:** Always convert your raw data ranges to official Excel Tables before establishing relationships. Standard ranges are static, whereas official Excel Tables are dynamic—any added or deleted records will automatically propagate through the Data Model relationships.

---

### ⌨️ Shortcuts & Mouse Actions

| Action | Shortcut / Mouse Behavior |
| :--- | :--- |
| Convert Range to Excel Table | `Ctrl + T` |
| Create PivotTable | `Alt + N + V` (or Insert > PivotTable) |
| Save Workbook | `Ctrl + S` |
| Edit/Rename PivotTable Header | Select the header cell and press `F2` |
| Change Pivot Layout to Grid style | PivotTable Design Tab > Report Layout > Show in Tabular Form |

---

### 🧮 Formulas & Math Logic
*   **VLOOKUP vs. Relationship Logic:** 
    Instead of calculating a value row-by-row like `VLOOKUP(C18, $K$18:$L$143, 2, 0)`, Excel links tables using their common key column (e.g., `CountryCode`). When the PivotTable filters by a Country, it points across the relationship to the Sales Table and summarizes only the records belonging to that Country.
*   **Workflow for Establishing Table Relationships:**
    1. Click inside your transaction data and press `Ctrl + T` to convert it to an Excel Table. 
    2. Go to the **Table Tools Design** tab, locate **Properties**, and name the table (e.g., `SalesTable`).
    3. Repeat steps 1 and 2 for your lookup tables (e.g., `CountryLookupTable` and `ProductLookupTable`).
    4. Go to the **Data** ribbon tab. In the **Data Tools** group, click the **Relationships** button.
    5. In the *Manage Relationships* window, click **New...**.
    6. Select the transaction table under **Table** (e.g., `SalesTable`) and its key column under **Column (Foreign)** (e.g., `CountryCode`).
    7. Select the lookup table under **Related Table** (e.g., `CountryLookupTable`) and its unique key column under **Related Column (Primary)** (e.g., `CountryCode`).
    8. Click **OK**. Excel will establish a one-to-many relationship and import these tables directly into the behind-the-scenes Data Model.
    9. Repeat the process to connect any remaining lookup tables (e.g., linking the `Product` column in `SalesTable` to the `Product` column in `ProductLookupTable`).

---

### 📊 Visualization, Formatting & Polish

#### 1. Data Model Indicators in PivotTables
*   **Black Table Bars:** When setting up your PivotTable, look at the PivotTable Field List. Tables that feature a dark black line/bar at the top of their box are successfully loaded into the workbook's Data Model.
*   **Multi-Table summary:** Because your relationships are active, you can drag fields from different tables into the same PivotTable. For example, drag the `Country` field from the lookup table to the Rows area, drag `ProductCategory` from the product lookup table below it, and drag `Revenue` from the transactional Sales Table into the Values area.

#### 2. Layout, Style & Number Formatting
*   **Tabular Layout:** Switch the PivotTable layout to "Show in Tabular Form" to present your hierarchical data in a clean, side-by-side grid instead of a compressed single column.
*   **PivotTable Styles:** Apply professional color formatting using the PivotTable Design tab options (e.g., Medium style presets).
*   **Number Formatting:** Right-click a numeric value in the values column, choose **Number Format** (not "Format Cells"), select **Currency**, change decimal places to `0`, and set the Symbol to *None*.

---

### 🖨️ Verification & Final Checks
*   **Verification:** Save your file (`Ctrl + S`) and check the file size in File Explorer. Swapping VLOOKUP out for a Data Model relationship in a 73,000-row file can compress workbook storage size significantly (e.g., reducing a file from 6.1 MB down to 4.1 MB).
*   **Common Pitfalls:**
    *   **Duplicate Keys in Lookup Tables:** Ensure your lookup tables contain purely unique values in the key column. If duplicate keys exist, Excel will throw an error and refuse to construct the relationship.
    *   **Cell-Level Formatting Errors:** Never format PivotTable numbers using the standard "Format Cells" option. If the layout of the PivotTable changes or updates, cell-level formatting can easily be lost. Always use the right-click **Number Format** menu.
    *   **Greyed-out "Manage Data Model" Button:** If your "Manage Data Model" button is greyed out under the Data tab, do not panic. This is normal behavior for non-professional versions of Excel. Your relationships will still calculate and drive PivotTables perfectly.