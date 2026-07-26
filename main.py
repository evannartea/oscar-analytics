import os
from dotenv import load_dotenv
from sqlalchemy import create_engine
from functions.elt import extract_data, export_to_db

def main():
    load_dotenv()
    database_url = os.getenv("DATABASE_URL")
    engine = create_engine(database_url)

    df_nods = extract_data("nominations")
    df_ceremonies = extract_data("ceremonies")
    df_categories = extract_data("categories")
    df_movies = extract_data("movies")
    df_nominees = extract_data("nominees")

    print(df_nods)
    print(df_ceremonies)
    print(df_categories)
    print(df_movies)
    print(df_nominees)

if __name__ == "__main__":
    main()