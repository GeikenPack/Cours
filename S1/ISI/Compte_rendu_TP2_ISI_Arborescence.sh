#TP2 ISI
#Jonathan Morgado-Samagaio

# 1) Créer sous le répertoire rep4 les fichiers
# a) une copie de fic1 en utilisant des références absolues pour le fichier source et le fichier destination.
cp ~/tp1/users/bin/rep2/fic1 ~/tp1/essai/sources/rep4

# b) fich1 : en renommant fic1 ( le fichier que vous venez de copier) en utilisant  des références absolues.
mv ~/tp1/essai/sources/rep4/fic1 ~/tp1/essai/sources/rep4/fich1

# c) fich2 : par copie de fic2 en référence relative du fichier source et du fichier destination, par rapport à votre répertoire de travail.
cp tp1/users/bin/rep2/fic2 tp1/essai/sources/rep4

# 2) Se déplacer sous le répertoire rep3 en référence relative (votre nouveau répertoire de travail doit être rep3).
cd tp1/essai/sources/rep3

# 3) Déplacer le fichier fich1 sous ce répertoire en référence relative (source et destination).
mv ../rep4/fich1 .

# 4) Créer sous le répertoire rep4 les fichiers f1,f2 et f3.
touch ../rep4/f1 ../rep4/f2 ../rep4/f3

# 5) Copier ces trois fichiers sous le répertoire users (une seule commande pour cette copie) en référence relative (source et destination).
cp ../rep4/f1 ../rep4/f2 ../rep4/f3 ../../../users/

# 6) Copier l’arborescence à partir du répertoire users sous le répertoire essai (une seule commande pour cette copie) en référence relative (source et destination).
cp -R ../../../users/ ../..

# 7) Renommer le répertoire users sous le répertoire essai en utilisateurs.
mv  ../../users ../../utilisateurs

# 8) Copier le fichier fic2 de rep2 (de users) sous le répertoire rep1 de utilisateurs en référence relative (source et destination) avec demande de confirmation.
cp -i ../../../users/bin/rep2/fic2 ../../utilisateurs/bin/rep1

# 9) Supprimer le fichier fic1 du répertoire utilisateurs avec demande de confirmation pour la suppression.
rm -i ../../utilisateurs/rep1/fic1

# 10) Supprimer le répertoire sources et son contenu avec demande de confirmation pour la suppression (une seule commande pour cette suppression). Attention, au choix du répertoire dans lequel se positionner avant de taper la commande.
rm -iR ../../sources