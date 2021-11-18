import sys
import os
import traceback

try:
    os.link("f", "f~1")
except OSError as e:
    traceback.print_exc()
    print(e.strerror)
    exit(1)