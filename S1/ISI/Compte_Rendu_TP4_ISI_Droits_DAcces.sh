#!/bin/bash
#Jonathan Morgado-Samagaio
#TP4
#Droits d'acces

# 1) Créer un répertoire domy sous tp2 et un fichier f1.txt sous domy. Ecrire du texte dans f1.txt.
mkdir tp2/domy; touch tp2/domy/f1.txt
nano tp2/domy/f1.txt

# 2) Donner la commande qui permet d’afficher les droits d’accès du répertoire domy.
ls -ld tp2/domy

# 3) Retirer tous les droits d’accès à domy y compris pour le propriétaire, afficher les nouveaux droits.
chmod 000 tp2/domy; ls -l tp2

# 4) Changer de répertoire courant et se positionner sur domy. Conclure.
cd tp2/domy  #On ne peut pas se positionner dans domy car nous n'avons plus les droits.

# 5) Tester s’il est possible de modifier le contenu du fichier f1.txt. Expliquer pourquoi.
nano tp2/domy/f1.txt  #Nous ne pouvons pas le modifier car nous n'avons pas les droits pour y acceder vu que nous ne pouvons pas acceder a domy.

# 6)  Créer un autre fichier f2.txt sous domy. Conclure.
touch tp2/domy/f2.txt #Nous n'avons pas les droits de creer un fichier dans domy

# 7) Quels droits au minimum doit on avoir pouvoir créer le fichier f2.txt sous domy ? Tester et expliquer pourquoi.
chmod 300 tp2/domy; touch tp2/domy/f2.txt
#Il faut les droits d'ecriture et d'execution pour pouvoir creer un fichier.Il faut le droit d'ecriture pour pouvoir creer le fichier et le droit d'execution pour parcourir domy

# 8) Positionner les droits d’accès minimum au fichier f1.txt et au répertoire domy pour montrer que l’on peut accéder à un fichier dont on connaît le nom sans avoir tous les droits sur le répertoire et le fichier. Deux cas d’accès sont à considérer séparément :
# 1er cas: on souhaite donner les droits au minimum à domy et f1.txt pour faire cat domy/f1.txt
chmod 100 tp2/domy; chmod 400 tp2/domy/f1.txt; cat tp2/domy/f1.txt

# 2eme cas: on souhaite donner les droits au minimum à domy et f1.txt pour faire echo « du texte » >> domy/f1.txt
chmod 100 tp2/domy; chmod 200 tp2/domy/f1.txt; echo bonjour >> tp2/domy/f1.txt

# 9) Afficher votre masque. Créer des fichiers et répertoires puis vérifier les droits des fichiers créés.
chmod 700tp2/domy; umask; mkdir tp2/domy/tst; touch tp2/domy/tst/f5.txt; ls -lR tp2/domy

# 10) Quel est le masque pour supprimer la permission de lecture et d’écriture aux autres ? Donner la commande permettant de modifier le masque.  Créer des fichiers et répertoires puis vérifier les droits des fichiers créés.
#Masque necessaire 0077
umask 0077; mkdir tp2/domy/tst/ndroits; touch tp2/domy/tst/ndroits/f4.txt; ls -lR tp2/domy/tst
