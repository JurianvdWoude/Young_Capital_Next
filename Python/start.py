#!/usr/bin/python

from pathlib import Path

def main():
  path = Path('output', 'boodschappenlijstje.txt')

  file = open(path, 'r')
  print("Dit staat er op het boodschappenlijstje:")
  text = file.read()
  print(text)
  file.close()

  file = open(path, 'a')
  vara = input("wat wil je daaran toevoegen?\n")
  if vara:
    file.write(vara + "\n")
  file.close()

if __name__ == '__main__':
  main()