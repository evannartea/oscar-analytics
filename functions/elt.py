import requests
import pandas as pd

def extract_data():
    # Define API endpoint
    url = "https://api.oscarbase.com/api/nominations"

    # Send GET request to API endpoint
    response = requests.get(url)

    # Parse response content as JSON
    nominations = response.json()

    # Create empty list to contain data
    data = []

    # Append data from API endpoint to empty list
    for nomination in nominations["data"]:
        nomination_data = {
            "nomination_id": nomination["id"],
            "ceremony_id": nomination["ceremony_id"],
            "ceremony_year": nomination["ceremony_year"],
            "category_id": nomination["category_id"],
            "category": nomination["category"],
            "movie_id": nomination["movie_id"],
            "movie": nomination["movie"],
            "nominee_id": nomination["nominee_id"],
            "nominee": nomination["nominee"],
            "is_song": nomination["is_song"],
            "winner": nomination["winner"]
        }
        data.append(nomination_data)

    df = pd.DataFrame(data)

    return df

# Export DataFrame to PostgreSQL database
def export_to_db(table_name, df, engine):
    df.to_sql(
        name=table_name,
        con=engine,
        if_exists="replace",
        index=False
    )