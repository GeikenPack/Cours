import sys
import os
import traceback

try:
    fd = os.open(sys.argv[1], os.O_WRONLY|os.O_CREAT|os.O_TRUNC, mode= 0o700)
    while True:
        buf = os.read(0, 256)
        os.write(fd, buf)
except OSError as e:
    traceback.print_exc()
    print(e.strerror)
    exit(1)