#!/usr/bin/python3
"""
This script fetches data from an API and converts it to JSON format.
It retrieves user information and their corresponding tasks,
and then stores the data in a JSON file.
"""

import csv
import json
import requests
import sys

if __name__ == '__main__':
    USER_ID = sys.argv[1]
    url_to_user = 'https://jsonplaceholder.typicode.com/users/' + USER_ID
    res = requests.get(url_to_user)
    """Fetch the username from the user data"""
    USERNAME = res.json().get('username')
    
    url_to_task = url_to_user + '/todos'
    res = requests.get(url_to_task)
    tasks = res.json()

    dict_data = {USER_ID: []}
    for task in tasks:
        TASK_COMPLETED_STATUS = task.get('completed')
        TASK_TITLE = task.get('title')
        dict_data[USER_ID].append({
                                  "task": TASK_TITLE,
                                  "completed": TASK_COMPLETED_STATUS,
                                  "username": USERNAME})
    
    """Save the data to a JSON file named after the USER_ID"""
    with open('{}.json'.format(USER_ID), 'w') as f:
        json.dump(dict_data, f)
