>[!warning] Obsolete System Archive (Legacy v1.0)
 

## Purpose
This directory serves as a historical record of the repository's **Version 1.0 architecture**, which was active from **January 1, 2026, to April 14, 2026.** 

It has been moved here to "clear technical debt" and separate the initial experimental logging phase from the current, scalable v2.0 system.

---

## The "v1.0" System Architecture
During this phase, the repository used a **Domain-Centric Logging** model. 
- **Methodology:** Daily progress was logged inside individual domain folders (e.g., `Benchmarks/CS50x/log/`) and then cross-linked to a main monthly markdown file.
- **Flaw:** This system was non-scalable. It created a "fragmented" file structure, making it difficult to maintain as more subjects (Math, Excel, German) were added.
- **Outcome:** On April 14, 2026, the system was refactored into the **Atomic Daily Log** model found in the current root `1_Logs/` directory.

---

## Contents of this Archive
This folder contains the original "Systematic Mess" exactly as it existed before the Great Refactor:

1. **Legacy Benchmarks:** Old domain folders containing a mix of lab work and daily logs.
2. **Legacy Reports:** Early attempts at synthesized notes before the creation of the `2_Knowledge_Vault/`.
3. **Monthly Logs:** Consolidated markdown files for January, February, and March.

---

## Archival Rules
1. **Read-Only:** No new data is to be added to this directory.
2. **Preservation:** Files are kept here to maintain the integrity of historical links and to serve as a "Proof of Consistency" for the first 100+ days of this journey.
3. **Extraction:** If a piece of knowledge from these files is deemed "Permanent," it is refactored and moved to the `Knowledge_Vault/`.

---

## Reflection: Why the Change?
A professional developer must recognize when a system is no longer serving its purpose. The v1.0 system was excellent for starting the habit of consistency, but it failed the test of **Scalability** and **Tidiness**. 

The move to **v2.0 (Atomic Logging)** represents a shift toward professional repository management, separating **Timeline** (1_Logs/), **Theory**(2_Knowledge_Vault/), and **Execution**(3_Projects_and_Labs/).

> *"We cannot solve our problems with the same thinking we used when we created them."* — This archive is proof of that improved thinking.