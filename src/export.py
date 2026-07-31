import pandas as pd
from config import engine

# Export data from PostgreSQL to CSV files
def export_to_csv(table_name, engine):
    df = pd.read_sql(f"SELECT * FROM warehouse.{table_name}", engine)

    file_path = f"data/{table_name}.csv"
    df.to_csv(file_path, index=False)

    return file_path

export_to_csv("bridge_movie_country", engine)
export_to_csv("bridge_movie_genre", engine)
export_to_csv("category_era", engine)
export_to_csv("dim_category", engine)
export_to_csv("dim_ceremony", engine)
export_to_csv("dim_country", engine)
export_to_csv("dim_genre", engine)
export_to_csv("dim_movie", engine)
export_to_csv("dim_movie_era", engine)
export_to_csv("dim_nominee", engine)
export_to_csv("fct_nods", engine)

print("Exported successfully!")