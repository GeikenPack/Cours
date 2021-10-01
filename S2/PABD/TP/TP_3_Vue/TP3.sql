--1.1
CREATE VIEW V_Pays_EU (nom, iso3, iso2, capitale)
AS SELECT nom, iso3, iso2, capitale
   FROM Pays
   WHERE nomc = 'Europe';
  
--1.2
SELECT *
FROM V_Pays_EU;

--1.3
SET LONG 1000;
SELECT VIEW_NAME, TEXT
FROM USER_VIEWS
WHERE VIEW_NAME = 'V_PAYS_EU';

--1.4
INSERT INTO V_Pays_EU
VALUES ('IUT Blagnac', 'IUT', 'UT', 'Dept Informatique');

--1.5
CREATE OR REPLACE VIEW V_Pays_EU (nom, iso3, iso2, capitale, nomc)
AS SELECT nom, iso3, iso2, capitale, nomc
   FROM Pays
   WHERE nomc = 'Europe';
   
--1.6
INSERT INTO V_Pays_EU
VALUES ('IUT Blagnac', 'IUT', 'UT', 'Dept Informatique', 'Europe');

--1.7
SELECT *
FROM V_Pays_EU;

--1.8
DELETE FROM V_Pays_EU
WHERE nom = 'IUT Blagnac';

--1.9
DELETE FROM V_Pays_EU
WHERE nom = 'France';

--2.1
CREATE VIEW V_Montagne_EU(numero, nom, altitude, chaine)
AS SELECT nm, nom, altitude, chaine
   FROM Montagne
   WHERE nm IN (SELECT nm
				FROM Localiser
				WHERE nomp IN (SELECT nom
							   FROM Pays
							   WHERE nomc = 'Europe'));

--2.2
SELECT *
FROM V_Montagne_EU;

--2.3
SET LONG 1000;
SELECT VIEW_NAME, TEXT
FROM USER_VIEWS
WHERE VIEW_NAME = 'V_MONTAGNE_EU';

--2.4
INSERT INTO V_Montagne_EU
VALUES (seq_montagne.NEXTVAL, 'Pic d''Aneto', 3404, 'Pyrénées');

--2.5
SELECT *
FROM V_Montagne_EU;
SELECT *
FROM Montagne;

--2.6
ROLLBACK

--2.7
CREATE OR REPLACE VIEW V_Montagne_EU(numero, nom, altitude, chaine, pays)
AS SELECT M.nm, M.nom, M.altitude, M.chaine, P.nom
   FROM Montagne M, Localiser L, Pays P
   WHERE M.nm = L.nm AND L.nomp = P.nom AND P.nomc = 'Europe';
							   
--2.8
INSERT INTO V_Montagne_EU
VALUES (seq_montagne.NEXTVAL, 'Pic d''Aneto', 3404, 'Pyrénées', 'France');
	   
							   