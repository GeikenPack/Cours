#!/bin/bash
#Jonathan Morgado-Samagaio
#TP3
#Caractères spéciaux et droits d'accès (ls, chmod)


# 1) Afficher la liste détaillée des fichiers ou répertoires de /lib dont le nom commence par lib
ls -l /lib/lib*
# 2) Afficher la liste détaillée et le contenu des fichiers ou répertoires de /usr/share  dont le nom commence par 'per' 
ls -l /usr/share/per*
# 3)  Afficher la liste détaillée des fichiers ou répertoires de /usr/share  dont le nom commence par 'per' et comporte 5 caractères
ls -ld /usr/share/per??
# 4) Afficher la liste détaillée des fichiers ou répertoires de /usr/share  dont le nom comporte la chaîne 'do'.
ls -ld /usr/share/*do*
# 5) Afficher le contenu des répertoires de /usr/share dont le nom comporte un chiffre. Interprétez le résultat : combien de répertoires, combien de fichiers …
ls -l /usr/share/*[0-9]*
# 6) Créer le répertoire tp2 dans votre répertoire d'accueil et les fichiers f1, f2, f3 et f4 dans tp2
mkdir tp2
touch tp2/f{1..4}
# 7)     7. Donner ( et tester sur Barbara) la commande de modification du droit d’accès sous forme octale et symbolique dans les cas ci-dessous. Pour chaque cas, suivez la démarche suivante : 
#		* affichez la chaîne de droits actuelle, 
#		* modifiez les droits en octal, 
#		* vérifiez la chaîne de droits,
#		* re-positionnez les droits initiaux pour le fichier,
#		* vérifiez la chaîne de droits, 
#		* modifiez les droits en symbolique, 
#		* vérifiez la chaîne de droits.
#Les différents cas sont :
#		* Le fichier f1 est accès complet pour tous et pour tout,
#		* Le fichier f2 est exécutable par tous, le propriétaire a tous les droits,
#		* Le fichier f3 n’est accessible que par son propriétaire (en lecture, écriture et exécution). Aucun droit pour les autres et le groupe.
ls -l tp2
chmod 777 tp2/f1
ls -l tp2
chmod 644 tp2/f1
ls -l tp2/f1
chmod a+x,go+w tp2/f1
ls -l tp2

ls -l tp2
chmod 755 tp2/f2
ls -l tp2
chmod 644 tp2/f2
ls -l tp2
chmod a+x tp2/f2
ls -l tp2 

ls -l tp2
chmod 700 tp2/f3
ls -l tp2
chmod 644 tp2/f3
ls -l tp2
chmod u+x,go-r tp2/f3
ls -l tp2
# 8) Supprimer les droits d’accès en lecture et modification à tous sauf au propriétaire pour le fichier f4, sans toucher aux autres droits.
chmod go-r tp2/f4
# 9) Ajouter l’accès en exécution au groupe pour le fichier f4, sans toucher aux autres droits.
chmod g+x tp2/f4
# 10) Supprimer le droit d’exécution pour tous à f2  et f4.
chmod a-x tp2/f2 tp2/f4 