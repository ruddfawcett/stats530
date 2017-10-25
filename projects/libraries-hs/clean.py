import pandas as pd
import csv

libraries = csv.DictReader(open('data/libraries-fy14.csv'))

regions_file = open('data/us-census-regions.csv')
regions = {}
for region in csv.DictReader(regions_file):
    regions[region['State Code']] = region['Region']

regions_file.seek(0)

states = {}
for state in csv.DictReader(regions_file):
    states[state['State Code']] = state['State']

grad_rate = open('data/hs-grad-rates-fy14.csv')
rates = {}
for rate in csv.DictReader(grad_rate):
    rates[rate['State']] = float(rate['Grad Rate'])

libs_clean = []

for library in libraries:
    if library['STATE'] not in states:
        continue

    tot_libs = int(library['CENTRAL LIBRARIES']) + int(library['BRANCH LIBRARIES']) + int(library['BOOKMOBILES'])
    tot_books = int(library['PRINT MATERIALS'])
    tot_ebooks = int(library['EBOOKS'])
    population = int(library['STATE POPULATION'])
    users = int(library['USERS'])

    lib = {
        'State': library['STATE'],
        'Region': regions[library['STATE']],
        'Population': population,
        'Libraries': tot_libs,
        'Libraries per HundredK': (tot_libs/population)*100000,
        'Books per HundredK': (tot_books/population)*100000,
        'Users': users,
        'Users per HundredK': (users/population)*100000,
        'Graduation Rate': rates[states[library['STATE']]]
    }
    
    print(library['STATE'])
    libs_clean.append(lib)

df = pd.DataFrame(libs_clean)
df.to_csv('data/libraries-clean.csv', index=False)
