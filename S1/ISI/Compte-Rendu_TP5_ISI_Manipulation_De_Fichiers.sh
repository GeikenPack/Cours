#!/bin/bash
#Jonathan Morgado-Samagaio
#TP5
#Manipulations de fichiers

# 1) Combien de lignes comportent les fichiers .properties de /usr/share/scite/
wc -l /usr/share/scite/*.properties

# 2) Afficher les 5 premières lignes de votre fichier d'historique de commandes (.bash_history dans votre répertoire d'accueil). Vérifiez.
history -a; head -5 bash_history; cat .bash_history

# 3) Copier dans votre répertoire d’accueil les fichiers centdix.txt et grepTP.txt situés dans /home/unix
cp /home/unix/centdix.txt /home/unix/grepTP.txt ~

# 4) Visualiser le contenu des fichiers copiés
cat centdix.txt grepTP.txt

# 5) Afficher le fichier  centdix.txt à partir de la ligne 60.
tail +60 centdix.txt

# 6) Afficher le contenu de tous les fichiers .properties dont le nom commence par 'SciTE' du répertoire /usr/share/scite/ 
cat /usr/share/scite/SciTE*.properties

# 7) Afficher le fichier  centdix.txt dans l'ordre alphabétique de ses lignes.
sort -d centdix.txt

# 8) Afficher les lignes du fichier grepTP.txt qui contiennent le mot chaine
grep chaine grepTP.txt; cat grepTP.txt

# 9) Afficher les lignes du fichier grepTP.txt qui contiennent cpp. Vérifiez en affichant le fichier. 
grep cpp greptTP.txt; cat grepTP.txt

# 10) Afficher les lignes du fichier grepTP.txt qui commencent par la lettre C en majuscule. Vérifiez en affichant le fichier.
grep ^C grepTP.txt; cat grepTP.txt

# 11) Afficher les lignes du fichier grepTP.txt qui terminent par la lettre p en minuscule. Vérifiez en affichant le fichier.
grep p$ grepTP.txt

# 12) Afficher les lignes du fichier grepTP.txt qui terminent par un chiffre. Vérifiez en affichant le fichier.
grep [1-9]$ grepTP.txt

# 13) Afficher la liste des fichiers dont le nom termine par .txt de votre home directory qui contiennent cpp
grep -l cpp *.txt

# 14) 14.	Afficher la liste des fichiers de votre home directory qui contiennent cpp
grep -lR cpp

# 15) 15.	Créer dans le home directory deux fichiers ordinaires f1.cpp et f2.cpp
touch f{1..2}.cpp
#grep *.cpp grepTP.txt
#Cette commande cherche dans grepTP.txt les fichiers s'appelant "f1.cpp" et "f2.cpp"
#grep \*\.cpp grepTP.txt
#Cette commande cherche dans grepTP.txt toutes les lignes finissante par .cpp
#grep '\*\.cpp' grepTP.txt
#Cette commande cherche dans grepTP.txt la ligne "*.cpp"

# 16) Afficher les lignes de grepTP.txt qui contiennent  "a=$
grep '"a='$'' grepTP.txt