#!/bin/bash
#Morgado-Samagaio Jonathan
#TP10
#Programmation Shell 2

#Script 1 cherche
if test $# -lt 2
then
	#Test du nombre d'arguments
	echo "Il doit y avoir au minimum deux arguments"
	echo "Usage : $0 <nom de repertoire, noms de fichiers>"
	exit 1
elif test ! -d $1
then 
	#Test si le premier argument est un repertoire
	echo "Le premier argument doit être un répertoire existant"
	echo "Usage : $0 <nom de repertoire, noms de fichiers>"
	exit 2
fi
if test ! -r $1
then
	#Test si le repertoire est accessible en lecture
	"Le repertoire n'est pas accessible en lecture"
	exit 3
fi

REP=$1
shift
for FICHIER in $@
do
	if test -f $REP/$FICHIER
	#Test si le fichier existe
	then
		echo "Le fichier $FICHIER existe dans le repertoire $REP"
	else
		echo "Le fichier $FICHIER n'existe pas dans le repertoire $REP"
	fi
done
exit 0