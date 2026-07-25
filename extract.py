import requests
import pandas as pd

def extract_oscar_data():
    # Define API endpoint
    url = "https://api.oscarbase.com/api/nominations"

    # Send GET request to API endpoint
    response = requests.get(url)

    # Parse response content as JSON
    data = response.json()

    # Create empty list to contain data
    nominations = []

    # Append data from API endpoint to empty list
    for nomination in data["data"]:
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
        nominations.append(nomination_data)

    return nominations

data = extract_oscar_data()
df = pd.DataFrame(data)

print(df.head())