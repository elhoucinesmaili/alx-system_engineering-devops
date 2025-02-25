#!/usr/bin/python3
"""
This script fetches and returns the number of subscribers of a given subreddit.
It makes an HTTP request to the Reddit API and handles errors gracefully.
"""
import requests

def number_of_subscribers(subreddit):
    """
    Returns the number of subscribers for a given subreddit.
    
    Args:
        subreddit (str): The name of the subreddit.
    
    Returns:
        int: The number of subscribers if successful, otherwise 0.
    """
    if subreddit is None or not isinstance(subreddit, str):
        return 0

    headers = {'User-Agent': 'selBot/1.0'}
    URL = f'https://www.reddit.com/r/{subreddit}/about.json'

    try:
        response = requests.get(URL, headers=headers, allow_redirects=False)
        response.raise_for_status()
        data = response.json()
        subscribers = data['data']['subscribers']
        return subscribers

    except requests.exceptions.RequestException:
        return 0

    except (KeyError, ValueError):
        return 0
