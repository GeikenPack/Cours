import posix_ipc as p
import mmap
import os
import traceback

try:
    sm = p.SharedMemory("/tmp", p.O_CREAT, size=os.sysconf("SC_PAGE_SIZE"))
    mm = mmap.mmap(sm.fd, os.sysconf("SC_PAGE_SIZE"), prot=mmap.PROT_READ | mmap.PROT_WRITE)
    semaphore = p.Semaphore("/semTmpp", mode=0o600, initial_value=0)
    semaphore.acquire()

    for i in range(len(mm)):
        if (mm[i] != 0):
            print(mm[i])
    semaphore.unlink()
except OSError as e:
    traceback.print_exc()
    print(e.strerror)
    exit(1)