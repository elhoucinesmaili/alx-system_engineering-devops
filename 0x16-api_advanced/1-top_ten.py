#!/usr/bin/python3 
"""This script fetches and prints the top 10 hot posts from a given subreddit."""
import requests

def top_ten(subreddit):
    """Retrieves and displays the top 10 post titles from a specified subreddit."""
    if subreddit is None or not isinstance(subreddit, str):
        print(None)
        return

    headers = {'User-Agent': 'selBot/2.0'}
    URL = f'https://www.reddit.com/r/{subreddit}/hot.json?limit=10'

    try:
        response = requests.get(URL, headers=headers, allow_redirects=False)
        response.raise_for_status()
        data = response.json()
        posts = data['data']['children']

        if not posts:
            print("None")
        else:
            for post in posts:
                title = post['data']['title']
                print(title)
    except requests.exceptions.RequestException:
        print(None)
    except (KeyError, ValueError):
        print(None)
