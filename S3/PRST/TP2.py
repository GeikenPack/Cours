import matplotlib.pyplot as mp
import numpy
import scipy.special

def binomial(k, n, p):
    return scipy.special.comb(n, k) * p**k * (1-p)**(n-k)

tabBin = []
for i in range(1000+1):
    tabBin.append(binomial(i,1000,0.1))

mp.bar(range(1000+1), tabBin)

mp.bar(range(1000+1), tabBin)
mp.show()
mp.subplot(211)