nbMateriaux = int(input("Combien de matériaux différents avez vous ? "))
nbContraintes = int(input("Combien de produits différents produisez vous ? "))
prixProduit = []
coefZ = []
z = []
for i in range(nbMateriaux):
    prixProduit.append(input("Prix du produit " + str(i) + " : "))
    coefZ.append(0)
    z.append(int(input("Materiau " + str(i) + " pour z")))

matrice = []
Bi = []

for i in range(0, nbContraintes):
    contraintes = []
    for j in range(nbMateriaux):
        contraintes.append(int(input("Nombre de materiaux " + str(j) + " pour la contrainte " + str(i))))
    for k in range(nbMateriaux):
        contraintes.append(0)
    contraintes[nbMateriaux + i] = 1
    matrice.append(contraintes)
    Bi.append(int(input(" contraintes <= ? ")))

for i in range (nbMateriaux):
    z.append(0)

matrice.append(z)

for i in range(len(matrice)):
    print(str(matrice[i]) + "  " + str(Bi[i]))