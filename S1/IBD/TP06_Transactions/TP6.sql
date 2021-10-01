INSERT INTO Continent (nom) VALUES ('IUT');

INSERT INTO Pays (nom, capitale, iso3, nomc)
VALUES ('IUT de Blagnac', 'Blagnac', 'UT2', 'IUT');

COMMIT

ROLLBACK

INSERT INTO Pays (nom, capitale, iso3, nomc)
VALUES ('IUT de Rangueil', 'Rangueil', 'UT3', 'IUT');

INSERT INTO Pays (nom, capitale, iso3, nomc)
VALUES ('IUT de Rodez', 'Rodez', 'UT1', 'IUT');

SELECT * From Pays

DELETE FROM Pays WHERE nom = 'IUT de Rangueil';
DELETE FROM Pays WHERE nom = 'IUT de Rodez';

UPDATE Pays
SET iso2 = 'U3'
WHERE nom = 'IUT de Rangueil';

UPDATE Pays
SET iso2 = 'U1'
WHERE nom = 'IUT de Rodez';