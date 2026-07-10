# 🖥️ PowerPoint DAY 2: File Management, Backstage Operations, & Collaboration

**Tags:** #powerpoint/file-management #powerpoint/collaboration #powerpoint/backstage  
**Source:** GCF LearnFree.org / GCFGlobal.org  
**Exercise File:** `Family Tree (Practice Presentation)`  
**Practice Tasks:**  ***done***
1. Open a legacy presentation file to trigger **Compatibility Mode**.  
2. Execute a file **Convert** workflow to upgrade the document database to the modern `.pptx` format.  
3. Navigate to the Backstage View and **Pin** a high-priority file to your Recent presentations list.  
4. Configure global PowerPoint options to select **Save to Computer by default**.  
5. Modify the **AutoRecover** backup frequency interval down to 5 minutes to prevent asset loss.  
6. Export the active presentation slides into an un-editable **PDF document**.  
7. Sync a project folder to **OneDrive** and toggle the modern **AutoSave** switch to **On**.

---

# 📅 Lesson: File Formats, Cloud Storage, and Legacies

> [!abstract] Executive Summary
> This lesson addresses document management, legacy version resolution, and collaborative cloud workflows within Microsoft PowerPoint. It details saving options, comparing cloud-based OneDrive synchronization to local PC directories. It also covers custom configurations for AutoSave and AutoRecover, legacy conversion pathways (resolving Compatibility Mode), multi-format export protocols (PDF, JPG, legacy PPT), and secure cloud-sharing parameters.

---

### 🎨 Design Philosophy & Visual Logic
*   **Centralized Assets & Version Control:** Dynamic cloud-based iteration depends on maintaining a single source of truth. Relying on local, static version duplicates creates fragmented edit histories.
*   **Co-Authoring Integrity:** 
    *   *Anti-Pattern:* Exporting and emailing static slides labeled `presentation_v1_edit.ppt` or `final_v2_comments.ppt`. This model disrupts version tracking and blocks concurrent multi-user authoring.
    *   *Best Practice:* Uploading presentation assets to OneDrive, locking **AutoSave On**, and distributing a singular live access link with explicit view/edit permissions to enforce continuous integration.

---

### 🛠️ Step-by-Step Technical Workflows

#### 1. Creating Presentations from Themes and Templates
1. Navigate to **File** > **New**.
2. To use a **Theme (Static Style Outline):** Select a gallery layout card (e.g., `Gallery`, `Parcel`, `Wood Type`), select a color variation, and click **Create**.
3. To use a **Template (Comprehensive Layout with Guide Copy):** Locate the search bar or select a category keyword (e.g., `Presentations`, `Business`, `Education`). Type your query (e.g., `chalkboard`), left-click a template to preview its pre-designed slide blocks and placeholder instructions, and click **Create**.

#### 2. Pinning Presentations and Folders in Backstage View
1. Navigate to **File** > **Open**.
2. Select the **Recent** category in the left pane.
3. Scroll through the presentation list on the right and locate the target file.
4. Hover the mouse cursor over the file entry to reveal the **Pushpin** icon on the right edge.
5. Left-click the **Pushpin** icon. This locks the file at the top of the interface under a dedicated **Pinned** section. Left-click the icon again to unpin.

#### 3. Converting Legacy Files and Exiting Compatibility Mode
1. Identify the **`[Compatibility Mode]`** notification displayed in the window title bar alongside the file name (indicating a legacy `.ppt` format from PowerPoint 97-2003).
2. Navigate to **File** > **Info**.
3. Click the **Convert** button under the Compatibility Mode banner.
4. In the resulting **Save As** dialog box, select your target directory.
5. Leave the file extension set as the modern standard: **PowerPoint Presentation (*.pptx)**.
6. Click **Save**. If prompted to close and reopen the file to apply modern layouts, click **Yes** to complete the database upgrade.

#### 4. Reconfiguring Default Local Save Parameters
1. Navigate to **File** > **Options**.
2. Select **Save** from the left category navigation tree.
3. Locate the **Save presentations** grouping.
4. Check the box for **"Save to Computer by default"**.
5. Locate the **"Default local file location"** text field, click browse, or input your preferred absolute directory path.
6. Click **OK** to lock in the setting.

#### 5. Exporting Presentations to Alternative Formats
1. Navigate to **File** > **Export**.
2. Select **Create PDF/XPS Document** and click the corresponding **Create PDF/XPS** button to generate an un-editable vector copy that preserves font embedding and geometry layouts.
3. Alternatively, select **Change File Type** to save the presentation in alternative formats:
    *   **PowerPoint 97-2003 Presentation (*.ppt):** Legacy compatibility.
    *   **PowerPoint Show (*.ppsx):** Opens directly into presentation projection view.
    *   **PNG / JPEG:** Converts individual slides into high-resolution flat raster images.

#### 6. Establishing Cloud-Shared Collaborative Connections
1. Click the global **Share** button located in the top-right corner of the window (or go to `File > Share`).
2. If the file is stored locally, select your connected **OneDrive - Personal** or **OneDrive - Work** folder to upload the asset.
3. Once synchronized, enter the email addresses of your co-authors in the **Invite people** box.
4. Configure edit rights (e.g., *Can Edit* or *Can View*).
5. Add an optional message and click **Share** (or generate direct hyperlinks via the **Get a sharing link** action at the bottom of the pane).

---

### ⌨️ Keyboards Shortcuts & Mouse Actions

| Desired Action | Keyboard Shortcut (PC) | Keyboard Shortcut (Mac) | Mouse / Modifier Behavior |
| :--- | :--- | :--- | :--- |
| Quick File Save | `Ctrl + S` | `Cmd + S` | Left-click the physical disk icon on the QAT |
| Open Backstage Directory | `Ctrl + O` | `Cmd + O` | Left-click `File > Open` |
| Lock File to Top | N/A | N/A | Hover over file under `File > Open > Recent` and click the **Pushpin** icon |
| AutoSave Toggle | N/A | N/A | Click the sliding toggle switch in the extreme top-left corner (Office 365 cloud files only) |

---

### 📦 Object Manipulation, Typography & Layout Settings
*   **Conversion Layout Integrity:** Upgrading legacy files (`.ppt`) to the modern XML format (`.pptx`) can cause sudden changes to slide layout geometry. Always inspect font wrapping, overlapping text box containers, and broken vector alignments immediately after executing a **Convert** workflow.
*   **AutoSave Cloud Synchronization:** When modern **AutoSave** is active (located in the top-left margin of the QAT), manual commit commands like `Ctrl + S` are bypassed. Every edit, vector modification, or text entry is saved to OneDrive in real time, enabling seamless version history tracking and co-authoring.

---

### 🎭 Motion, Transitions & Presentation Mechanics
*   **Transition Downgrades (Compatibility Mode):** While working inside legacy formats, advanced modern transitions (such as **Morph**) are disabled or substituted with standard cross-fades because older file types cannot parse modern coordinate interpolation. Use the **Convert** command to activate full translation engines and transitions.

---

### ⚠️ Common Errors & Quality Assurance
*   **The Pitfall: Lost Edits and Crash Failures:**
    *   *Issue:* Sudden system crashes or power losses can corrupt open files or lose unsaved edits.
*   **The Solution / Fix:**
    *   *Fix:* When PowerPoint is restarted after a crash, verify and recover your unsaved files using the **Document Recovery** sidebar pane on the left edge.
    *   *QA Metric:* Optimize safety parameters by navigating to `File > Options > Save`. Change the **"Save AutoRecover information every X minutes"** interval down from the standard default of `10` minutes to **`1`** or **`5`** minutes to minimize data loss.