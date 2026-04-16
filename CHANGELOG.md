# Changelog

All notable changes to the structure and methodology of the **Learning-Log** will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---
## [2.1.0] - 2026-04-15 (German learning refactor)

### added
- **master file scalability:** Implemented 4 master files that can indefinitely scale without breaking or cluttering the entire system.

### Archivals
- **Legacy_archived:** The entire German folder of v1.0 was archived in the `1_Logs/Archive_Legacy_Logs`.

---

## [2.0.0] - 2026-04-14 (The Atomic Refactor)

### Added
- **Atomic Daily Logging:** Implemented a "One File Per Day" system in `1_Logs/2026`.
- **Knowledge Vault:** A dedicated space for synthesized knowledge across all domains.
- **Project & Labs:** A structured area for code (.c, .py) and practical files (.xlsx).
- **Directory README's:** Added instructional documentation in every major subdirectory to ensure system scalability.
    - **readme for log:** added and modified it to explain the full logging system. Furthermore, it also explains why all the files and contents including and before *14th of April* are not in legacy archive.  [Readme for Log](1_Logs/readme.md)

### Changes
- **Folder Hierarchy:** 
    - Renamed `Benchmarks` to `Labs` to better reflect project-based evidence.
    - Renamed `Reports` to `Knowledge_Vault` to act as a permanent digital garden.
- **Log Logic:** Consolidated all domain-specific logs into the single daily master log.

### Archivings
- **Obsolete System Archive:** All historical records from Jan 1st to April 14th have been moved to `Logs/Archive_Legacy_System/` to clear technical debt.
- **Domain arhiving:** cs50x, math and excel logging folder has been archived and is now obsolete.

---

## [1.0.0] - 2026-01-27 (started)

### Added
- Initial repository setup.
- Monthly consolidated logging system.
- Domain folders for CS50x and German.