import pandas as pd

# Export data from PostgreSQL to CSV files
def export_to_csv(table_name, engine):
    df = pd.read_sql(f"SELECT * FROM warehouse.{table_name}", engine)

    file_path = f"data/{table_name}.csv"
    df.to_csv(file_path, index=False)

    return file_path

print("Exported successfully!")