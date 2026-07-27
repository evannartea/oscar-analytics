import time
import requests
import pandas as pd
from config import engine

def extract_data(endpoint):
    # Define API endpoint
    url = f"https://api.oscarbase.com/api/{endpoint}"

    # Pagination params
    page = 1
    limit = 100

    # Create empty list to store all results from every page
    all_data = []

    while True:
        # Send GET request to API endpoint
        response = requests.get(
            url,
            params= {
                "page": page,
                "limit": limit
            }
        )
        if response.status_code == 429:
            print("Rate limited. Waiting 30 seconds...")
            time.sleep(30)
            continue

        print(f"Endpoint: {endpoint} | Page: {page} | Response code: {response.status_code}")

        # Parse response content as JSON
        data = response.json()

        # Add page's record
        all_data.extend(data["data"])

        if "pagination" not in data:
            break

        # Check if last page reached
        if page >= data["pagination"]["totalPages"]:
            break

        page += 1
        time.sleep(1)

    print("Extracted successfully!")

    if endpoint == "nominations":
        # Create empty list to store response content
        nominations = []

        # Append data from API endpoints to empty list
        for nomination in all_data:
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

        for ceremony in all_data:
            ceremonies.append({
                "ceremony_id": ceremony["id"],
                "ceremony_year": ceremony["ceremony_year"],
                "ceremony_date": ceremony["date"],
                "venue": ceremony["venue"]
            })

        return pd.DataFrame(ceremonies)
    
    elif endpoint == "categories":
        categories = []

        for category in all_data:
            categories.append({
                "category_id": category["id"],
                "category_name": category["category_name"],
                "category_group": category["category_group"],
                "era": category["era"]
            })

        return pd.DataFrame(categories)

    elif endpoint == "movies":
        movies = []

        for movie in all_data:
            movies.append({
                "movie_id": movie["id"],
                "title": movie["title"],
                "release_date": movie["release_date"],
                "runtime": movie["runtime"],
                "genres": movie["genres"],
                "origin_country": movie["origin_country"]
            })

        return pd.DataFrame(movies)

    elif endpoint == "nominees":
        nominees = []

        for nominee in all_data:
            nominees.append({
                "nominee_id": nominee["id"],
                "full_name": nominee["name"],
                "birthday": nominee["birthday"],
                "deathday": nominee["deathday"],
                "birthplace": nominee["place_of_birth"]
            })

        return pd.DataFrame(nominees)

    else:
        raise ValueError("Invalid endpoint!")

# Load DataFrame to PostgreSQL database
def load_to_db(table_name, df, engine):
    df.to_sql(
        name=table_name,
        con=engine,
        schema="raw",
        if_exists="replace",
        index=False
    )

df_nods = extract_data("nominations")
df_ceremonies = extract_data("ceremonies")
df_categories = extract_data("categories")
df_movies = extract_data("movies")
df_nominees = extract_data("nominees")

load_to_db("nominations", df_nods, engine)
load_to_db("ceremonies", df_ceremonies, engine)
load_to_db("categories", df_categories, engine)
load_to_db("movies", df_movies, engine)
load_to_db("nominees", df_nominees, engine)

print("Loaded successfully!")