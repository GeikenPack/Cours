--1.1
SET SERVEROUTPUT ON;
ACCEPT pNom PROMPT 'Saisissez le nom de la montagne';
ACCEPT pAlt PROMPT 'Saisissez l altitude de la montagne';
ACCEPT pCha Prompt 'Saisissez la chaine de la montagne';

DECLARE 
	vNom Montagne.nom%TYPE := '&pNom';
	vAlt Montagne.altitude%TYPE := &pAlt;
	vCha Montagne.chaine%TYPE := '&pCha';
	vTest NUMBER;
	
BEGIN
	SELECT COUNT(*) INTO vTest FROM Montagne WHERE nom = vNom;
	DBMS_OUTPUT.PUT_LINE(vTest);
    IF vTest >= 1 THEN
		RAISE_APPLICATION_ERROR(-20001, 'Montagne déjà existente');
	END IF;
	IF vAlt <= 0 THEN
		RAISE_APPLICATION_ERROR(-20002, 'Altitude négative');
	END IF;	
	INSERT INTO Montagne(nm, nom, altitude, chaine)
	VALUES (seq_montagne.NEXTVAL, vNom, vAlt, vCha);
	DBMS_OUTPUT.PUT_LINE('Montagne ajouté');
	COMMIT;
END;

--2.1
SET SERVEROUTPUT ON;
ACCEPT pNomM PROMPT 'Saisissez le nom de la montagne';
ACCEPT pAlt PROMPT 'Saisissez l altitude de la montagne';
ACCEPT pChaine PROMPT 'Saisissez le nom de la chaine de la montagne';
ACCEPT pNomP PROMPT 'Saisissez le nom du pays';

DECLARE
	vNomM Montagne.nom%TYPE := '&pNomM';
	vAlt Montagne.altitude%TYPE := &pAlt;
	vChaine Montagne.chaine%TYPE := '&pChaine';
	vNomP Pays.nom%TYPE := '&pNomP';
	vTestM NUMBER;
	vTestP NUMBER;
	
BEGIN
	IF vAlt < 0 THEN
		RAISE_APPLICATION_ERROR(-20001, 'Altitude négative');
	END IF;
	SELECT COUNT(*) INTO vTestM FROM Montagne WHERE nom = vNomM;
	SELECT COUNT(*) INTO vTestP FROM Pays WHERE nom = vNomP;
	IF vTestM >= 1 THEN
		RAISE_APPLICATION_ERROR(-20002, 'Montagne déjà existente');
	END IF;
	IF vTestP < 1 THEN
		RAISE_APPLICATION_ERROR(-20003, 'Pays déjà existent');
	END IF;
	INSERT INTO Montagne(nm, nom, altitude, chaine) 
	VALUES(seq_montagne.NEXTVAL, vNomM, vAlt, vChaine);
	DBMS_OUTPUT.PUT_LINE('Montagne'||vNomM||' ajoutée.');
	INSERT INTO Localiser(nm, nomp)
	VALUES (seq_montagne.CURRVAL, vNomP);
	DBMS_OUTPUT.PUT_LINE('Montagne'||vNomM||' ajoutée dans'||vNomP||'.');
	COMMIT;
END;

--3.1
ACCEPT pNom PROMPT 'Saisir le nom du pays: ';
ACCEPT pCap PROMPT 'Saisir la capitale du pays: ';
ACCEPT pSup PROMPT 'Saisir la superficie du pays: ';
ACCEPT pPop PROMPT 'Saisir la population du pays: ';
ACCEPT pIs3 PROMPT 'Saisir le code ISO3 du pays: ';
ACCEPT pIs2 PROMPT 'Saisir le code ISO2 du pays: ';
ACCEPT pCon PROMPT 'Saisir le continent du pays: ';

DECLARE
	--Affectations des paramètres aux variables locales
	vNom Pays.Nom%TYPE := '&pNom';
	vCap Pays.Capitale%TYPE := '&pCap';
	vSup Pays.Superficie%TYPE := &pSup;
	vPop Pays.Population%TYPE := &pPop;
	vIs3 Pays.Iso3%TYPE := '&pIs3';
	vIs2 Pays.Iso2%TYPE := '&pIs2';
	vCon Pays.NomC%TYPE := '&pCon';
	vTestP NUMBER;
	vTestI3 NUMBER;
	vTestI2 NUMBER;
	vTestC NUMBER;
	
BEGIN
	--Vérifications dela superficie et de la population
	IF (vSup <= 0) THEN 
		RAISE_APPLICATION_ERROR(-20001, 'Superficie négative'); 
	END IF;
	IF (vPop <= 0) THEN 
		RAISE_APPLICATION_ERROR(-20002, 'Population négative') 
	END IF;
	SELECT COUNT(*) INTO vTestP FROM Pays WHERE nom = vNom;
	SELECT COUNT(*) INTO vTestI3 FROM Pays WHERE iso3 = vIs3;
	SELECT COUNT(*) INTO vTestI2 FROM Pays WHERE iso2 = vIs2;
	SELECT COUNT(*) INTO vTestC FROM Pays WHERE nomc = vCon;
	IF vTestP >= 1 THEN
		RAISE_APPLICATION_ERROR(-20003, 'Pays déjà existent');
	END IF;
	IF vTestI3 >= 1 THEN
		RAISE_APPLICATION_ERROR(-20004, 'Iso3 déjà existent');
	END IF;
	IF vTestI2 >= 1 THEN
	RAISE_APPLICATION_ERROR(-20005, 'Iso2 déjà existent');
	END IF;
	IF vTestC < 1 THEN
	RAISE_APPLICATION_ERROR(-20006, 'Continent inexistent');
	END IF;
	--Insertion du nouveau Pays
	INSERT INTO Pays (nom, capitale, superficie, population, iso3, iso2, nomc)
	VALUES (vNom, vCap, vSup, vPop, vIs3, vIs2, vCon);
	--Affichage d’un message
	DBMS_OUTPUT.PUT_LINE('Pays '||vNom||' ajouté.');
	--Validation
	COMMIT;
END;

