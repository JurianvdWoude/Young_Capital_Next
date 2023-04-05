#!/usr/bin/python

from pathlib import Path

def main():
  path = Path('output', 'boodschappenlijstje.txt')

  with open(path, 'r') as file:
    print("Dit staat er op het boodschappenlijstje:")
    print(file.read())

  with open(path, 'a') as file:
    vara = input("wat wil je daaran toevoegen?\n")
    file.write(vara + "\n")

if __name__ == '__main__':
  main()