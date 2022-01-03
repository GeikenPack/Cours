import os
import traceback
import time
import signal

try:
    fd = os.open("tmp", os.O_RDONLY)
    continuer = True
    while continuer:
        saisiUtilisateur = input("Saisissez une commande (info ou stop): ")
        if saisiUtilisateur == "info":
            print(int(os.read(fd, 256).decode('utf-8')))
        elif saisiUtilisateur == "stop":
            os.kill(int(os.read(fd, 2)), signal.SIGKILL)
            continuer = False
        else:
            print("Mauvaise commande")
except OSError as e:
    traceback.print_exc()
    print(e.strerror)
    exit(1)