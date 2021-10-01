#!/bin/bash
#Verifie si le fichier en parametre existe et est executable
if test $# -eq 1
then
	if test -f $1
	then
		if test -x $1
		then
			echo "$1 est un fichier executable"
			exit 0
		else
			echo "$1 est un fichier ordinaire"
			exit 0
		fi
	elif test -d $1
    then
		echo "$1 est un repertoire"
		exit 0
    else
		echo "Usage : $0 <fichier ou repertoire>"
		exit 1
	fi
else
	echo "Usage : $0 <fichier ou repertoire>"
	echo "Il faut 1 argument"
	exit 2
fi