import requests
from bs4 import BeautifulSoup

url = "https://pokemon.fandom.com/wiki/List_of_Pok%C3%A9mon"
soup = BeautifulSoup(requests.get(url).text, "html.parser")

names = []
for table in soup.find_all("table"):
    for tr in table.find_all("tr"):
        tds = tr.find_all("td")
        if len(tds) >= 3:
            a = tds[2].find("a")
            if a and a.text.strip():
                names.append(a.text.strip())

with open("pokemon.txt", "w", encoding="utf-8") as f:
    for n in dict.fromkeys(names):  # remove duplicates, preserve order
        f.write(n + "\n")

print(f"Saved {len(names)} Pokémon names to pokemon.txt")

