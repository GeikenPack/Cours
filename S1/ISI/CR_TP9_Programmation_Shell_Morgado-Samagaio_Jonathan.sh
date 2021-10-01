#Morgado-Samagaio Jonathan
#TP9
#Programmation Shell

#Script 1
#!/bin/bash
#Reproduit le fonctionnement de mkdir
if test $# -ne 1
then
	if test -e $1
	then
		echo "Fichier deja existant"
		exit 1
	else
		mkdir $1 2>/dev/null
		if test $? -ne 0
		then
			echo "Le fichier n'a pas été créer"
			exit 2
		fi
	fi
else
	echo "Usage : $0 <nom de fichier>"
	exit 3
fi