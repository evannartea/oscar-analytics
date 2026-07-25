import pandas as pd
from functions.elt import extract_data, export_to_db

def main():
    df_oscars = extract_data()
    export_to_db("oscars_history", df_oscars)

    print(len(df_oscars))

if __name__ == "__main__":
    main()