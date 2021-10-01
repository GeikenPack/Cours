---------------------------------------------------------
-- TP10 Oracle
---------------------------------------------------------

---------------------------------------------------------
-- 1.	Bloc PL /SQL d’ajout d’une montagne
---------------------------------------------------------

-- 1
SET SERVEROUTPUT ON;

ACCEPT pNom PROMPT 'Saisir un nom de montagne : ';
ACCEPT pAlt PROMPT 'Saisir l''altitude de la montagne : ';
ACCEPT pCha PROMPT 'Saisir la chaîne de montagnes : ';

DECLARE
   vNom Montagne.Nom%TYPE      := '&pNom';
   vAlt Montagne.Altitude%TYPE := &pAlt;
   vCha Montagne.Chaine%TYPE   := '&pCha';
   n NUMBER;
   erreur_montagne EXCEPTION;
   erreur_altitude EXCEPTION;
   PRAGMA EXCEPTION_INIT(erreur_altitude, -2290);
BEGIN
	-- Vérification de l'existence de la montagne
	SELECT COUNT(*) INTO n
	FROM Montagne
	WHERE nom = vNom;
	IF (n > 0) THEN
		RAISE erreur_montagne;
	END IF;
	-- Insérer la nouvelle montagne
	INSERT INTO Montagne (nm, nom, altitude, chaine) 
	VALUES (seq_montagne.NEXTVAL, vNom, vAlt, vCha);
	DBMS_OUTPUT.PUT_LINE('Montagne '||vNom||' ajoutée.');
	-- Valider (fin de transaction)
	COMMIT;
EXCEPTION
	WHEN erreur_montagne THEN
		ROLLBACK;
		DBMS_OUTPUT.PUT_LINE ('Montagne existante !');
	WHEN erreur_altitude THEN
		ROLLBACK;
		DBMS_OUTPUT.PUT_LINE ('Altitude invalide !');
	WHEN OTHERS THEN
		ROLLBACK;
		DBMS_OUTPUT.PUT_LINE (SQLERRM);
		RAISE_APPLICATION_ERROR (-20000, 'ERREUR IMPREVUE !');
END;
/

-- 3
ALTER TABLE Montagne
ADD CONSTRAINT uk_montagne_nom UNIQUE (nom);

SET SERVEROUTPUT ON;

ACCEPT pNom PROMPT 'Saisir un nom de montagne : ';
ACCEPT pAlt PROMPT 'Saisir l''altitude de la montagne : ';
ACCEPT pCha PROMPT 'Saisir la chaîne de montagnes : ';

DECLARE
   vNom Montagne.Nom%TYPE      := '&pNom';
   vAlt Montagne.Altitude%TYPE := &pAlt;
   vCha Montagne.Chaine%TYPE   := '&pCha';
   n NUMBER;
   erreur_altitude EXCEPTION;
   PRAGMA EXCEPTION_INIT(erreur_altitude, -2290);
BEGIN
	-- Insérer la nouvelle montagne
	INSERT INTO Montagne (nm, nom, altitude, chaine) 
	VALUES (seq_montagne.NEXTVAL, vNom, vAlt, vCha);
	DBMS_OUTPUT.PUT_LINE('Montagne '||vNom||' ajoutée.');
	-- Valider (fin de transaction)
	COMMIT;
EXCEPTION
	WHEN DUP_VAL_ON_INDEX THEN
		ROLLBACK;
		DBMS_OUTPUT.PUT_LINE ('Montagne existante !');
	WHEN erreur_altitude THEN
		ROLLBACK;
		DBMS_OUTPUT.PUT_LINE ('Altitude invalide !');
	WHEN OTHERS THEN
		ROLLBACK;
		DBMS_OUTPUT.PUT_LINE (SQLERRM);
		RAISE_APPLICATION_ERROR (-20000, 'ERREUR IMPREVUE !');
END;
/


---------------------------------------------------------
-- 2.	Bloc PL /SQL d’ajout d’une montagne à un pays
---------------------------------------------------------

-- 1
SET SERVEROUTPUT ON;

ACCEPT pNom  PROMPT 'Saisir un nom de montagne : ';
ACCEPT pAlt  PROMPT 'Saisir l''altitude de la montagne : ';
ACCEPT pCha  PROMPT 'Saisir la chaîne de montagnes : ';
ACCEPT pNomp PROMPT 'Saisir le nom du pays : ';

DECLARE
   vNom  Montagne.Nom%TYPE      := '&pNom';
   vAlt  Montagne.Altitude%TYPE :=  &pAlt;
   vCha  Montagne.Chaine%TYPE   := '&pCha';
   vNomp Pays.Nom%TYPE          := '&pNomp';
   n NUMBER;
   erreur_altitude EXCEPTION;
   PRAGMA EXCEPTION_INIT(erreur_altitude, -2290);
   erreur_pays EXCEPTION;
   PRAGMA EXCEPTION_INIT(erreur_pays, -2291);
BEGIN
   -- Insérer la nouvelle montagne
   INSERT INTO Montagne (nm, nom, altitude, chaine) 
   VALUES (seq_montagne.NEXTVAL, vNom, vAlt, vCha);
   DBMS_OUTPUT.PUT_LINE('Montagne '||vNom||' enregistrée.');
   -- Insérer la nouvelle localisation
   INSERT INTO Localiser (nm, nomp) 
   VALUES (seq_montagne.CURRVAL, vNomp);
   DBMS_OUTPUT.PUT_LINE('Localisation de '||vNom||' dans '||vNomP||' enregistrée.');
   -- Valider (fin de transaction)
   COMMIT;
