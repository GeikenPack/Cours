#!/bin/bash
#Morgado-Samagaio Jonathan
#Script vérifiant l'égalité de trois chaines

case $# in
	0)	
		#Si aucun argument fournis, on demande a l'utilisateur de donner les trois parametres		echo "Aucun argument donne. Ecrivez les 3 chaines"
		read CH1 CH2 CH3;;
	3)
		#Si il y a le bon nombre d'argument, on les stocks dans des variables
		CH1=$1;
		CH2=$2;
		CH3=$3;;
	*)	
		#Si le nombre d'argument est différent de 3, on renvoie une erreur
		echo "Usage : $0 [<mot1> <mot2> <mot3>"
		exit 5;;
esac

if test $CH1 = $CH3
then
	if test $CH1 != $CH2
	#Test de la chaine 2
	then
		echo "Chaine 2 différente"
		exit 2
	fi
fi
if test $CH1 = $CH2
then
	if test $CH2 = $CH3
	#Test de l'egalité entiere
	then
		echo "Les 3 chaines sont identiques"
		exit 0
	else
	#Test de l'egalite de la chaine 3
		echo "Chaine 3 différente"
		exit 3
	fi
else
	if test $CH2 = $CH3
	then
	#Test de l'egalite de la chaine 3
		echo "Chaine 1 différente"
		exit 1
	else
	#Tout est inégal"
		echo "Aucune chaine identique"
		exit 4
	fi
fi

