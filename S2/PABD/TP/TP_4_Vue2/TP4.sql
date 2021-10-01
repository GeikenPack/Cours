--1.1
CREATE OR REPLACE VIEW V_Pays_Sans_Montagne (pays, continent, densite)
AS SELECT DISTINCT P.nom, P.nomc, (C.population / C.superficie) AS densite
FROM Pays P, Continent C, Localiser L
WHERE C.nom = P.nomc AND P.nom = L.nomp (+) AND L.nm IS NULL;

--1.2
SELECT *
FROM V_Pays_Sans_Montagne;

--1.3
INSERT INTO V_Pays_Sans_Montagne (pays, continent)
VALUES ('iut blagnac', 'Europe');

--1.4
INSERT INTO V_Pays_Sans_Montagne (pays, continent)
VALUES ('IUT Blagnac', 'Europe');

--1.5
DELETE FROM V_Pays_Sans_Montagne
WHERE pays = 'IUT Blagnac';

--1.6
CREATE OR REPLACE VIEW V_Pays_Sans_Montagne (pays, continent, densite)
AS SELECT P.nom, P.nomc,
CASE
	WHEN NULL IS NULL
	THEN (SELECT C.population / C.superficie
		  FROM Continent C
		  WHERE P.nomc = nom)
END
FROM Pays P
WHERE P.nom NOT IN (SELECT nomp FROM Localiser);

--1.7
INSERT INTO V_Pays_Sans_Montagne (pays, continent)
VALUES ('iut blagnac', 'Europe');

UPDATE V_Pays_Sans_Montagne
SET pays = ('IUT Blagnac')
WHERE pays = 'iut blagnac';

DELETE FROM V_Pays_Sans_Montagne
WHERE pays = 'IUT Blagnac';

--1.8
ROLLBACK

--2.1
CREATE OR REPLACE VIEW V_Pays_Montagne (pays, nb_montagnes, pic)
AS SELECT P.nom, COUNT(L1.nm) AS nb_montagnes, MAX(M1.nom), AS pic
FROM Pays P, Localiser L1, Montagne M1
WHERE M1.altitude = (SELECT MAX(altitude) 
					FROM Localiser L2, Montagne M2
					WHERE M2.nm = L2.nm AND L2.nomp = P.nom) AND P.nom = L1.nomp
GROUP BY P.nom;

--2.2
SELECT *
FROM V_Pays_Montagne;

--2.3
INSERT INTO V_Pays_Montagne
VALUES ('IUT Blagnac', 0, 'Dept Info');

--2.4
UPDATE V_Pays_Montagne
SET pays = 'france'
WHERE Pays = 'France';

--2.5
DELETE FROM V_Pays_Montagne
WHERE pays = 'Italie';

