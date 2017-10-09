import pandas as pd
import csv
import unicodedata

homicide_file = open('raw/intentional_homicide_100k.csv')
homicides = csv.DictReader(homicide_file)

rows = {}

for homicide in homicides:
    if not homicide['Country or Area'] in rows.keys():
        rows[homicide['Country or Area']] = {
            'Year': homicide['Year'],
            'Count': homicide['Count'],
            'Rate': homicide['Rate']
        }

clean_data = []

for key,value in rows.items():
    entry = {
        'Country': key,
        'Year': value['Year'],
        'Count': value['Count'],
        'Rate': value['Rate']
    }

    clean_data.append(entry)

df = pd.DataFrame(clean_data)
df.to_csv('cleaned/homicide-country.csv', index=False)
