import requests
from bs4 import BeautifulSoup



url1 =  "https://www.maxgaming.com/en/pc-accessories/mice-accessories/arm-sleeve#{}"# jeśli jest artykół na przecenie do się wywala, nie czyta z ceny z listy i lista się przesuwa
url2= "https://www.maxgaming.com/en/pc-accessories/mice-accessories/arm-sleeve?page=2"
url3="https://www.maxgaming.com/en/pc-accessories/mice-accessories/arm-sleeve?page=3"
headers = {
    "User-Agent": "Mozilla/5.0",
    "Accept": "application/json"
}
articles=[]
prizes=[]
combined_dict={}


def scrape(url):
    response = requests.get(url, headers=headers)
    soup = BeautifulSoup(response.text, "html.parser")
    for article in soup.find_all("a", class_="PT_Lank"):  # zwraca liste
        articles.append(article["title"])
    for prize_ in soup.find_all("span", class_="PT_PrisNormal"):
        prizes.append(prize_.text)
    for i in range(min(len(prizes), len(articles))):
        combined_dict[articles[i]] = prizes[i]
    return combined_dict

scrape(url1)
scrape(url2)
scrape(url3)

