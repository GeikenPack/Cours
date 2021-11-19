import sys
import os
import random

(rd, wd) = os.pipe()
pid = os.fork()
if pid == 0:
    os.close(rd)
    N = random.randint(0, 0xFFFFFFFF)
    os.write(wd, N.to_bytes(4, sys.byteorder))
    os.close(wd)
else:
    os.close(wd)
    N = int.from_bytes(os.read(rd, 4), sys.byteorder)
    os.write(1, str(N).encode)
    os.close(rd)