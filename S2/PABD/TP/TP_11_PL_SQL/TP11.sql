--1.1
SET SERVEROUTPUT ON;
ACCEPT pNomC PROMPT 'Saisissez le nom du continent';

DECLARE 
	vNomC Pays.nomc%TYPE := '&pNomC';
	CURSOR C1 IS SELECT nom, iso3, iso2, capitale FROM Pays WHERE nomc = vNomC ORDER BY nom;
	n NUMBER;
	nomCError EXCEPTION;
	nbError EXCEPTION;
	vNomP Pays.nom%TYPE;
	vIso3 Pays.iso3%TYPE;
	vIso2 Pays.iso2%TYPE;
	vCapitale Pays.capitale%TYPE;
	
BEGIN
	--Vérification existance continent
	SELECT COUNT(*) INTO n FROM Continent WHERE nom = vNomC;
	IF n < 1 THEN
		RAISE nomCError;
	END IF;
	--Vérification Présence pays
	SELECT COUNT(*) INTO n FROM Pays WHERE nomc = vNomC;
	IF n < 1 THEN
		RAISE nbError;
	END IF;
	--Affichage des pays
	OPEN C1;
    FETCH C1 INTO vNomP, vIso3, vIso2, vCapitale;
	WHILE C1%FOUND LOOP
		DBMS_OUTPUT.PUT_LINE(vNomP||' ('||vIso3||'-'||vIso2||') '||vCapitale);
        FETCH C1 INTO vNomP, vIso3, vIso2, vCapitale;
	END LOOP;
	
EXCEPTION
	WHEN nomCError THEN
		ROLLBACK;
		DBMS_OUTPUT.PUT_LINE('Continent inexistant');
	WHEN nbError THEN
		ROLLBACK;
		DBMS_OUTPUT.PUT_LINE('Aucun pays');
	WHEN OTHERS THEN
		ROLLBACK;
		DBMS_OUTPUT.PUT_LINE(SQLERRM);
		RAISE_APPLICATION_ERROR(-20000, 'ERREUR IMPREVUE !');
END;
/

--2.1
SET SERVEROUTPUT ON;
ACCEPT pNomC PROMPT 'Saisissez le nom du continent';

DECLARE
	vNomC Pays.nomc%TYPE := '&pNomC';
	CURSOR C1 IS SELECT P.nom, P.iso3, P.iso2, COUNT(L.nm) AS nbM
				 FROM Pays P, Localiser L
				 WHERE P.nom = L.nomp AND P.nomc = vNomC
                 GROUP BY P.nom, P.iso3, P.iso2
				 ORDER BY P.nom;
	n NUMBER;
	nomCError EXCEPTION;
	nbError EXCEPTION;
	maMontagne Montagne%ROWTYPE;

BEGIN
	--Vérification existance continent
	SELECT COUNT(*) INTO n FROM Continent WHERE nom = vNomC;
	IF n < 1 THEN
		RAISE nomCError;
	END IF;
	--Vérification Présence pays
	SELECT COUNT(*) INTO n FROM Pays WHERE nomc = vNomC;
	IF n < 1 THEN
		RAISE nbError;
	END IF;
	--Affichage des informations
	FOR li IN C1 LOOP
		DBMS_OUTPUT.PUT_LINE(li.nom||' ('||li.iso3||'-'||li.iso2||')');
		DBMS_OUTPUT.PUT_LINE('	Nombre de Montagne : '||li.nbM);
		SELECT M.* INTO maMontagne 
		FROM Montagne M, Localiser L
		WHERE L.nm = M.nm AND nomp = li.nom
		AND M.altitude = (SELECT MAX(M2.altitude)
						  FROM Montagne M2, Localiser L2
						  WHERE M2.nm = L2.nm
						  AND L2.nomp = li.nom);
		DBMS_OUTPUT.PUT_LINE('	Montagne la plus élevée : '||maMontagne.nom||' ('||maMontagne.altitude||' mètres)');
	END LOOP;
EXCEPTION
	WHEN nomCError THEN
		ROLLBACK;
		DBMS_OUTPUT.PUT_LINE('Continent inexistant');
	WHEN nbError THEN
		ROLLBACK;
		DBMS_OUTPUT.PUT_LINE('Aucun pays');
	WHEN OTHERS THEN
		ROLLBACK;
		DBMS_OUTPUT.PUT_LINE(SQLERRM);
		RAISE_APPLICATION_ERROR(-20000, 'ERREUR IMPREVUE !');
END;
/