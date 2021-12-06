import posix_ipc as p
import mmap

sm = p.SharedMemory("/tmp")
mm = mmap.mmap(sm, 0)
print(len(mm))
print(elm for elm in mm)