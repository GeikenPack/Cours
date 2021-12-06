import mmap
import os
import sys
import traceback

try:
    fd = os.open(sys.argv[1], os.O_RDWR)
    mm = mmap.mmap(fd, 0)
    pair = False
    if len(mm)%2 != 0:
        print("Nombre d'octets non pair")
    else:
        for i in range(len(mm)-1):
            if mm[i] == mm[i+1]:
                if pair == True:
                    mm[i-3] = mm[i]
                    mm[i-2] = mm[i]
                    mm[i] = octTmp
                    mm[i+1] = octTmp
                    pair = False
                else:
                    pair = True
                    octTmp = mm[i]
except OSError as e:
    traceback.print_exc()
    print(e.strerror)
    exit(1)