#!/usr/bin/env python3
"""
Place this script inside your year folder (e.g. Learning-Log/1_Logs/2026/).
It converts private Obsidian daily logs ('24th-Saturday.md', '1st-Sunday.md')
into clean public logs ('24_Saturday.md', '01_Sunday.md') inside the month
folders in the same directory as this script (e.g. 7_October, 8_November).
"""

import argparse
import datetime
import re
from pathlib import Path

# ==============================================================================
# OPTIONAL: Paste your Obsidian folder path(s) here if you don't want to pick
# them via the popup/prompt each time. Leave empty [] to be asked automatically.
# Example:
# OBSIDIAN_SOURCE_PATHS = [r"C:\Users\SID\Documents\MyObsidianVault\DailyLogs"]
# ==============================================================================
OBSIDIAN_SOURCE_PATHS: list[str] = []

DEFAULT_YEAR = 2026
# ==============================================================================

SCRIPT_DIR = Path(__file__).resolve().parent

MONTH_NAMES = {
    "january": 1, "february": 2, "march": 3, "april": 4,
    "may": 5, "june": 6, "july": 7, "august": 8,
    "september": 9, "october": 10, "november": 11, "december": 12,
}
MONTH_NUM_TO_NAME = {v: k.capitalize() for k, v in MONTH_NAMES.items()}

# Matches Obsidian daily filenames like: 1st-Sunday.md, 24th-Saturday.md
FILENAME_RE = re.compile(
    r"^(\d{1,2})(?:st|nd|rd|th)-([A-Za-z]+)\.md$",
    re.IGNORECASE,
)

# Matches target month folders like: 7_October, 8_November, November
TARGET_MONTH_DIR_RE = re.compile(r"^(?:(\d+)_)?([A-Za-z]+)$")

# Matches date headers like: # 📅 Tuesday, 3 November 2026
DATE_HEADER_RE = re.compile(
    r"^#\s*📅\s*[A-Za-z]+,\s*\d{1,2}\s+[A-Za-z]+\s+\d{4}\s*$"
)

DO_NOT_COPY_MARKER = "<!-- DO NOT COPY BELOW THIS LINE TO GITHUB -->"


def parse_frontmatter(text: str) -> tuple[dict[str, str], str]:
    """Extract simple key: value pairs from YAML frontmatter and return (meta, body)."""
    lines = text.splitlines()
    if not lines or lines[0].strip() != "---":
        return {}, text

    end_idx = None
    for i in range(1, len(lines)):
        if lines[i].strip() == "---":
            end_idx = i
            break

    if end_idx is None:
        return {}, text

    meta: dict[str, str] = {}
    for line in lines[1:end_idx]:
        if ":" in line:
            k, v = line.split(":", 1)
            meta[k.strip().lower()] = v.strip().strip('"').strip("'")

    body = "\n".join(lines[end_idx + 1:])
    return meta, body


def infer_month_year_from_path(file_path: Path) -> tuple[int | None, int | None]:
    """Look at parent folder names (e.g. '11 November', '2026') for month and year."""
    found_month = None
    found_year = None

    for part in reversed(file_path.parents):
        name = part.name.strip()
        if found_year is None and re.fullmatch(r"20\d{2}", name):
            found_year = int(name)

        if found_month is None:
            lowered = name.lower()
            for m_name, m_num in MONTH_NAMES.items():
                if re.search(rf"\b{m_name}\b", lowered):
                    found_month = m_num
                    break

        if found_month is not None and found_year is not None:
            break

    return found_month, found_year


