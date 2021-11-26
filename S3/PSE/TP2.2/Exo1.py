import os
import sys
import traceback

try:
    (fd1, fd2) = os.pipe()
    pid1 = os.fork()
    if pid1 == 0:
        os.close(fd1)
        os.dup2(fd2, 1)
        os.execlp("ls", "ls")
    else:
        pid2 = os.fork()
        if pid2 == 0:
            os.close(fd2)
            os.dup2(fd1, 0)
            os.execlp("grep", "grep", "\\.py")
        else:
            os.wait()
except OSError as e:
    traceback.print_exc()
    print(e.strerror)
    exit(1)