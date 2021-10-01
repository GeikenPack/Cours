SET SERVEROUTPUT ON;
--1.1
CREATE OR REPLACE FUNCTION getNBPays RETURN NUMBER AS

n NUMBER;

BEGIN
    SELECT COUNT(p.nom) INTO n FROM Pays p;
    return n;
END;
/

--1.2
BEGIN
    DBMS_OUTPUT.PUT_LINE('Nombre de pays :'||getNBPays);
END;
/

--1.3
VARIABLE n NUMBER;
EXEC :n := getNBPays;
PRINT :n;

--2.1
CREATE OR REPLACE FUNCTION getNBPaysContinent(nomCont IN Continent.nom%TYPE) 
RETURN NUMBER AS

n NUMBER;
nbPays NUMBER;

BEGIN
    --Vérification de l'existence du continent
    SELECT COUNT(nomCont) INTO n FROM Continent;
    IF (n <= 0) THEN
        RAISE_APPLICATION_ERROR(-20001, 'Continent invalide');
    END IF;

    --Vérification de la présence de pays
    SELECT COUNT(p.nom) INTO nbPays FROM Pays p WHERE p.nomc = nomCont;
    IF (nbPays <= 0) THEN
        RAISE_APPLICATION_ERROR(-20002, 'Aucun pays dans le continent');
    END IF;

    --Retour du nombre de pays
    RETURN nbPays;
END;
/

--2.2
--ACCEPT pNomC PROMPT 'Saisissez le nom du continent';

--DECLARE
  --  vNomC Continent.NOM%TYPE := '&pNomC';

--BEGIN
  --  DBMS_OUTPUT.PUT_LINE('Nombre de pays dans le continent '||vNomC||' : '||getNBPaysContinent(vNomC));-
--END;
--/

--2.3
CREATE OR REPLACE FUNCTION getNBPaysTraverses(nomFl IN VARCHAR)
RETURN NUMBER AS

n NUMBER;
nbPays NUMBER;

BEGIN
    --Vérification de l'existance du fleuve
    SELECT COUNT(f.nom) INTO n FROM Fleuve f WHERE f.nom = nomFl;
    IF (n <= 0) THEN
        RAISE_APPLICATION_ERROR(-20001, 'Fleuve saisi invalide');
    END IF;

    --Requête
    SELECT COUNT(t.nomp) INTO nbPays FROM Traverser t, Fleuve f WHERE t.nf = f.nf AND f.nom = nomFl;
    RETURN nbPays;
END;
/

--2.4
SELECT f.nf, f.nom, getNBPaysTraverses(f.nom) AS NB 
FROM Fleuve f, Traverser t, Pays p 
WHERE f.nf = t.nf AND t.nomp = p.nom 
AND p.nomc = 'Océanie'
ORDER BY NB DESC;

--3.1
CREATE OR REPLACE FUNCTION getNBPays
RETURN NUMBER AS

nbPays NUMBER := 0;

CURSOR C1 IS SELECT nom FROM Continent WHERE nom != 'Antarctique';

BEGIN
    FOR ligne in C1 LOOP
        nbPays := nbPays + getNBPaysContinent(ligne.nom);
    END LOOP;
    RETURN nbPays;
END;
/

--3.2
BEGIN
    DBMS_OUTPUT.PUT_LINE('Nombre de pays : '||getNBPays);
END;
/
