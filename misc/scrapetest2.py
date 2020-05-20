from bs4 import BeautifulSoup as soup
import requests
import csv

my_url = "https://www.poetica.fr/categories/emile-verhaeren/"
source = requests.get(my_url).text
html_page = soup(source, "lxml")
articles = html_page.findAll("article")

csv_file = open("poems.csv", "a")
csv_writer = csv.writer(csv_file)


for a in articles:
	author = html_page.h1.text
	title = a.header.a.text.replace(",","|")
	csv_writer.writerow([author,title])

csv_file.close()