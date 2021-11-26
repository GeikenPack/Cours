import os
import traceback
import socket

try:
    #fd1 : Ecriture du contenue de ff.txt dans le premier fils et lecture dans le second
    #fd2 : Ecriture du contenue de gg.txt dans le second fils et lecture dans le premier
    fd1, fd2 = socket.socketpair(socket.AF_UNIX, socket.SOCK_STREAM)
    pid1 = os.fork()
    if pid1 == 0:
        #fdF : Fichier ff.txt
        fdF = os.open("ff.txt", os.O_RDONLY)
        buffer = os.read(fdF, 256)
        while len(buffer) > 0:
            os.write(fd1.fileno(), buffer)
            buffer = os.read(fdF, 256)
        os.write(1, os.read(fd2.fileno(), 256))
    else:
        pid2 = os.fork()
        if pid2 == 0:
            #fdG : Fichier gg.txt
            fdG = os.open("gg.txt", os.O_RDONLY)
            buffer = os.read(fdG, 256)
            while len(buffer) > 0:
                os.write(fd2.fileno(), buffer)
                buffer = os.read(fdG, 256)
            os.write(2, os.read(fd1.fileno(), 256)) #Fonctionn si placé ici. Ne fonctionne pas si placé avant l'ouverture de gg.txt
        else:
            os.wait()
except OSError as e:
    traceback.print_exc()
    print(e.strerror)
    exit(1)