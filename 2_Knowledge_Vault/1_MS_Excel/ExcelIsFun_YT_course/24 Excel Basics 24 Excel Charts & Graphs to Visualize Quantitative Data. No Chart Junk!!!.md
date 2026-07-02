# 📊Excel Basics 24: Excel Charts & Graphs to Visualize Quantitative Data. No Chart Junk!!!

**Tags:** 
**Source:** [Excel Basics 24 Excel Charts & Graphs to Visualize Quantitative Data. No Chart Junk!!!](https://youtu.be/IY8Q2QhKzZM?si=0lNy04FNEjER4FzZ)  
**Lab File:** [Charts](../../../3_Projects_and_Labs/2_MS_Excel/1_ExcelIsfun_lab/24_Charts.xlsm)  
**HW's:**  

---
# 📅 July 2nd, 2026: Principles of Visualizing Quantitative Data

> [!note] Progress: 00:00 - END
> This session introduces the core methods of charting quantitative data in Microsoft Excel while emphasizing clean, professional presentation. We explore the creation and application of Column, Bar, Line, and XY Scatter charts, as well as the PivotChart "Recommended Charts" feature. A heavy emphasis is placed on identifying and eliminating "chart junk" to produce clear, impact-driven visual designs.

---

### 💡 Concepts & Logic
*   **Quantitative Data:** Numeric data that represents measurable quantities.
*   **The Overriding Rule (No Chart Junk):** Every element added to a chart must contribute directly to delivering the intended message. If an element does not help the reader interpret the data, it is considered *chart junk* and must be removed. Avoid:
    *   3D effects (bars, columns, or pies).
    *   Unnecessary, vibrating background patterns or gradient fills.
    *   Redundant labels (e.g., showing both exact data labels on the bars and keeping the value axis).
    *   Chaotic color schemes.
*   **The Danger of 3D Charts (The Distortion Pitfall):** 3D charts—specifically tilted 3D pie charts—are highly discouraged. Tilting a chart distorts the visual proportions of the slices; slices located near the front of the perspective look artificially larger than slices in the back, even if their numerical values are smaller.
*   **Column vs. Bar Charts:**
    *   Both are designed to compare differences across categories.
    *   **Bar Charts (Horizontal):** Excel stretches bar charts horizontally. Since computer monitors are wider than they are tall, horizontal bars have more space to expand. This makes horizontal bar charts much more forceful at highlighting categorical differences.
    *   **Label Length Rule:** If your category labels are long, use a Bar Chart. The horizontal layout lets labels read naturally from left to right on a single line instead of wrapping awkwardly or rotating diagonally.
*   **Line vs. XY Scatter Charts:**
    *   **Line Charts:** Use a Line Chart when you want to show trends over time, where the horizontal axis represents a uniform, sequential time category (e.g., Months, Quarters, Years). 
    *   **XY Scatter Charts:** Use an XY Scatter Chart when you are plotting *pairs of numbers* (independent variable $X$ vs. dependent variable $Y$) to explore relationships or correlations (e.g., Hours Studied vs. Test Score). A scatter plot treats the horizontal axis as a continuous numerical scale, not just a series of evenly spaced text categories.
*   **Chart Terminology:**
    *   **Series:** The actual quantitative numeric values being plotted (plotted as columns, bar lengths, or lines).
    *   **Category:** The descriptive labels associated with the numbers. They can appear on the horizontal axis or color-coded inside a Legend.
    *   **Markers:** The specific coordinate dots plotted on a line or scatter chart.
    *   **Trendline:** A line of best fit calculated mathematically to illustrate the general direction of a scatter plot's data points.
    *   **R-Squared ($R^2$):** A statistical metric representing the "goodness of fit" (ranging from 0 to 1), showing how closely the data points align with the trendline.

---

### ⌨️ Shortcuts & Mouse Actions

| Action | Shortcut / Mouse Behavior |
| :--- | :--- |
| **Open Format Task Pane** | Select any chart element + press `Ctrl + 1` |
| **Non-Adjacent Selection** | Highlight first range, hold `Ctrl`, highlight second range |
| **Copy Chart** | Select outer chart border + `Ctrl + C` |
| **Paste Chart** | Select landing cell + `Ctrl + V` |
| **Select All Bars in Series** | Single-click on any single bar or column |
| **Select a Single Bar** | Single-click the series, then click the target bar again (slow double-click) |
| **Select Gridlines Safely** | Click directly on one of the inner gridlines (avoids selecting the plot area) |
| **Delete Selected Element** | Select the chart element (e.g., gridlines, legend) + press `Delete` |
| **Edit Label Text Directly** | Double-click inside the text label to get a dotted border and cursor |

---

### 🧮 Formulas & Math Logic

*   **Linking Chart Titles dynamically to a Cell:**
    Instead of hardcoding a title, link it to a worksheet cell so it updates automatically if the cell text changes.
    1.  Single-click the **Chart Title** box (ensure it has a **solid line** border; a dotted border indicates text-edit mode, which will not accept cell links).
    2.  Type `=` (this immediately activates the formula bar).
    3.  Click on the cell containing the title text (e.g., cell `G1`).
    4.  Press `Enter`.

*   **Adding and Formatting a Linear Regression Trendline ($R^2$):**
    1.  Right-click on any plotted marker (dot) in your XY Scatter chart.
    2.  Click **Add Trendline...** from the context menu.
    3.  In the *Format Trendline* pane on the right, select **Linear**.
    4.  Scroll to the bottom of the pane and check the boxes:
        *   **Display Equation on chart**
        *   **Display R-squared value on chart**
    5.  Select the equation text box and use the move cursor to drag it to an uncluttered area of the chart.

---

### 📊 Visualization, Formatting & Polish

#### 1. Managing Chart Elements (The Green Plus Button)
*   Clicking the green **`+`** icon next to a selected chart opens the **Chart Elements** menu, allowing you to instantly toggle on or off:
    *   **Axes / Axis Titles**
    *   **Chart Title**
    *   **Data Labels** (shows exact numbers at the end of columns/bars)
    *   **Gridlines**
    *   **Legend**
    *   **Trendline**

#### 2. Formatting Data Series (Gap Width & Colors)
*   **Gap Width:** Controls the spacing between columns or bars. Access this by selecting the series and pressing `Ctrl + 1`.
*   **Vary Colors by Point:** Under the Paint Bucket (Fill & Line) option in the task pane, checking *Vary colors by point* automatically assigns unique colors to each individual category bar.

#### 3. Recommended Charts (Dynamic PivotChart Creation)
If you have a large transactional dataset that has not been summarized yet:
1.  Click any single cell inside the transactional range.
2.  Go to the **Insert** tab -> Click **Recommended Charts**.
3.  Excel automatically generates PivotTable summaries behind the scenes and suggests several summarized charts (e.g., *Sum of Revenue by Product*, *Average of Revenue by Product*).
4.  Select the desired summary chart and click **OK**.
5.  Excel automatically inserts a brand new worksheet containing both the compiled PivotTable and the connected PivotChart.

---

### 🖨️ Verification & Final Checks

*   **Checking for Redundancy (Chart Junk):** If you toggle **Data Labels** on to display the exact values at the end of each bar, the horizontal or vertical value axis becomes redundant. Click the value axis and press `Delete` to declutter your chart.
*   **Correcting Misplotted Time Dimensions (Line Charts):**
    When creating a Line Chart, Excel may mistakenly plot the "Year" or "Time" column as an active data series line rather than treating it as category labels for the horizontal axis. 
    *   *How to Verify & Fix:*
        1.  Right-click the chart -> click **Select Data**.
        2.  Under *Legend Entries (Series)* on the left, locate the time field (e.g., "Year") and click **Remove**.
        3.  Under *Horizontal (Category) Axis Labels* on the right, click **Edit**.
        4.  Highlight the cells in your worksheet containing the actual time values/labels.
        5.  Click **OK** -> Click **OK** to refresh the chart.
*   **Preventing Internal Chart Distortion (Moving vs. Dragging):** When repositioning a chart, make sure your mouse cursor is placed on the **outside edge/border** of the chart before dragging. Clicking and dragging the interior plot area can accidentally change the internal proportions of the chart relative to its container.