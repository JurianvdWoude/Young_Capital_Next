#!/usr/bin/python

from pathlib import Path

def main():
  path = Path('output', 'boodschappenlijstje.txt')

  file = open(path, 'r')
  print("Dit staat er op het boodschappenlijstje:")
  text = file.read()
  print(text)
  file.close()

  listOfItems = text.split("\n")

  file = open(path, 'a')
  vara = input("wat wil je daaran toevoegen?\n")
  if vara:
    if vara not in listOfItems:
      file.write(vara + "\n")
    else:
      print("Dat staat al in uw boodschappenlijstje!")
  else:
    print("U heeft geen item doorgegeven.")
  file.close()

if __name__ == '__main__':
  main()