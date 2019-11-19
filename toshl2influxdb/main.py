#!/usr/bin/env python

import os
import time
import requests
from datetime import datetime
from influxdb import InfluxDBClient

TOKEN = os.getenv("TOKEN")
DBHOST = os.getenv("DBHOST")
DBPORT = int(os.getenv("DBPORT", "0"))
DBUSER = os.getenv("DBUSER")
DBPASS = os.getenv("DBPASS")
DBNAME = os.getenv("DBNAME")


def fetch_toshl():
    j = requests.get("https://api.toshl.com/accounts", headers={
        "Authorization": f"Bearer {TOKEN}"
    }).json()
    return sum([x['balance'] for x in j])


def write_point(money):
    client = InfluxDBClient(DBHOST, DBPORT, DBUSER, DBPASS, DBNAME)
    json_body = [
        {
            "measurement": "toshl",
            "time": datetime.today(),
            "fields": {
                "value": money
            }
        }
    ]
    client.write_points(json_body)
    client.close()


if __name__ == "__main__":
    if TOKEN is None or DBHOST is None or DBPORT == 0 or DBUSER is None or DBPASS is None or DBNAME is None:
        print("params is none, exiting...")
        exit(1)
    while True:
        money = fetch_toshl()
        print(datetime.now(), money)
        write_point(money)
        time.sleep(1800)
