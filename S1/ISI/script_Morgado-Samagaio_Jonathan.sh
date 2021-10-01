#!/bin/bash
#Morgado-Samagaio Jonathan
#Deplace un fichier vers une poubelle

if test $# -le 2
then
	#Test si le nombre d'arguments est correct : au moins deux arguments
	echo "Le script nécéssite au moins deux arguments"
	exit 1
elif test ! -d $1
then
	#Si le dossier n'existe pas, on le creer
	mkdir $1
fi
#On stock le nom du dossier dans une varibale pour ne garder plus que les fichiers dans la liste des arguments
REP=$1
shift
#On initialise une variable compteur pour le nombre de fichiers déplacé
CPT=0

for FICH in $@
do
	#On parcour la liste des fichiers a deplacer
	if test -f $FICH
	then
		#On test si chacun des fichiers existe, si oui, on le deplace et on incrémente le compteur
		mv $FICH $REP
		CPT=`expr $CPT + 1` 
	fi
done
#On montre combien de fichiers ont été déplacé
echo "$CPT fichiers ont été déplacé"