import os
import sys
import traceback

try:
    fd = os.open("f.txt", os.O_WRONLY | os.O_CREAT)
    os.dup2(fd, 1)
    os.execl("/bin/ls", "ls" ,"-l")
except OSError as e:
    traceback.print_exc()
    print(e.strerror)
    exit(1)