from urllib.request import urlopen as ureq
from bs4 import BeautifulSoup as soup

my_url = "https://www.poetica.fr/categories/paul-jean-toulet/"

uClient = ureq(my_url)
page_html = uClient.read()
uClient.close()

filename = "poems.csv"
headers = "author, title\n"
f = open(filename,"w")
f.write(headers)


page_soup = soup(page_html,"html.parser")
articles = page_soup.findAll("article")

for a in articles:
	title = a.header.h2.a.text
	author = page_soup.h1.text
	f.write(author + "," + title.replace(",","|") + "\n")

f.close()	