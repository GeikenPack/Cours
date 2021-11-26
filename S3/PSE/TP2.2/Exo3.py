import os
import traceback

try:
    fd1, fd2 = os.pipe()
    fd3, fd4 = os.pipe()
    pid1 = os.fork()
    if pid1 == 0:
        fdF = os.open("ff.txt", os.O_RDONLY)
        buffer = os.read(fdF, 256)
        while len(buffer) > 0:
            os.write(fd2, buffer)
            buffer = os.read(fdF, 256)
        os.write(1, os.read(fd3, 256))
    else:
        pid2 = os.fork()
        if pid2 == 0:
            os.write(2, os.read(fd1, 256))
            fdG = os.open("gg.txt", os.O_RDONLY)
            buffer = os.read(fdG, 256)
            while len(buffer) > 0:
                os.write(fd4, buffer)
                buffer = os.read(fdG, 256)
        else:
            os.wait()
except OSError as e:
    traceback.print_exc()
    print(e.strerror)
    exit(1)