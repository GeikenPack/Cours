#!/bin/bash
#Morgado-Samagaio Jonathan
#TP10
#Programmation Shell 2

#Scripte 2 trouve
if test $# -lt 2
then
	#Test le nombre d'arguments
	echo "Il doit y avoir au minimum deux arguments"
	echo "Usage : $0 <mot, noms de fichiers>"
	exit 1
fi
#Sauvegarde le mot dans une variable et l'enlève de la liste des arguments
MOT=$1
shift
for FICHIER in $@
do
	if test ! -f $FICHIER
	then
	#Test si l'argument est un fichier existant
		echo "L'argument $FICHIER n'est pas un fichier"
		echo "Usage : $0 <mot, noms de fichiers>"
		exit 2
	fi
	if grep -q "$MOT" $FICHIER
	#Test si le mot est présent dans les différents fichiers donnés
	then
		echo "Le mot $MOT est présent dans le fichier $FICHIER"
	fi
done
exit 0