def resolve_true_date(
    file_path: Path,
    file_day: int,
    file_weekday: str,
    meta: dict[str, str],
    default_year: int,
) -> tuple[datetime.date, list[str]]:
    """
    Determine the canonical date for a daily log, catching typos like
    2nd-Monday.md having 'date: 2026-11-03' inside its frontmatter.
    """
    warnings: list[str] = []
    folder_month, folder_year = infer_month_year_from_path(file_path)

    fm_date: datetime.date | None = None
    if "date" in meta:
        try:
            fm_date = datetime.date.fromisoformat(meta["date"])
        except ValueError:
            warnings.append(f"Invalid frontmatter date '{meta['date']}' in {file_path.name}")

    year = folder_year or (fm_date.year if fm_date else default_year)
    month = folder_month or (fm_date.month if fm_date else None)

    if month is None:
        raise ValueError(
            f"Cannot determine month for {file_path}. Put it in a named month folder "
            f"(e.g. '10 October' / '11 November') or add 'date: YYYY-MM-DD' frontmatter."
        )

    try:
        candidate = datetime.date(year, month, file_day)
    except ValueError as exc:
        raise ValueError(f"Invalid calendar date {year}-{month:02d}-{file_day:02d} for {file_path}: {exc}")

    actual_weekday = candidate.strftime("%A")
    if actual_weekday.lower() != file_weekday.lower():
        warnings.append(
            f"Weekday mismatch for {file_path.name}: {candidate.isoformat()} is {actual_weekday}, "
            f"but filename says '{file_weekday}'."
        )

    if fm_date and fm_date != candidate:
        warnings.append(
            f"Date mismatch in {file_path.name}: filename/folder gives {candidate.isoformat()} "
            f"({actual_weekday}), but frontmatter says {fm_date.isoformat()}. Using {candidate.isoformat()}."
        )

    return candidate, warnings


def clean_public_content(raw_text: str, true_date: datetime.date) -> str:
    """Strip private Obsidian blocks and return clean public markdown."""
    _, body = parse_frontmatter(raw_text)
    lines = body.splitlines()
    out_lines: list[str] = []

    i = 0
    n = len(lines)
    in_flowchart = False

    while i < n:
        line = lines[i]
        stripped = line.strip()

        # 1. Stop completely at the private GitHub boundary
        if DO_NOT_COPY_MARKER in line:
            break

        # 2. Skip flowchart / Action-TOC up to '# Learning & Skills Log (PUBLIC)'
        if stripped.startswith("# 📑") and "Master Flowchart" in stripped:
            in_flowchart = True
            i += 1
            continue

        if in_flowchart:
            if stripped == "# Learning & Skills Log (PUBLIC)":
                in_flowchart = False
                while out_lines and out_lines[-1].strip() in ("", "---"):
                    out_lines.pop()
                if out_lines:
                    out_lines.append("")
                out_lines.append(line)
            i += 1
            continue

        # 3. Skip Obsidian MOC tip callout: >[!tip] ...
        if stripped.startswith(">[!tip]"):
            i += 1
            while i < n and lines[i].lstrip().startswith(">"):
                i += 1
            continue

        # 4. Skip Obsidian Rule callout: >[!note]- Rule ...
        if stripped.startswith(">[!note]") and "Rule" in stripped:
            i += 1
            while i < n and lines[i].lstrip().startswith(">"):
                i += 1
            continue

        # 5. Normalize the '# 📅 DayName, D Month YYYY' line to match true_date
        if DATE_HEADER_RE.match(stripped):
            expected_header = (
                f"# 📅 {true_date.strftime('%A')}, {true_date.day} "
                f"{true_date.strftime('%B')} {true_date.year}"
            )
            out_lines.append(expected_header)
            i += 1
            continue

        out_lines.append(line)
        i += 1

    while out_lines and out_lines[0].strip() == "":
        out_lines.pop(0)
    while out_lines and out_lines[-1].strip() in ("", "---"):
        out_lines.pop()

    cleaned: list[str] = []
    blank_count = 0
    for line in out_lines:
        if line.strip() == "":
            blank_count += 1
            if blank_count <= 1:
                cleaned.append("")
        else:
            blank_count = 0
            cleaned.append(line)

    return "\n".join(cleaned) + "\n"


def get_year_dir(true_year: int) -> Path:
    """
    Create/use month folders right in the same directory as the script if the
    script sits inside the year folder (e.g. .../2026/), otherwise create <year>/.
    """
    if re.fullmatch(r"20\d{2}", SCRIPT_DIR.name):
        if int(SCRIPT_DIR.name) == true_year:
            return SCRIPT_DIR
        return SCRIPT_DIR.parent / str(true_year)
    return SCRIPT_DIR / str(true_year)


