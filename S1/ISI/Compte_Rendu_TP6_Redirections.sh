#Morgado-Samagaio Jonathan
#TP6
#Redirections

# 1. Give the command to record the content of your home directory (detailed list of all files and folders) in a res.txt file in your home directory. Check by showing the content of the res.txt file.
ls -alR> res.txt; cat res.txt

# 2. Give the command to add to the res.txt file from question 1 the path to the current directory. Check by showing the content of the res.txt file.
pwd >> res.txt; cat res.txt

# 3. Show the number of commands in /bin and /usr/bin. On Barbara you should count 170 for /bin and 932 for /usr/bin.
ls -l /bin| grep ^-|wd -l
ls -l /usr/bin| grep ^-|wd -l

# 4. Find the number of commands you used in the past (.bash_history in your home directory) excluding the calls to the man pages.
history -a
cat .bash_history | grep -v "man"

# 5. Show, page by page, the content of folder /usr/bin
ls -alR usr/bin | more

# 6. If you don’t already have it in your home directory, copy the centdix.txt file used in TP5 from Moodle or from Barbara /home/unix into your home directory. Show lines 20 to 50 and check.
cat centdix.txt -n | head -50 | tail -31

# 7. Execute the following commands an explain the results 
ps  #Montre les processus en cours au moment de l'execution de la commande.
ps | wc -l  #Montre le nombre de processus en cours
ps  > output ; wc –l output  #Enregistre les processus en cours dans un fichier et donne le nombre 
# Show all files starting by a character . from you home directory.
ls -a | grep "^\."
