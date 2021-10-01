#Morgado-Samagaio Jonathan
#TP7
#Find

# 1. Créer dans votre home directory : un répertoire de nom TEST puis les fichiers ordinaires fich.c fich.h main.c lib.h lib.c core et TEST/core
mkdir TEST; touch fich.c fich.h main.c lib.h lib.c core TEST/core

# 2. Afficher tous les fichiers de nom 'core' de votre home directory. Vous devez au moins retrouver les fichiers core créés à la première question (~/core et ~/TEST/core)
find -name "core"

# 3. Afficher tous les fichiers de nom 'core' de l’arborescence UNIX (Afin de ne plus obtenir les messages d’erreurs « Permission non accordée », rediriger la sortie erreur standard (2) vers le « trou noir » d’UNIX (/dev/null). Vous devez au moins retrouver les fichiers core créés à la première question.
find / -name "core" 2> /dev/null

# 4. Afficher tous les fichiers ordinaires de l’arborescence à partir de ~
find -type f

# 5. Afficher tous les fichiers de type répertoire de l’arborescence à partir de ~
find -type d

# 6. Afficher tous les fichiers sans préciser leur type qui appartiennent  au groupe utilFind sous le répertoire /
find / -group utilFind 2> /dev/null

# 7.Créer un fichier ordinaire dans le répertoire /tmp. Afficher tous les fichiers ordinaires sous /tmp qui vous appartiennent et ayant été « accédés » depuis moins d’un jour.
find /tmp -type f -user jmorgado -atime -1 2>/dev/null

# 8. Afficher tous les fichiers de suffixe .c et .h de l’arborescence à partir de ~
find -name \*.[ch]

# 9. Créer un répertoire TEST dans votre répertoire d’accueil ayant tous les droits d’accès pour le propriétaire, aucun droit pour le groupe et les autres.
mkdir ~/TEST ; chmod 700 ~/TEST

# 10. Afficher les répertoires sous votre répertoire d’accueil qui ont tous les droits d’accès pour le propriétaire, les droits de lecture et de passage (exécution) pour le groupe et les autres. Vous ne devez pas trouver le répertoire TEST.
find ~ -type d -perm 755

# 11. Créer un répertoire tp9 sous votre répertoire d'accueil et y copier tous les fichiers .c de l'arborescence /
mkdir tp9 ; find / -nam \*.c 2>/dev/null -exec cp "{}" ~/tp9 \;

# 12. Créer un fichier bidon.tmp dans chaque répertoire de l’arborescence sous votre répertoire d'accueil.
find ~ -type d -exec touch "{}"/bidon.tmp \;