def resolve_target_month_dir(year_dir: Path, month: int) -> tuple[Path, bool]:
    """
    Find existing month folder (e.g., '7_October', '8_November') inside year_dir,
    or determine the new folder path to create following existing numbering.
    Returns (path, already_exists).
    """
    month_name = MONTH_NUM_TO_NAME[month]
    numbered_folders: list[tuple[int, int]] = []

    if year_dir.exists():
        for entry in year_dir.iterdir():
            if not entry.is_dir():
                continue
            m = TARGET_MONTH_DIR_RE.match(entry.name)
            if not m:
                continue
            prefix_str, folder_m_name = m.groups()
            folder_m_num = MONTH_NAMES.get(folder_m_name.lower())
            if folder_m_num is None:
                continue

            if folder_m_num == month:
                return entry, True

            if prefix_str is not None:
                numbered_folders.append((int(prefix_str), folder_m_num))

    if numbered_folders:
        ref_prefix, ref_month = max(numbered_folders, key=lambda x: x[1])
        new_prefix = ref_prefix + (month - ref_month)
        if new_prefix < 1:
            new_prefix = max(p for p, _ in numbered_folders) + 1
    else:
        new_prefix = month

    return year_dir / f"{new_prefix}_{month_name}", False


def discover_source_files(source_paths: list[Path]) -> list[Path]:
    """Recursively find daily log .md files, skipping MOCs/system/hidden folders."""
    found: list[Path] = []
    seen: set[Path] = set()
    skip_dirs = {".obsidian", ".git", ".trash", "Archive_Legacy_Logs"}

    for src in source_paths:
        if not src.exists():
            print(f"[WARN] Source path does not exist, skipping: {src}")
            continue

        if src.is_file():
            resolved = src.resolve()
            if FILENAME_RE.match(src.name) and resolved not in seen:
                found.append(src)
                seen.add(resolved)
            continue

        for path in sorted(src.rglob("*.md")):
            if any(part in skip_dirs or part.startswith(".") for part in path.parts):
                continue
            resolved = path.resolve()
            if FILENAME_RE.match(path.name) and resolved not in seen:
                found.append(path)
                seen.add(resolved)

    return found


