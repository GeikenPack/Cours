Continent ( nom varchar(50), superficie number)
Pays ( nom varchar(50), capitale varchar(30), superficie number, population number, iso3 char(3), iso2 char(2), nomc# varchar(50))
Frontiere ( nomp#, nomf#, longueur number)
Montagne ( nm number, nom varchar(50), altitude number, chaine varchar(50))
Localiser ( nm#, nomp#)
Fleuve(nf number,nom varchar(50),longueur number,embouchure varchar(30))
Traverser(nf#,nomp#)

DROP TABLE Traverser;
DROP TABLE Localiser;
DROP TABLE Frontiere;
DROP TABLE Pays;
DROP TABLE Montagne;
DROP TABLE Fleuve;
DROP TABLE Continent;

CREATE TABLE Continent
(
	nom VARCHAR(50),
	superficie NUMBER,
	CONSTRAINT pk_continent_nom PRIMARY KEY(nom)
);

CREATE TABLE Fleuve
(
	nf NUMBER,
	nom VARCHAR(50),
	longueur NUMBER,
	embouchure VARCHAR(50),
	CONSTRAINT pk_fleuve_nf PRIMARY KEY(nf)
);

CREATE TABLE Montagne
(
	nm NUMBER,
	nom VARCHAR(50),
	altitude NUMBER,
	chaine VARCHAR(50),
	CONSTRAINT pk_montagne_nm PRIMARY KEY(nm)
);

CREATE TABLE Pays
(
	nom VARCHAR(50),
	capitale VARCHAR(30),
	superficie NUMBER,
	population NUMBER,
	iso3 CHAR(3),
	iso2 CHAR(2),
	nomc VARCHAR(50),
	CONSTRAINT pk_pays_nom PRIMARY KEY(nom),
	CONSTRAINT uk_pays_iso3 UNIQUE(iso3),
	CONSTRAINT uk_pays_iso2 UNIQUE(iso2),
	CONSTRAINT fk_pays_continent FOREIGN KEY(nomc) REFERENCES Continent(nom)
);

CREATE TABLE Frontiere
(
	nomp VARCHAR(50),
	nomf VARCHAR(50),
	longueur NUMBER,
	CONSTRAINT fk_frontiere_nomp FOREIGN KEY(nomp) REFERENCES Pays(nom),
	CONSTRAINT fk_frontiere_nomf FOREIGN KEY(nomf) REFERENCES Fleuve(nom),
	CONSTRAINT pk_frontiere PRIMARY KEY(nomp,nomf)
);

CREATE TABLE Localiser
(
	nm NUMBER,
	nomp VARCHAR(50),
	CONSTRAINT fk_localiser_nm FOREIGN KEY(nm) REFERENCES Montagne(nm),
	CONSTRAINT fk_localiser_nomp FOREIGN KEY(nomp) REFERENCES Pays(nom),
	CONSTRAINT pk_localiser PRIMARY KEY(nm,nomp)
);

CREATE TABLE Traverser
(
	nf NUMBER,
	nomp VARCHAR(50),
	CONSTRAINT fk_traverser_nf FOREIGN KEY(nf) REFERENCES Fleuve(nf),
	CONSTRAINT fk_traverser_nomp FOREIGN KEY(nomp) REFERENCES Pays(nom),
	CONSTRAINT pk_traverser PRIMARY KEY(nf,nomp)
);