from os import *
import sys
from random import randint
'''
def main():
    if len(sys.argv) != 2:
        print("Un seul argument possible")
        exit(1)
    
    args = sys.argv[1]
    ch = str(input("Saisissez une chaine :"))
    concat = args + " " + ch
    print("La chaine concat :" + concat)
    print("La longueur de la chaine : " + str(len(concat)))
    spl = concat.split(sep=" ")
    for elm in spl:
        sys.stdout.write(elm + " & ")
'''
'''
def main():
    nbVal = int(input("Saisissez un nombre de valeurs à tirer :"))
    li = tirerRandom(nbVal)
    print(li)
    seuil = int(input("Saisissez un seuil :"))
    liSeuil = chercherValSeuil(li, seuil)
    print(liSeuil)

    li.pop(2)
    li.remove(2) if 2 in li else 0
    li.sort()
    print("Nombre de valeurs dans la liste : " + str(li.count()))

    print(li[:2])
    tmp = []
    tmp[:-2] = li
    print(tmp[1:5])

def tirerRandom(n):
    li = []
    for i in range(n):
        li.append(randint(0, 32))
    return li

def chercherValSeuil(li, seuil):
    tmp = []
    for elm in li:
        if int(elm) > seuil:
            tmp.append(elm)
    return tmp
'''

def main():
    print("Saisissez la taille de la liste")
    taille = input_Int()
    li = []
    for i in range(taille):
        print("Saisissez une valeur")
        li.append(input_Int())
    li.sort()
    print(li)

def input_Int():
    val = input("Saisissez une valeur numérique : ")
    try:
        int(val)
    except ValueError:
        val = input_Int()
        return int(val)
    return int(val)


if __name__ == '__main__':
    main()

