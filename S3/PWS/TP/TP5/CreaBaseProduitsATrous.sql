DROP TABLE IF EXISTS Produits;
DROP TABLE IF EXISTS Categories;

CREATE TABLE Categories (
    idCategorie VARCHAR(3),
    nomCategorie VARCHAR(25),
    PRIMARY KEY (idCategorie)
);

CREATE TABLE Produits (
    idProduit VARCHAR(3),
    idCategorie VARCHAR(3) NOT NULL,
    nomProduit VARCHAR(30),
    prixProduit mediumint(5),
    PRIMARY KEY (idProduit),
    FOREIGN KEY (idCategorie) references Categories(idCategorie)
); 


INSERT INTO Categories (idCategorie, nomCategorie) VALUES ('100', 'Téléviseur'); 
INSERT INTO Categories VALUES ('200', 'Camescope'); 
INSERT INTO Categories(idCategorie, nomCategorie) VALUES ('300', 'Ordinateur');

INSERT INTO Produits (idProduit, idCategorie, nomProduit, prixProduit) VALUES ('115', '100','TV Thomson 214i',1020);
INSERT INTO Produits (idProduit, idCategorie, nomProduit, prixProduit) VALUES ('198', '100', 'TV Samsung Highcolor', 980);
INSERT INTO Produits (idProduit, idCategorie, nomProduit, prixProduit) VALUES ('231', '200', 'Camescope Hightrack', 754);
INSERT INTO Produits (idProduit, idCategorie, nomProduit, prixProduit) VALUES ('302', '300', 'PC HP 5980', 299);
INSERT INTO Produits (idProduit, idCategorie, nomProduit, prixProduit) VALUES ('357', '300', 'PC Server Pro', 799);	

COMMIT;