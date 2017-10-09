import pandas as pd
import csv
import unicodedata

# https://stackoverflow.com/a/29247821/6669540
def normalize_caseless(text):
    return unicodedata.normalize("NFKD", text.casefold())

def caseless_equal(left, right):
    return normalize_caseless(left) == normalize_caseless(right)

def num(s):
    s = s.strip()
    return int(s) if s else 0

CAPITA_CONST = 100000

lib_file = open('raw/country-libs.csv')
libs = csv.DictReader(lib_file)

pop_file = open('raw/country-pop-worldbank.csv')
pops = csv.DictReader(pop_file)

gdp_file = open('raw/gdp-capita-worldbank.csv')
gdps = csv.DictReader(gdp_file)

rows = []

for pop in pops:
    country = pop['Country Name']
    population = num(pop['2016'])
    row = {
        'Country': country,
        'Population': population
    }

    for lib in libs:
        if caseless_equal(lib['Country'], country):
            libraries = num(lib['Public Libraries'])
            libs_per_capita = libraries/population*CAPITA_CONST if (libraries > 0 and population > 0) else -1
            if libs_per_capita > 0:
                row['Libraries'] = libraries
                row['Libraries per Capita'] = libs_per_capita
            break

    for gdp in gdps:
        if caseless_equal(gdp['Country Name'], country):
            gdp_per_capita = gdp['2016']
            row['GDP per Capita'] = gdp_per_capita
            break

    if ('Libraries per Capita' in row.keys() and 'GDP per Capita' in row.keys()):
        rows.append(row)

    lib_file.seek(0)
    gdp_file.seek(0)

df = pd.DataFrame(rows)
df.to_csv('cleaned/gdps-libraries.csv', index=False)
