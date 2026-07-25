import pandas as pd
from functions.elt import extract_data

def main():
    oscar_data = extract_data()
    df = pd.DataFrame(oscar_data)

    print(len(df))

if __name__ == "__main__":
    main()