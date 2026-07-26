import requests
import pandas as pd

def extract_data(endpoint):
    # Define API endpoint
    url = f"https://api.oscarbase.com/api/{endpoint}"

    # Send GET request to API endpoint
    response = requests.get(url)

    # Parse response content as JSON
    data = response.json()

    if endpoint == "nominations":
        # Create empty list to store response content
        nominations = []

        # Append data from API endpoints to empty list
        for nomination in data["data"]:
            nominations.append({
                "nomination_id": nomination["id"],
                "ceremony_id": nomination["ceremony_id"],
                "category_id": nomination["category_id"],
                "movie_id": nomination["movie_id"],
                "nominee_id": nomination["nominee_id"],
                "is_song": nomination["is_song"],
                "winner": nomination["winner"]
            })

        return pd.DataFrame(nominations)

    elif endpoint == "ceremonies":
        ceremonies = []

        for ceremony in data["data"]:
            ceremonies.append({
                "id": ceremony["id"],
                "ceremony_year": ceremony["ceremony_year"],
                "ceremony_date": ceremony["date"],
                "venue": ceremony["venue"]
            })

        return pd.DataFrame(ceremonies)
    
    elif endpoint == "categories":
        categories = []

        for category in data["data"]:
            categories.append({
                "id": category["id"],
                "category_name": category["category_name"],
                "category_group": category["category_group"],
                "era": category["era"]
            })

        return pd.DataFrame(categories)

    elif endpoint == "movies":
        movies = []

        for movie in data["data"]:
            movies.append({
                "id": movie["id"],
                "title": movie["title"],
                "release_date": movie["release_date"],
                "runtime": movie["runtime"],
                "genres": movie["genres"],
                "origin_country": movie["origin_country"]
            })

        return pd.DataFrame(movies)

    elif endpoint == "nominees":
        nominees = []

        for nominee in data["data"]:
            nominees.append({
                "id": nominee["id"],
                "full_name": nominee["name"],
                "birthday": nominee["birthday"],
                "deathday": nominee["deathday"],
                "birthplace": nominee["place_of_birth"]
            })

        return pd.DataFrame(nominees)

    else:
        raise ValueError("Invalid endpoint!")

# Export DataFrame to PostgreSQL database
def export_to_db(table_name, df, engine):
    df.to_sql(
        name=table_name,
        con=engine,
        schema="raw",
        if_exists="replace",
        index=False
    )