EXCEPTION
	WHEN DUP_VAL_ON_INDEX THEN
		ROLLBACK;
		DBMS_OUTPUT.PUT_LINE ('Montagne existante !');
	WHEN erreur_altitude THEN
		ROLLBACK;
		DBMS_OUTPUT.PUT_LINE ('Altitude invalide !');
    WHEN erreur_pays THEN
		ROLLBACK;
		DBMS_OUTPUT.PUT_LINE ('Pays inconnu !');
	WHEN OTHERS THEN
		ROLLBACK;
		DBMS_OUTPUT.PUT_LINE (SQLERRM);
		RAISE_APPLICATION_ERROR (-20000, 'ERREUR IMPREVUE !');
END;
/

---------------------------------------------------------
-- 3.	Bloc PL/SQL d’ajout d’un pays
---------------------------------------------------------

-- 1
ACCEPT pNom    PROMPT 'Saisir le nom du pays : ';
ACCEPT pCap    PROMPT 'Saisir la capitale du pays : ';
ACCEPT pSup    PROMPT 'Saisir la superficie du pays : ';
ACCEPT pPop    PROMPT 'Saisir la population du pays : ';
ACCEPT pIs3    PROMPT 'Saisir le code ISO3 du pays : ';
ACCEPT pIs2    PROMPT 'Saisir le code ISO2 du pays : ';
ACCEPT pCon    PROMPT 'Saisir le contnent du pays : ';

DECLARE
   -- Affectations des paramètres aux variables locales
   vNom Pays.Nom%TYPE        := '&pNom';
   vCap Pays.Capitale%TYPE   := '&pCap';
   vSup Pays.Superficie%TYPE := &pSup;
   vPop Pays.Population%TYPE := &pPop;
   vIs3 Pays.Iso3%TYPE       := '&pIs3';
   vIs2 Pays.Iso2%TYPE       := '&pIs2';
   vCon Pays.NomC%TYPE       := '&pCon';
   n NUMBER;
   erreur_ck EXCEPTION;
   PRAGMA EXCEPTION_INIT(erreur_ck, -2290);
   erreur_fk EXCEPTION;
   PRAGMA EXCEPTION_INIT(erreur_fk, -2291);
BEGIN
	-- Insertion du nouveau Pays
	INSERT INTO Pays (nom, capitale, superficie, population, iso3, iso2, nomc)
	VALUES (vNom, vCap, vSup, vPop, vIs3, vIs2, vCon);
	DBMS_OUTPUT.PUT_LINE('Pays '||vNom||' ajouté.');
	-- Valider (fin de transaction)
	COMMIT;
EXCEPTION
	WHEN erreur_fk THEN
		ROLLBACK;
		DBMS_OUTPUT.PUT_LINE ('Continent'||vCon||' inconnu !');
	WHEN erreur_ck THEN
		ROLLBACK;
		IF (SQLERRM LIKE '%CK_PAYS_SUPERFICIE%') THEN
			DBMS_OUTPUT.PUT_LINE ('Superficie de '||vNom||' négative ou nulle !');
		ELSIF (SQLERRM LIKE '%CK_PAYS_POPULATION%') THEN
			DBMS_OUTPUT.PUT_LINE ('Population de '||vNom||' négative ou nulle !');
		END IF;
	WHEN DUP_VAL_ON_INDEX THEN
		ROLLBACK;
		IF (SQLERRM LIKE '%PK_PAYS%') THEN
			DBMS_OUTPUT.PUT_LINE ('Pays '||vNom||' existant !');
		ELSIF (SQLERRM LIKE '%UK_PAYS_ISO3%') THEN
			DBMS_OUTPUT.PUT_LINE ('Code ISO3 '||vIs3||' existant !');
		ELSIF (SQLERRM LIKE '%UK_PAYS_ISO2%') THEN
			DBMS_OUTPUT.PUT_LINE ('Code ISO2 '||vIs2||' existant !');
		END IF;
		ROLLBACK;
	WHEN OTHERS THEN
		ROLLBACK;
		DBMS_OUTPUT.PUT_LINE (SQLERRM);
		RAISE_APPLICATION_ERROR (-20000, 'ERREUR IMPREVUE !');
END;
/

---------------------------------------------------------
-- 4.	Bloc PL/SQL de suppression d’un pays
---------------------------------------------------------

-- 1
ACCEPT pNom    PROMPT 'Saisir le nom du pays : ';

DECLARE
   -- Affectations des paramètres aux variables locales
   vNom Pays.Nom%TYPE := '&pNom';
   vPays Pays%ROWTYPE;
BEGIN
	-- Vérification de l'existence du pays
	SELECT * INTO vPays
	FROM Pays
	WHERE nom = vNom;
	-- suppression des localisations
	DELETE FROM Localiser WHERE nomp = vNom;
	-- suppression des traversées
	DELETE FROM Traverser WHERE nomp = vNom;
	-- suppression des frontières
	DELETE FROM Frontiere WHERE nomp = vNom OR nomf = vNom;
	-- Insertion du nouveau Pays 
	DELETE FROM Pays WHERE nom = vNom;
	DBMS_OUTPUT.PUT_LINE('Pays '||vNom||' supprimé.');
	-- Valider (fin de transaction)
	COMMIT;
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		ROLLBACK;
		DBMS_OUTPUT.PUT_LINE ('Pays '||vNom||' inconnu !');
	WHEN OTHERS THEN
		ROLLBACK;
		DBMS_OUTPUT.PUT_LINE (SQLERRM);
		RAISE_APPLICATION_ERROR (-20000, 'ERREUR IMPREVUE !');
END;
/


