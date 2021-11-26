import os
import random
import traceback
import time
import sys

try:
    fd = os.open("tmp", os.O_WRONLY)
    while True:
        n = random.randint(32, 99)
        os.write(fd, n.to_bytes(4, sys.byteorder))
        time.sleep(1)
except OSError as e:
    traceback.print_exc()
    print(e.strerror)
    exit(1)