DROP TABLE Joueur;
CREATE TABLE Joueur
(
	NJ     NUMBER,
	Nom    VARCHAR(30),
	Prenom VARCHAR(30),
	Age    NUMBER(2)
);

INSERT INTO Joueur VALUES (13, 'Kanté','Ngolo', 27);
INSERT INTO Joueur VALUES (6, 'Pogba', 'Paul', 25);
INSERT INTO Joueur VALUES (7, 'Griezman', 'Antoine', 27);
INSERT INTO Joueur VALUES (10, 'Mbappe', 'Kilian', 19);

SELECT *
FROM Joueur;