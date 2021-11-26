import os
import random
import traceback
import time

try:
    fd = os.open("tmp", os.O_RDONLY)
    while True:
        os.write(1, os.read(fd, 4))
except OSError as e:
    traceback.print_exc()
    print(e.strerror)
    exit(1)