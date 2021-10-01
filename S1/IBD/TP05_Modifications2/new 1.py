def boucle():
    boucle()

def boucle2():
    print("Je tourne \n")
    boucle2()

def boucle3(i):
    if i < 100:
        print("Je tourne \n")
        boucle3(i+1)
