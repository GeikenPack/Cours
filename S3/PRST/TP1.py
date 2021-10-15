import sys
import time as t
li = []

sys.setrecursionlimit(2000)
def fiboR(n):
    if n <= 1:
        return 1
    print(t.time())
    res = (fiboR(n- 1) + fiboR(n - 2))%10
    print(t.time())
    return res


def fiboI(n):
    a = 1
    b = 1
    res = 0
    list = [a, b]
    for i in range(n):
        res = (a + b)%10
        a = b
        b = res
        list.append(res)
    return list

#print(fiboR(15))

def period(li):
    for i in range(2, len(li)):
        if li[0] == li[i] and li[1] == li[i+1]:
            return i

print([fiboR(i) for i in range(200)])
print(period([fiboR(i) for i in range(10)]))