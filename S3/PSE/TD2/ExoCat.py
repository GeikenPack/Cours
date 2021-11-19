import sys
import os
import traceback

try:
    fd = os.open(sys.argv[1],os. O_RDONLY)
    buffer = os.read(fd, 256)
    while len(buffer) > 0:
        os.write(1, buffer)
        buffer = os.read(fd, 256)
    os.close
except OSError as e:
    traceback.print_exc()
    print(e.strerror)
    exit(1)

