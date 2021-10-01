# !/bin/bash
if test $# -ne 1
then
	echo « Usage : $0 nombreé
	exit 1
fi
resultat = 1
while test $n -gt 1
do
	resultat = $\(expr $resultat \* $n\)
	n = $\(expr $n – 1\)
done
echo « Resultat = $resultat »
exit 0



#!/bin/bash
#Verification du nombre de parametres
if test $# -ne 1
then
	echo "Le scipte attend un et seul parametre"
	exit 1
fi

#Verification que le parametre n'existe pas deja
if test -e $1
then
	echo "Le parametre existe deja"
	exit 1
fi

REP=$1
shift

#Creation du repertoire
if ! mkdir $REP
then 
	echo "Pb a la creation du repertoire"
	exit 3
fi

#Recherche des fichiers .bak
BAK=$\(find / -type f -name "*.bak" 2>/dev/null\)

compteur=0

#on copie et compte
for fich in $BAK
do
	cp $fich $REP
	compteur = $\(expr $compteur + 1\)
done

echo "On a copie $compteur fichiers dans le repertoire $REP :"
echo -n $BAK
exit 0