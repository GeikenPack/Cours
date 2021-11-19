import os
import sys
import traceback

try:
    if len(sys.argv) <= 1:
        os.wrtie(2, b"missing argument\n")
        exit(1)
    
    fd = open(sys.argv[1], os.O_WRONLY)
    os.write(fd, bytes(sys.argv[1], "utf-8"))
    os.close(fd)
except OSError as e:
    traceback.print_exc()
    print(e.strerror)
    exit(1)