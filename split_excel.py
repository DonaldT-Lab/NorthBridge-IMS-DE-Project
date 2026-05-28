import pandas as pd
from pathlib import Path

excel_file = "NorthBridgeDataset.xlsx"

output_dir = Path("data/raw")
output_dir.mkdir(parents=True, exist_ok=True)

xls = pd.ExcelFile(excel_file)

for sheet in xls.sheet_names:
    df = pd.read_excel(excel_file, sheet_name=sheet)

    filename = sheet.lower().replace(" ", "_").replace("-", "_")
    csv_path = output_dir / f"{filename}.csv"

    df.to_csv(csv_path, index=False)

    print(f"Saved: {csv_path}")