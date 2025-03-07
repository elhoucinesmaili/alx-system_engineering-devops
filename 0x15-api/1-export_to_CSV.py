#!/usr/bin/python3
""" Script to export user tasks to a CSV file """
import csv
import requests
import sys

if __name__ == '__main__':
    user = sys.argv[1]
    url_user = 'https://jsonplaceholder.typicode.com/users/' + user
    res = requests.get(url_user)
    """ Fetch user data """
    user_name = res.json().get('username')
    task = url_user + '/todos'
    res = requests.get(task)
    tasks = res.json()

    with open('{}.csv'.format(user), 'w') as csvfile:
        for task in tasks:
            completed = task.get('completed')
            """ Task completion status """
            title_task = task.get('title')
            """ Task title """
            csvfile.write('"{}","{}","{}","{}"\n'.format(
                user, user_name, completed, title_task))