def prompt_for_source_folders() -> list[Path]:
    """Ask the user to pick their Obsidian folder(s) via GUI picker or terminal input."""
    picked: list[Path] = []

    try:
        import tkinter as tk
        from tkinter import filedialog

        root = tk.Tk()
        root.withdraw()
        root.attributes("-topmost", True)

        while True:
            title = (
                "Select your Obsidian Daily Logs folder (e.g. containing October & 11 November)"
                if not picked
                else "Select another Obsidian folder, or click Cancel to continue"
            )
            chosen = filedialog.askdirectory(title=title)
            if not chosen:
                break
            picked.append(Path(chosen))
            # Ask if they want to add a second folder (in case Oct & Nov are separate)
            if len(picked) == 1:
                from tkinter import messagebox
                more = messagebox.askyesno(
                    "Add another folder?",
                    f"Added:\n{chosen}\n\nDo you want to select another folder (e.g., for another month)?",
                )
                if not more:
                    break
        root.destroy()
        if picked:
            return picked
    except Exception:
        pass

    print("No Obsidian source files found in:", SCRIPT_DIR)
    print("Paste or drag-and-drop your Obsidian folder path below (press Enter on empty line when done):")
    while True:
        raw = input("> ").strip().strip('"').strip("'")
        if not raw:
            break
        picked.append(Path(raw))
    return picked


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Convert Obsidian daily logs into the month folders next to this script."
    )
    parser.add_argument(
        "--source", nargs="+", default=None,
        help="Obsidian folder(s) or .md file(s) containing 24th-Saturday.md, 1st-Sunday.md, etc."
    )
    parser.add_argument(
        "--year", type=int, default=DEFAULT_YEAR,
        help="Fallback year if not found in folder path or frontmatter."
    )
    parser.add_argument(
        "--overwrite", action="store_true",
        help="Overwrite target files if they already exist (default: skip existing)."
    )
    parser.add_argument(
        "--dry-run", action="store_true",
        help="Preview all actions without creating folders or writing files."
    )
    args = parser.parse_args()

    # 1. Decide where to read Obsidian source files from
    if args.source:
        source_paths = [Path(p) for p in args.source]
    elif OBSIDIAN_SOURCE_PATHS:
        source_paths = [Path(p) for p in OBSIDIAN_SOURCE_PATHS]
    else:
        # First check if user placed/copied raw Obsidian files inside SCRIPT_DIR
        local_files = discover_source_files([SCRIPT_DIR])
        if local_files:
            source_paths = [SCRIPT_DIR]
        else:
            source_paths = prompt_for_source_folders()

    if not source_paths:
        print("No source folder selected. Exiting.")
        return

    files = discover_source_files(source_paths)
    if not files:
        print("No matching Obsidian daily log files found (e.g. '24th-Saturday.md', '1st-Sunday.md').")
        return

    # 2. Parse, validate, and detect duplicates before touching disk
    planned: list[tuple[Path, datetime.date, str]] = []
    seen_targets: dict[tuple[int, int, str], Path] = {}

    for src_file in files:
        m = FILENAME_RE.match(src_file.name)
        assert m is not None
        file_day = int(m.group(1))
        file_weekday = m.group(2).capitalize()

        raw_text = src_file.read_text(encoding="utf-8")
        meta, _ = parse_frontmatter(raw_text)

        if "type" in meta and meta["type"].lower() != "daily-log":
            print(f"[SKIP] {src_file} (type is '{meta['type']}', not 'daily-log')")
            continue

        true_date, warnings = resolve_true_date(
            src_file, file_day, file_weekday, meta, args.year
        )
        for w in warnings:
            print(f"[WARN] {w}")

        target_filename = f"{true_date.day:02d}_{true_date.strftime('%A')}.md"
        key = (true_date.year, true_date.month, target_filename)
        if key in seen_targets:
            print(
                f"[ERROR] Duplicate target '{target_filename}' for {true_date.strftime('%B %Y')}: "
                f"{seen_targets[key]} AND {src_file}. Skipping {src_file} to avoid mixing files!"
            )
            continue
        seen_targets[key] = src_file

        cleaned_content = clean_public_content(raw_text, true_date)
        planned.append((src_file, true_date, cleaned_content))

    # 3. Write into month folders in the same directory as this script
    planned.sort(key=lambda item: item[1])
    created_dirs: set[Path] = set()
    written_count = 0
    skipped_count = 0

    print(f"Output directory: {SCRIPT_DIR}\n")

    for src_file, true_date, content in planned:
        year_dir = get_year_dir(true_date.year)
        month_dir, exists = resolve_target_month_dir(year_dir, true_date.month)

        if not exists and month_dir not in created_dirs:
            action = "WOULD CREATE DIR" if args.dry_run else "CREATE DIR"
            print(f"[{action}] {month_dir}")
            if not args.dry_run:
                month_dir.mkdir(parents=True, exist_ok=True)
            created_dirs.add(month_dir)

        target_filename = f"{true_date.day:02d}_{true_date.strftime('%A')}.md"
        dest_file = month_dir / target_filename

        if dest_file.exists() and not args.overwrite:
            print(f"[SKIP EXISTS] {dest_file}")
            skipped_count += 1
            continue

        action = "WOULD WRITE" if args.dry_run else ("OVERWRITE" if dest_file.exists() else "WRITE")
        print(f"[{action}] {src_file.name} -> {dest_file}")
        if not args.dry_run:
            dest_file.write_text(content, encoding="utf-8", newline="\n")
        written_count += 1

    print(
        f"\nDone. {'Previewed' if args.dry_run else 'Written'}: {written_count}, "
        f"Skipped (already exist): {skipped_count}"
    )


if __name__ == "__main__":
    main()