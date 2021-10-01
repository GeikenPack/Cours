--1.1
SET SERVEROUTPUT ON;
ACCEPT pNom PROMPT 'Saisir un nom de montagne: ';
ACCEPT pAlt PROMPT 'Saisir l''altitude de la montagne: ';
ACCEPT pCha PROMPT 'Saisir la chaîne de montagnes: ';

DECLARE
	vNom Montagne.Nom%TYPE  := '&pNom';
	vAlt Montagne.Altitude%TYPE  := &pAlt;
	vCha Montagne.Chaine%TYPE  := '&pCha';

BEGIN
	INSERT INTO Montagne(nm, nom, altitude, chaine) 
	VALUES(seq_montagne.NEXTVAL, vNom, vAlt, vCha);
	DBMS_OUTPUT.PUT_LINE('Montagne'||vNom||' ajoutée.');
	COMMIT;
END;
/

--1.2
SELECT *
FROM Montagne;

--2.1
ACCEPT pNom PROMPT 'Saisir le nom du pays : ';
ACCEPT pCap PROMPT 'Saisir la capitale du pays : ';
ACCEPT pSup PROMPT 'Saisir la superficie du pays : ';
ACCEPT pPop PROMPT 'Saisir la population du pays : ';
ACCEPT pIs3 PROMPT 'Saisir le code ISO3 du pays : ';
ACCEPT pIs2 PROMPT 'Saisir le code ISO2 du pays : ';
ACCEPT pCon PROMPT 'Saisir le contnent du pays : ';

DECLARE 
	--Affectations des paramètres aux variables locales
	vNom Pays.Nom%TYPE := '&pNom';
	vCap Pays.Capitale%TYPE := '&pCap';
	vSup Pays.Superficie%TYPE := &pSup;
	vPop Pays.Population%TYPE := &pPop;
	vIs3 Pays.Iso3%TYPE := '&pIs3';
	vIs2 Pays.Iso2%TYPE := '&pIs2';
	vCon Pays.NomC%TYPE := '&pCon';

BEGIN
	--Insertion du nouveau Pays
	INSERT INTO Pays (nom, capitale, superficie, population, iso3, iso2, nomc)
	VALUES (vNom, vCap, vSup, vPop, vIs3, vIs2, vCon);
	--Affichage d’un message
	DBMS_OUTPUT.PUT_LINE('Pays '||vNom||' ajouté.');
	--Validation
	COMMIT;
END;
/

--2.3
SELECT *
FROM Pays;

--3.1
ACCEPT pNom PROMPT 'Saisir le nom du pays: ';
ACCEPT pCap PROMPT 'Saisir la capitaledu pays: ';
ACCEPT pSup PROMPT 'Saisir la superficiedu pays: ';
ACCEPT pPop PROMPT 'Saisir la populationdu pays: ';
ACCEPT pIs3 PROMPT 'Saisir le code ISO3du pays: ';
ACCEPT pIs2 PROMPT 'Saisir le code ISO2du pays: ';
ACCEPT pCon PROMPT 'Saisir le contnentdu pays: ';

DECLARE
	--Affectations des paramètres aux variables locales
	vNom Pays.Nom%TYPE := '&pNom';
	vCap Pays.Capitale%TYPE := '&pCap';
	vSup Pays.Superficie%TYPE := &pSup;
	vPop Pays.Population%TYPE := &pPop;
	vIs3 Pays.Iso3%TYPE := '&pIs3';
	vIs2 Pays.Iso2%TYPE := '&pIs2';
	vCon Pays.NomC%TYPE := '&pCon';
	
BEGIN
	--Vérifications dela superficie et de la population
	IF (vSup <= 0) THEN 
		RAISE_APPLICATION_ERROR(-20001, 'Superficie négative'); 
	END IF;
	IF (vPop <= 0) THEN 
		RAISE_APPLICATION_ERROR(-20002, 'Population négative') 
	END IF;
	--Insertion du nouveau Pays
	INSERT INTO Pays (nom, capitale, superficie, population, iso3, iso2, nomc)
	VALUES (vNom, vCap, vSup, vPop, vIs3, vIs2, vCon);
	--Affichage d’un message
	DBMS_OUTPUT.PUT_LINE('Pays '||vNom||' ajouté.');
	--Validation
	COMMIT;
END;
/

