#!/usr/bin/env python
# -*- coding: utf-8 -*-

import json

from bs4 import BeautifulSoup
import urllib.request as urllib2
import pandas as pd

URL = "file:///Users/ruddfawcett/Documents/GitHub/stats530/scrapers/guns-wopo/table.html"

HEADERS = {
    'User-Agent': 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.64 Safari/537.11',
    'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
    'Accept-Charset': 'ISO-8859-1,utf-8;q=0.7,*;q=0.3',
    'Accept-Encoding': 'none',
    'Accept-Language': 'en-US,en;q=0.8',
    'Connection': 'keep-alive'
}

def scrape_page():
    req = urllib2.Request(URL, headers=HEADERS)
    page = urllib2.urlopen(req)
    soup = BeautifulSoup(page, 'lxml')
    entries = []

    table = soup.find('table')
    print(table)

    for row in table.findAll('tr'):
        entry = {}
        cells = row.findAll('td')

        if len(cells) == 7:
            entry = {
                'Country/Territory': cells[0].find(text=True),
                'Rank by Rate of Ownership': cells[1].find(text=True),
                'Guns per 100 People': cells[2].find(text=True),
                'Total Civilian Guns': cells[3].find(text=True),
                'Total Homicides by Guns': cells[4].find(text=True),
                'Homicides by Guns per 100k People': cells[5].find(text=True),
                'Percent Homicides by Guns': cells[6].find(text=True)
            }
        else:
            continue

        entries.append(entry)

    return entries

all_entries = scrape_page()

data = pd.DataFrame(all_entries, columns=all_entries[0].keys())
data.to_json('gun-ownership-wopo.json', orient='records', lines=True)

data.set_index('Rank by Rate of Ownership', inplace=True)
data.to_csv('gun-ownership-wopo.csv')
