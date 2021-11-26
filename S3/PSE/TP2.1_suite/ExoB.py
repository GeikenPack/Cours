import os
import sys
import traceback

try:
    fd = os.open(sys.argv[1], os.O_WRONLY | os.O_CREAT | os.O_TRUNC)
    descTmp = os.dup(1)
    os.dup2(fd, 1)
    os.write(1, "test".encode('utf-8'))
    os.write(2, "test Erreur".encode('utf-8'))
    os.dup2(descTmp, 1)
except OSError as e:
    traceback.print_exc()
    print(e.strerror)
    exit(1)