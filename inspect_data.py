import pandas as pd
from pathlib import Path

raw_folder = Path("data/raw")

for file in raw_folder.glob("*.csv"):
    print("\n" + "="*60)
    print(f"FILE: {file.name}")

    df = pd.read_csv(file)

    print(f"Rows: {df.shape[0]}")
    print(f"Columns: {df.shape[1]}")

    print("\nColumns:")
    print(df.columns.tolist())

    print("\nMissing Values:")
    print(df.isnull().sum())
