CREATE TABLE Continent(
	population 
);

UPDATE Continent
SET population = 20
WHERE nom = "Europe"

CREATE TABLE Joueur
(
	nj DECIMAL,
	prenom VARCHAR(30),
	nom VARCHAR(30),
	maillot DECIMAL,
	ne DECIMAL,
	CONSTRAINT pk_joueur_nj PRIMARY KEY(nj),
	CONSTRAINT fk_joueur_equipe FOREIGN KEY(ne) REFERENCES Equipe(ne)
);

ALTER TABLE Joueur
ADD (CONSTRAINT uk_joueur_maillot UNIQUE(maillot),
	 CONSTRAINT uk_joueur_ne UNIQUE(ne));
	 

ALTER TABLE Continent
ADD CONSTRAINT ck_continent_superficie
CHECK (superficie >= 0);