import os
import pandas as pd
from dotenv import load_dotenv
from sqlalchemy import create_engine
from functions.elt import extract_data, export_to_db

def main():
    load_dotenv()
    database_url = os.getenv("DATABASE_URL")
    engine = create_engine(database_url)

    df_oscars = extract_data()

    print(len(df_oscars))

if __name__ == "__main__":
    main()