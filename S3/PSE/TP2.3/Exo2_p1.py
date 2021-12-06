import posix_ipc as p
import mmap
import random
import time

sm = p.SharedMemory("/shm_test", p.O_CREAT)

li = []
for i in range(20):
    li.append(random.randint(0,255))
sm[0:] = li[0:]
mm = mmap.mmap(sm.fd, 0)
time.sleep(30)
mm.close()
p.unlink(sm)