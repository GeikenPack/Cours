#Morgado-Samagaio Jonathan
#TP7
#Redirections

# 1. Comparez les exécutions des deux commandes :
grep ^2 centdix.txt  | tail -n 1
grep ^2 centdix.txt | tail -n 1 centdix.txt
#La premiere commande prend toutes les lignes commencant par 2 et renvoie la dernieres de ces lignes. La seconde commande renvoie toute les lignes commencant par deux mais renvoie la derniere ligne du fichier. Quand on utilise |, on ne doit pas remettre le nom du fichier dans la seconde commande.

# 2. Afficher les deux premières lignes du centdixt.txt trié par ordre alphabétique.
sort -d centdix | head -n 2

# 3.Exécutez les commandes :
echo « Je suis dans : `pwd` »
echo « Je suis dans : $(pwd) »
#Les deux commandes renvoient la meme chose. Les deux écritures sont donc au final la meme chose.

# 4. Afficher la date courante dans la phrase : La date d’aujourd’hui est : date
echo " La date d'aujourd'hui est : `date`"

# 5. Créer un fichier ~/today.txt contenant la phrase de la question précédente  avec la date courante
echo " La date d'aujourd'hui est : `date`" > today.txt

# 6. Afficher la phrase : Demain ; nous partirons vers > la mer
echo "Demain ; nous partirons vers > la mer"

# 7. Afficher le nombre de répertoires de l’arborescence du répertoire tp1 (réalisé au TP1).
ls  -lR tp1| grep ^d | wc -l

# 8. Afficher les lignes du fichier centdix.txt qui contiennent la chaîne 202 après avoir remplacé tous les '1' par des '2'.
cat centdix.txt | tr 1 2 | grep "202"

# 9. Créer un fichier texte contenant quelques phrases avec des sauts de lignes et mélangeant des lettres minuscules et majuscules. Afficher à l'écran le contenu de ce  fichier dans lequel les sauts de lignes seront supprimés.
touch TP7.txt; nano tp7.txt
cat tp7.txt | grep .

# 10. Afficher à l'écran le contenu de ce fichier en faisant en sorte que toutes les lettres  soient mises en majuscule.
tr a-z A-Z < tp7.txt

# 11. Écrire une ligne de commande qui détruit un fichier et affiche « Destruction OK » si tout s'est bien passé.
touch test.txt; rm text.txt && echo "Destruction OK"

# 12. Écrire une ligne de commande qui détruit un fichier et affiche « Destruction NOK » si un problème est survenu.
touch test.txt; rm test.txt || echo "Destruction NOK"