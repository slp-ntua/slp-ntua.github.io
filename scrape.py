import ipdb
import yaml
from bs4 import BeautifulSoup
from collections import OrderedDict

publist = "potam/publications_by_year.html"



with open(publist, "r") as fd:
    html = fd.read()


soup = BeautifulSoup(html, "html.parser")

years = [list(x.stripped_strings)[0] for x in soup.find_all("h2")]

pubs = [
    [" ".join(list(y.stripped_strings)) for y in x.find_all("li")] for x in soup.find_all("ul")
][1 : len(years) + 1]


data = dict(sorted(list(zip(years, pubs)), key=lambda x: -int(x[0])))

with open("_data/publist_by_year.yml", "w") as fd:
    yaml.dump(data, fd, sort_keys=False)

