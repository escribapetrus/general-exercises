from bs4 import BeautifulSoup as soup
import requests
import csv

def get_authors(lis):
	jackie = map(lambda x: x.string, lis)
	return list(jackie)

def get_urls(lis):
	jackie = map(lambda x: x.a['href'], lis)
	return list(jackie)

def get_poem_list(url):
	author_html = requests.get(url).text
	author_soup = soup(author_html, "html.parser")
	author_articles = author_soup.findAll("article")
	author_poems = map(lambda x: {"title": x.header.a.text, "link": x.header.a['href']} ,author_articles)
	return list(author_poems)

def write_csv(a_list):
	csv_file = open("poetica.csv","w")
	csv_writer = csv.writer(csv_file)
	csv_writer.writerow(["author","title","link"])
	for a in a_list:
		for p in a['poems']:
			csv_writer.writerow([a['author'],p['title'].replace(",","|"),p['link']])
	csv_file.close()

#get each author as {'name': name, 'poems': get_poem_list(idx)}
# example: apollinaire = [{'author':library[3][0],'poems': get_poem_list(library[3][1])}]

BASE_URL = "https://www.poetica.fr/"
base_html = requests.get(BASE_URL).text
base_soup = soup(base_html, "html.parser")
author_menu = base_soup.find("ul",{"id":"menu-poemes-par-auteur"})
author_list = author_menu.findAll('li')
authors = get_authors(author_list)
urls = get_urls(author_list)
library = list(zip(authors,urls))[:-1]
all_authors = list(map(lambda x: {'author':x[0],'poems': get_poem_list(x[1])},library))

write_csv(all_authors)