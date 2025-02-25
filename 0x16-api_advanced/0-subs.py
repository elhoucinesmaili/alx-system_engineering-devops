#!/usr/bin/python3
"""
This script retrieves and returns the subscriber count of a specified subreddit.
It sends an HTTP request to the Reddit API and ensures error handling for robustness.
"""
import requests

def number_of_subscribers(subreddit):
    """
    Fetches the subscriber count for a given subreddit.
    
    Args:
        subreddit (str): Name of the subreddit to query.
    
    Returns:
        int: Number of subscribers if successful, otherwise returns 0.
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
