import os
import sys
import traceback

try:
    fd = os.open(sys.argv[1], os.O_WRONLY | os.O_CREAT | os.O_TRUNC)
    os.dup2(fd, 1)
    os.execlp("ls", "ls")
except OSError as e:
    traceback.print_exc()
    print(e.strerror)
    exit(1)