import posix_ipc as p
import mmap
import os
import traceback

try:
    sm = p.SharedMemory("/tmp")
    mm = mmap.mmap(sm.fd, os.sysconf("SC_PAGE_SIZE"), prot=mmap.PROT_READ | mmap.PROT_WRITE)
    for i in range(len(mm)):
        if (mm[i] != 0):
            print(mm[i])
    
except OSError as e:
    traceback.print_exc()
    print(e.strerror)
    exit(1)