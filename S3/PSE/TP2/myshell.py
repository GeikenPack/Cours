from os import *
import sys

def main():
    while(True):
        afficherMenu()
        cmd = str(input("Saisissez une commande : "))
        cmdSplit = cmd.split(sep=" ")
        background = True if cmdSplit[len(cmdSplit)-1] == "&" else False
        if background:
            cmdSplit.remove("&")
        try:
            pid = fork()
            if pid == 0:
                execvp(cmdSplit[0], cmdSplit[0:])
            else:
                if not background:
                    codeR = wait()
                    print ("Fin de " + str(codeR[0]) + " avec le code de retour : " + str(codeR[1]))
        except OSError:
            print(OSError.strerror)

def afficherMenu():
    print("Bienvenue dans mon Shell !")

if __name__ == '__main__':
    try:
        main()
    except KeyboardInterrupt:
        print("\nArret du programme par saisie de l'utilisateur")
