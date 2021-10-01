#!/bin/bash
#Morgado-Samagaio Jonathan
#Script affichant un menu interactif

function changerRepertoire()
{
	#Permet a l'utilisateur de changer de repertoire
	echo -e "Dans quel répertoire voullez vous aller?"
	read REPERTOIRE
	if test ! -d $REPERTOIRE
	then
		#Test si le repertoire saisie est bien un répertoire
		echo -e "Le nom saisie n'est pas un repertoire ou n'existe pas dans le repertoire courant"
		exit 10
	else
		cd $REPERTOIRE
		echo -e "Repertoire changer"
		echo -e "Vous êtes maintenant dans : $(pwd)"
	fi
}

function creerRepertoire()
{
	#Permet a l'utilisateur de créer un répertoire avec le nom voulu
	echo -e "Comment voullez vous appeler votre répertoire?"
	read NOM
	if test -d $NOM
	then
		#Test si le repertoire existe deja
		echo -e "Le nom saisie est déjà utiliser par un autre répertoire"
	else
		#Creer le repertoire
		mkdir $NOM
		echo -e "Repertoire créer"
	fi
}

function listeNbFic()
{
	#Liste et compte le nombre de fichier dans le repertoire courant
	echo -e "la liste des fichiers du répertoire courant est : $(ls -l)"
	echo -e "Il y a $(ls -l | wc -l) fichiers"
}

function afficherFichier()
{
	#Demande a l'utilisateur le fichier qu'il veut lire
	echo -e "Quel fichier voullez vous lire?"
	read FICHIER
	if test ! -f $FICHIER
	then
		#Test si le fichier existe
		echo -e "Le nom saisie n'est pas un fichier ou n'existe pas dans le repertoire courant"
		exit 40
	else
		#Lit le fichier
		more $FICHIER
	fi
}

function executFichier()
{
	#Demande a l'utilisateur quel fichier il veut executer
	echo -e "Quel fichier voullez vous executer?"
	read FICHIER
	if test ! -x $FICHIER
	then
		#Test si le fichier existe
		echo -e "Le fichier saisie n'est pas executable ou n'existe pas"
		exit 50
	else
		#Execute le fichier
		$FICHIER
	fi
}

MENU=true
while clear $MENU
do
	#Affiche un menu qui demande a l'utilisteur un choix
	echo -e "********** MENU **********"
	echo -e "Que voullez vous faire?"
	echo -e "\t1) Changer de répertoire"
	echo -e "\t2) Créer un répertoire"
	echo -e "\t3) Obtenie la liste et le nombre de fichier du répertoire courant"
	echo -e "\t4) Afficher le contenue d'un fichier texte"
	echo -e "\t5) Lancer un programme executable"
	echo -e "\t6) Quitter"
	#Fait saisir a l'utilisateur un choix
	read CHOIX
	
	case $CHOIX in
		1)
			changerRepertoire;;
		2)
			creerRepertoire;;
		3)
			listeNbFic;;
		4)
			afficherFichier;;
		5)
			executFichier;;
		6)
			MENU=false;;
		*)
			echo -e "Saisissez une valeur entre 1 et 6"
	esac
done
