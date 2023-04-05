#! /bin/bash

# check dat er niet teveel of te weinig argumenten zijn meegegeven 
if [ "$#" -lt 1 ]; then
	echo "Geef tenminste het bestandsnaam mee als argument en eventueel daarna uw landcode."
	exit 2
elif [ "$#" -gt 2 ]; then
	echo "U heeft teveel argumenten gegeven."
	exit 2
fi

# haal het bestand op in de records folder
file=$( grep -e . "records\\$1" );
# check of de vorige command goed uitgevoerd is en anders stop 
if [ "$?" != 0 ]; then
	echo "We konden het bestand niet vinden in \"records\". 
		Voeg aub het juiste bestand als eerste parameter toe."
	exit
# als het bestand bestaat laat dan de inhoud zien 
elif [ -n "$file" ]; then 
	echo "Wanneer we \"$1\" openen zien we het volgende:"
	echo "$file"
fi

landcode="+31"
netnummer=""

# geef het netnummer mee als er twee parameters zijn en
# als het netnummer bestaat uit 0xx of 0xxx
if [ "$#" -eq 2 ] && [[ $2 =~ 0[0-9]{2,3} ]]; then 
	# zet het netnummer gelijke aan de tweede parameter
	netnummer="$2"
	# haal de eerste nul van het netnummer
	netnummer=${netnummer:1}
fi


echo "We gaan nu \"$landcode""$netnummer\" toevoegen aan alle nummers."

# leest de records regel voor regel en voegt het toe aan een nieuwe file
cat records\\$1 | while read line; do
	echo "$line wordt veranderd in $landcode""$netnummer""$line"
	echo "$landcode""$netnummer""$line" >> "newfile.txt"
done
