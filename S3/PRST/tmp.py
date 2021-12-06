from matplotlib import pyplot as plt

def PConditionelle(n, m):

        return m/100 / ((m/100) + pow(0.5, n) * ((100 - m)/100))

li = []
li2 = []

for i in range(1,16):
    li.append(PConditionelle(i,1))
    li2.append(i)

plt.plot(li2, li)
plt.plot(li2, li, 'g^')

li = []
li2 = []

for i in range(1,16):
    li.append(PConditionelle(i,5))
    li2.append(i)

plt.plot(li2, li)
plt.plot(li2, li, 'bs')

li = []
li2 = []

for i in range(1,16):
    li.append(PConditionelle(i,10))
    li2.append(i)

plt.plot(li2, li)
plt.plot(li2, li, 'ro')

plt.xlabel("Nombre de faces successives")
plt.ylabel("Probabilités d'obtenir nfaces successives")

plt.grid()
plt.title("Probabilités d'obtenir n faces successives avec m fausses pièces")
plt.show()