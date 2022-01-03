import traceback
import posix_ipc as p
import os
import mmap
import random
import time

try:

    sm = p.SharedMemory("/tmp", p.O_CREAT, size=os.sysconf("SC_PAGE_SIZE"))
    mm = mmap.mmap(sm.fd, os.sysconf("SC_PAGE_SIZE"), prot=mmap.PROT_READ | mmap.PROT_WRITE)
    semaphore = p.Semaphore("/semTmpp", p.O_CREAT | p.O_EXCL, 0o600, 0)


    li = []
    for i in range(20):
        li.append(random.randint(0,255))

    for i in range(len(li)):
        mm[i] = li[i]

    semaphore.release()
    mm.close()
    sm.unlink()
except OSError as e:
    traceback.print_exc()
    print(e.strerror)
    exit(1)