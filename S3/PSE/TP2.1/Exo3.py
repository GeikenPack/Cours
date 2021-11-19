import os
import sys
import traceback
import tempfile

try:
    tmpfile = tempfile.TemporaryFile()
    descStd = os.dup(2)
    os.dup2(tmpfile.fileno(), 2)
    traceback.print_stack()
    os.dup2(descStd, 2)
    os.lseek(tmpfile.fileno(), 0, os.SEEK_SET)
    for li in tmpfile.readlines():
        print(li)
except OSError as e:
    traceback.print_exc()
    print(e.strerror)
    exit(1)