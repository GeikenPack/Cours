import os
import sys
import traceback

try:
    (fd1, fd2) = os.pipe()
    pid = os.fork()
    if pid == 0:
        os.close(fd1)
        os.write(fd2, 'test'.encode('utf-8'))
        exit(0)
    else:
        os.close(fd2)
        os.write(1, os.read(fd1, 16))
except OSError as e:
    traceback.print_exc()
    print(e.strerror)
    exit(1)