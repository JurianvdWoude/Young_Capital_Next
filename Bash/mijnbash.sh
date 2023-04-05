#! /bin/bash

if [ "$#" -lt 1 ]; then
	echo "Please add one or two arguments."
	exit 2
elif [ "$#" -gt 2 ]; then
	echo "Please add only one or two arguments. Too many arguments were added."
	exit 2
fi

file=$( grep -e . "records\\$1" );
if [ "$?" != 0 ]; then
	echo "File could not be found"
	exit
elif [ -n "$file" ]; then 
	echo "Wanneer we \"$1\" openen zien we het volgende:"
	echo "$file"
fi

if [ "$#" -eq 2 ] && [ "$2" == "w" ]; then
	echo "Wil je een nummer hieraan toevoegen?"
	read nummer 
	echo "$nummer" >> "records\\$1"
	echo "Het nummer $nummer is toegevoegd aan \"$1\"."
fi



