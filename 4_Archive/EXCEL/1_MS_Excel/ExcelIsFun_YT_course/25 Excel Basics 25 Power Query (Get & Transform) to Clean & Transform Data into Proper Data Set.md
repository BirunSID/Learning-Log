# 📊Excel Basics 25: Power Query (Get & Transform) to Clean & Transform Data into Proper Data Set

**Tags:** #excel/power_query #excel/data_cleaning #excel/etl  
**Source:** [Power Query (Get & Transform) to Clean & Transform Data into Proper Data Set](https://youtu.be/ZBQ9Is61RLY?si=k5zfE631Mwd0gqNx)   
**Lab File:** [GetAndTransformPowerQueryStart](../../../3_Projects_and_Labs/2_MS_Excel/1_ExcelIsfun_lab/25_GetAndTransformPowerQueryStart.xlsm)
**HW's:**  

---
# 📅 July 5th, 2026: Master Class - Extract, Transform, and Load (ETL) with Power Query

> [!abstract] Progress: 00:00 - END
> This session introduces Power Query (known as "Get & Transform" in Excel 2016), a tool used to import, clean, and consolidate data from external or internal sources. We explore how to fix "bad data" by splitting delimited text, assigning correct data types, and setting up an automated folder import system that dynamically updates when new text files are added.

---

### 💡 Concepts & Logic

*   **Power Query (Get & Transform):** A built-in Excel engine designed to execute ETL (Extract, Transform, Load) tasks. It allows users to clean up unstructured data, perform transformations, and load the cleaned results back into Excel.
*   **"Bad Data" vs. Proper Data Set:** "Bad data" contains multiple variables or fields packed into a single column, making sorting, filtering, and PivotTable reporting impossible. A proper data set isolates every variable into its own dedicated column with a clean header.
*   **Delimiter:** A character or set of characters used to separate individual data fields in a single line or cell (e.g., commas, semicolons, tabs, or custom strings like space-forward slash-space ` / `).
*   **Query:** Mathematically, a query is a structured question asked of a database or dataset. In Power Query, it is a sequence of recorded steps that asks: *"Can you extract this source, split this column, format these fields, and load the results?"*
*   **Data Types in Power Query:** Explicitly defining data types is crucial. If a column containing dates or numbers is set to the "Text" data type, downstream features (like PivotTable date grouping or numerical summing) will fail to work.
    *   `ABC`: Text
    *   `Calendar Icon`: Date
    *   `1.2`: Decimal Number (up to 15 decimal places)
    *   `$`: Currency (fixed decimal, up to 4 decimal places)
    *   `123`: Whole Number (no decimal values)
*   **Power Query vs. Flash Fill for Data Cleaning:**
    *   *Flash Fill:* Quick and highly effective for one-time cleaning of static, unchanging data.
    *   *Power Query:* Mandatory for dynamic datasets. When raw source data changes, or new transaction files are added to a folder, Power Query updates the output with a single click of the "Refresh" button.

---

### ⌨️ Shortcuts & Mouse Actions

| Action | Shortcut / Mouse Behavior |
| :--- | :--- |
| **Convert Range to Excel Table** | `Ctrl + T` |
| **Select Current Region** | `Ctrl + *` (or `Ctrl + Shift + 8` on the number pad) |
| **Jump to Bottom of Column** | `Ctrl + Down Arrow` |
| **Jump back to Cell A1** | `Ctrl + Home` |
| **Insert Pivot Table** | `Alt + N, V` |
| **Select Consecutive Files** | Click first file, hold `Shift`, click last file in Windows Explorer |
| **Copy File / Data** | `Ctrl + C` |
| **Paste File / Data** | `Ctrl + V` |
| **Refresh Table / Query / Pivot** | Right-click -> **Refresh** |

---

### 🧮 Formulas & Math Logic

#### Workflow 1: Split Columns and Clean Data from an Existing Excel Table
To split a multi-variable column (Product, Date, and Region) separated by a custom delimiter:
1.  Select any cell inside the dirty dataset and press `Ctrl + T` to convert it to an official Excel Table (verify "My table has headers" is checked).
2.  In the *Table Tools Design* tab, rename the table to `StartSalesTable`.
3.  Go to the **Data** tab -> Click **From Table/Range** (or **From Table** in the *Get & Transform* group). This launches the Power Query Editor.
4.  In the *Query Settings* pane on the right, rename the query to `SalesProperDataSet`.
5.  Select the **Description** column header.
6.  Go to **Home** (or **Transform**) -> **Split Column** -> **By Delimiter**.
7.  In the Split Column dialog:
    *   Change the delimiter dropdown to **--Custom--**.
    *   In the text box below, type: ` / ` (Space, Forward Slash, Space).
    *   Ensure **Each occurrence of the delimiter** is selected.
    *   Click **OK**.
8.  Rename the split columns by double-clicking each header:
    *   `Description.1` -> `Product`
    *   `Description.2` -> `Date`
    *   `Description.3` -> `Region`
    *   `Amount` -> `Sales`
9.  Explicitly assign the correct data types by clicking the type icon next to the column names:
    *   Set `Product` and `Region` to **Text** (`ABC`).
    *   Set `Date` to **Date** (Calendar icon).
    *   Set `Sales` to **Currency** (`$`).
10. Go to **Home** -> click **Close & Load** dropdown -> **Close & Load To...**.
11. In the Import Data dialog, select **Table** and **New Worksheet** -> click **OK**.
12. Build a Pivot Table (`Alt + N, V`) using the cleaned data as the source. Put it in cell `G1`. Drag `Date` to the Rows area (auto-groups to Months), drag `Product` below Months in the Rows area, and drag `Sales` to the Values area (formatted as currency).

#### Workflow 2: Import and Consolidate Multiple Text Files from a Folder
To automatically combine separate monthly text files (e.g., April and May export files) located inside a folder:
1.  Verify the flat file delimiter by opening one of the text files in Microsoft Word (with non-printing characters toggled on). Look for a right-pointing arrow (`→`), which indicates a **Tab** delimiter.
2.  In Excel, go to the **Data** tab -> **Get Data** -> **From File** -> **From Folder** (or **New Query** -> **From File** -> **From Folder**).
3.  Click **Browse**, select the target `Start` folder containing the monthly text files, and click **OK** -> **OK**.
4.  In the preview window showing the files in the directory, click the **Combine** dropdown -> Select **Combine & Edit** (or **Combine & Transform Data**).
5.  In the Combine Files window, verify the delimiter is correctly identified as **Tab** -> click **OK**.
6.  In the Power Query Editor:
    *   Select the metadata column `Source.Name` -> right-click -> **Remove** (this strips the file names if they are not needed in the dataset).
    *   Rename the columns: `Product`, `Date`, `Region`, `Sales`.
    *   Set the `Sales` data type to **Currency** (`$`).
    *   Rename the query to `MonthlyTextSalesProperDataSet`.
7.  Click **Close & Load** to output the consolidated dataset to a new worksheet (named `Clean Text Data`).

---

### 📊 Visualization, Formatting & Polish

#### 1. Managing the Applied Steps Pane
*   Every transformation step executed in Power Query is recorded sequentially under **Applied Steps** in the *Query Settings* pane.
*   **Step Rollback:** You can click on any historical step in the list to preview the data state at that exact point in time.
*   **Step Modification:** Click the small **Gear icon** next to a step (such as *Split Column by Delimiter* or *Source*) to re-open the step's dialog box and edit its settings.
*   **Step Deletion:** Click the red **`X`** next to any step to delete it and undo the transformation.

#### 2. Query Navigation and Management
*   To toggle the *Queries & Connections* sidebar pane on the right side of your Excel workbook, go to the **Data** tab -> click **Queries & Connections** (or **Show Queries** in older Excel versions).
*   Double-click a query name in this pane (or right-click -> **Edit**) to re-open it in the Power Query Editor.

---

### 🖨️ Verification & Final Checks

*   **Dynamic Data Refresh Verification (Workflow 1):**
    1.  Copy a batch of raw "bad data" records.
    2.  Paste them at the bottom of your raw Excel table (`StartSalesTable`). It will expand automatically.
    3.  Go to the cleaned worksheet tab, right-click inside the green query output table, and select **Refresh**. The new rows are automatically parsed, split, and appended.
    4.  Right-click your PivotTable -> click **Refresh** to instantly update your summary report.
*   **Dynamic Folder Import Verification (Workflow 2):**
    1.  Add new files (e.g., `03-June.txt` and `04-July.txt`) directly into your target `Start` directory folder using Windows Explorer.
    2.  Go back to your consolidated Excel sheet, right-click the query output table, and select **Refresh**. 
    3.  Observe the loading status indicator in the pane. The row count will instantly increase (e.g., from 365 rows to 481 rows) as Power Query scans the folder path, opens the new files, applies the defined tab-delimited formatting rules, and consolidates them into the master table.