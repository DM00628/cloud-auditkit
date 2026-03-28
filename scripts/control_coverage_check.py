import csv
import sys
from pathlib import Path

CONTROL_REQUIRED_COLUMNS = [
    "Control ID",
    "Family",
    "Control Name",
    "Implementation Status",
    "Artifact Needed",
    "Evidence Reference",
    "Owner",
]

POAM_REQUIRED_COLUMNS = [
    "POAM ID",
    "Title",
    "Control ID",
    "Risk Level",
    "Remediation Plan",
    "Owner",
    "Status",
    "Target Completion Date",
]

ALLOWED_CONTROL_STATUS = {
    "Planned",
    "Implemented",
    "In Progress",
    "Partially Implemented",
    "Not Applicable",
}

ALLOWED_POAM_STATUS = {
    "Open",
    "In Progress",
    "Closed",
    "Risk Accepted",
}


def load_csv(path_str: str):
    path = Path(path_str)
    if not path.exists():
        raise FileNotFoundError(f"Missing file: {path}")
    with path.open(newline="", encoding="utf-8") as f:
        rows = list(csv.DictReader(f))
        headers = rows[0].keys() if rows else []
        return path, list(headers), rows


def validate_columns(headers, required, file_label):
    missing = [col for col in required if col not in headers]
    if missing:
        raise ValueError(f"{file_label} is missing required columns: {', '.join(missing)}")


def validate_control_rows(rows):
    errors = []
    for index, row in enumerate(rows, start=2):
        status = row.get("Implementation Status", "").strip()
        control_id = row.get("Control ID", "").strip()
        if not control_id:
            errors.append(f"controls/control-mapping.csv line {index}: Control ID is blank")
        if status not in ALLOWED_CONTROL_STATUS:
            errors.append(
                f"controls/control-mapping.csv line {index}: invalid Implementation Status '{status}'"
            )
        if status == "Implemented" and not row.get("Evidence Reference", "").strip():
            errors.append(
                f"controls/control-mapping.csv line {index}: Implemented control must include Evidence Reference"
            )
        if not row.get("Owner", "").strip():
            errors.append(f"controls/control-mapping.csv line {index}: Owner is blank")
    return errors


def validate_poam_rows(rows):
    errors = []
    for index, row in enumerate(rows, start=2):
        poam_id = row.get("POAM ID", "").strip()
        status = row.get("Status", "").strip()
        if not poam_id:
            errors.append(f"poam/poam-tracker.csv line {index}: POAM ID is blank")
        if status not in ALLOWED_POAM_STATUS:
            errors.append(f"poam/poam-tracker.csv line {index}: invalid Status '{status}'")
        if not row.get("Target Completion Date", "").strip():
            errors.append(
                f"poam/poam-tracker.csv line {index}: Target Completion Date is blank"
            )
    return errors


def main():
    if len(sys.argv) != 3:
        print("Usage: python scripts/control_coverage_check.py <control_csv> <poam_csv>")
        sys.exit(2)

    control_path, control_headers, control_rows = load_csv(sys.argv[1])
    poam_path, poam_headers, poam_rows = load_csv(sys.argv[2])

    validate_columns(control_headers, CONTROL_REQUIRED_COLUMNS, str(control_path))
    validate_columns(poam_headers, POAM_REQUIRED_COLUMNS, str(poam_path))

    errors = []
    errors.extend(validate_control_rows(control_rows))
    errors.extend(validate_poam_rows(poam_rows))

    if errors:
        for error in errors:
            print(f"ERROR: {error}")
        sys.exit(1)

    print("Compliance tracking files passed validation.")


if __name__ == "__main__":
    main()
