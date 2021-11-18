import sys
import os
import traceback

try:
    os.link("f", "f~")
    fd1 = os.open("f", os.O_WRONLY|os.O_CREAT|os.O_TRUNC)
    fd2 = os.open("f~", os.O_RDONLY)
    debutLigne = True
    buffer = os.read(fd2, 1)
    print(len(buffer))
    while len(buffer) > 0:
        if not debutLigne:
            if buffer[0] == 10:
                debutLigne = True
            os.write(fd1, buffer)
        else:
            if not buffer[0] == 32:
                debutLigne = False
        buffer = os.read(fd2, 1)
    #os.unlink("f~")
except OSError as e:
    traceback.print_exc()
    print(e.strerror)
    exit(1)