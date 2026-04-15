# 📊 Excel Basics 6: Customize Quick Access Toolbar (QAT) and Show New Ribbon Tabs

**Tags:** #excel #excel/ribbon #excel/addin 
**Source:** [# Excel Basics 6 Customize Quick Access Toolbar (QAT) and Show New Ribbon Tabs](https://youtu.be/Cw40hnv3NOE?si=D9lB5Gjxp6Xt6o35)
**Lab File:** [6-8 QAT Keyboards Default Align](../../../3_Projects_and_Labs/2_MS_Excel/1_ExcelIsfu_lab/6-8-QATKeyboardsDefaultAlign.xlsx)

---
# 📅 April 15, 2026: Customizing the Quick Access Toolbar (QAT) & Ribbon Optimization

> [!abstract] Progress: 00:00 - END
> This session focuses on workspace ergonomics—minimizing "mouse travel" by centralizing frequently used tools and unlocking advanced functionality not found in the standard Ribbon tabs.

---

### 💡 Concepts & Logic
* **The "Menu Diving" Tax:** Every time you click a different Ribbon tab (Home -> Data -> Insert) to find a button, you lose time. The QAT eliminates this "tax" by keeping your top tools visible regardless of which tab is active.
* **QAT Position Strategy:** By default, the QAT is in the Title Bar (Top). Moving it **Below the Ribbon** is the professional standard because:
	1. It is closer to the grid (less mouse movement).
	2. Icons appear in color (easier to identify than the tiny white icons in the Title Bar).
* **The "Hidden Command" Logic:** Many of Excel’s most powerful features (like *Speak Cells* or *Paste as Linked Picture*) do not exist on the standard Ribbon. They must be manually added via the "Commands Not in the Ribbon" menu.
* **The April Fool’s Pitfall (Persistence):** If you toggle a state-based tool (like *Speak Cells on Enter*) to "ON" and then remove the button from your QAT, the setting **remains active**. You must re-add the button to toggle it off.

---

### ⌨️ Shortcuts & Mouse Actions

| Action | Shortcut / Mouse Behavior |
| :--- | :--- |
| **Move QAT below Ribbon** | Right-click QAT -> **Show Quick Access Toolbar Below the Ribbon** |
| **Add Button to QAT** | Right-click any Ribbon command -> **Add to Quick Access Toolbar** |
| **Advanced QAT Setup** | Right-click QAT -> **Customize Quick Access Toolbar...** |
| **Activate Edit Mode** | `F2` (Always use this to verify cell contents/math logic) |
| **Save Workbook** | `Ctrl` + `S` (Redundant on QAT; remove to save space) |
| **Undo / Redo** | `Ctrl` + `Z` / `Ctrl` + `Y` (Redundant on QAT; remove to save space) |
| **Show Hidden Ribbon Tabs** | Right-click any Tab -> **Customize the Ribbon** -> Check 'Developer' |
| **Access Add-ins** | **File** -> **Options** -> **Add-ins** -> Manage: **COM Add-ins** -> **Go** |

---

### 🧮 Workflow Logic: Advanced Commands

#### **1. Paste as Linked Picture**
*   **Logic:** Creates a dynamic "camera view" of a cell range. If the source data changes, the picture updates automatically. Ideal for dashboards with different column widths.
*   **Workflow:**
	1.  Highlight source data.
	2.  `Ctrl` + `C` (Copy).
	3.  Click the **Paste as Linked Picture** button on your customized QAT.
	4.  Verify the link by clicking the picture and looking at the Formula Bar; it should show an absolute reference (e.g., `=$C$3:$C$9`).

#### **2. Speak Cells on Enter**
*   **Logic:** Auditory verification of data entry. Excel reads the value back to you the moment you press Enter.
*   **Verification Step:** If the speech doesn't match your intended entry, use `F2` immediately to correct the cell.

---

### 📊 Charts & Visualization
* **Removing "Chart Junk":** To streamline chart creation, add the **Insert Column or Bar Chart** button to the QAT.
* **Shape Efficiency:** If you use callouts or arrows to highlight data trends, add the **Shapes** dropdown to the QAT to avoid switching to the *Insert* tab repeatedly.

---

### 🛠️ Professional Best Practices
1. **Audit with F2:** Never assume a cell value is hardcoded. Use `F2` to see if a formula is driving the result.
2. **QAT Cleanliness:** Remove the "Save", "Undo", and "Redo" buttons from the QAT. Since these are primary keyboard shortcuts (`Ctrl+S`, `Ctrl+Z`), having them on the QAT is "interface clutter."
3. **The Developer Tab:** This is hidden by default but essential for Macros and Form Controls. Enable it immediately under *Customize Ribbon*.
4. **Power Pivot Activation:** For advanced data modeling, enable the **Microsoft Power Pivot for Excel** add-in via the COM Add-ins menu.