import os
import traceback
import time
import sys

try:
    fd = os.open("tmp", os.O_WRONLY)
    while True:
        if os.fork():
            os.execlp("who", "who")
        os.wait()
        pid = str(os.getpid())
        print(str.encode(pid))
        os.write(fd, str.encode(pid))
        time.sleep(10)
except OSError as e:
    traceback.print_exc()
    print(e.strerror)
    exit(1)