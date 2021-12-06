import os
import sys
import traceback

try:
    fdS = os.open(sys.argv[1], os.O_RDONLY)
    fdD = os.open(sys.argv[2], os.O_WRONLY | os.O_CREAT)
    buffer = os.read(fdS, 256)
    while len(buffer) > 0:
        os.write(fdD, buffer)
        buffer = os.read(fdS, 256)
    os.close(fdS)
    os.close(fdD)
except OSError as e:
    traceback.print_exc()
    print(e.strerror)
    exit(1)

