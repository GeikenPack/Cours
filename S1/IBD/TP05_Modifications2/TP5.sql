UPDATE Continent
SET Population = 4601371000, Croissance = 0.97
WHERE nom = 'Asie';

UPDATE Continent
SET Population = 1308064000, Croissance = 2.46
WHERE nom = 'Afrique';

UPDATE Continent
SET Population = 1014722000, Croissance = 0.79
WHERE nom = 'Amérique';

UPDATE Continent
SET Population = 747193000, Croissance = 0.14
WHERE nom = 'Europe';

UPDATE Continent
SET Population = 42128000, Croissance = 1.50
WHERE nom = 'Océanie';

COLUMN Croissance FORMAT 99.99;
SELECT * FROM Continent;

UPDATE Continent
SET Population = 0, Croissance = 0.0
WHERE nom = 'Antarctique';

ALTER TABLE Continent
DROP CONSTRAINT CK_CONTINENT_POPULATION;

ALTER TABLE Continent
ADD CONSTRAINT CK_CONTINENT_POPULATION
CHECK (population >= 0);

UPDATE Pays
SET nomc = 'EUROPE'
WHERE nom = 'France';

INSERT INTO Pays(nom, capitale, iso3, nomc)
VALUES ('IUT de Blagnac','Blagnac','IUT', 'Europe');

SELECT *
FROM Pays 
WHERE nom= 'IUT de Blagnac';

INSERT INTO Frontiere VALUES ('IUT de Blagnac', 'France', 2);
INSERT INTO Frontiere VALUES ('France', 'IUT de Blagnac', 2);

DELETE FROM Pays WHERE nom = 'IUT de Blagnac';
DELETE FROM Frontiere WHERE nomp = 'IUT de Blagnac';
DELETE FROM Frontiere WHERE nomf = 'IUT de Blagnac';

CREATE TABLE Volcan
(
	nv DECIMAL,
	nom VARCHAR(30),
	altitude DECIMAL,
	nomc VARCHAR(30),
	nomp VARCHAR(30),
	CONSTRAINT PK_VOLCAN_NV PRIMARY KEY (nv),
	CONSTRAINT UK_VOLCAN_NOM UNIQUE (nom),
	CONSTRAINT CK_VOLCAN_ALTITUDE CHECK (altitude > 0),
);

DROP SEQUENCE seq_volvan;
CREATE SEQUENCE seq_volcan START WITH 1 INCREMENT BY 1;
INSERT INTO Volcan VALUES (seq_volcan.NEXTVAL,'Nevado Ojos del Salado',6893,'Amérique','Argentine');
INSERT INTO Volcan VALUES (seq_volcan.NEXTVAL,'Kilimandjaro',5892,'Afrique','Tanzanie');
INSERT INTO Volcan VALUES (seq_volcan.NEXTVAL,'Elbrouz',5642,'Europe','Russie');
INSERT INTO Volcan VALUES (seq_volcan.NEXTVAL,'Pic d Orizaba',5675,'Amérique','Mexique');
INSERT INTO Volcan VALUES (seq_volcan.NEXTVAL,'Mont Damavand',5610,'Asie','Iran');
INSERT INTO Volcan VALUES (seq_volcan.NEXTVAL,'Mont Giluwe',4368,'Océanie','Papuasie-Nouvelle-Guinée');
INSERT INTO Volcan VALUES (seq_volcan.NEXTVAL,'Mont Sidley',4285,'Antarctique','');