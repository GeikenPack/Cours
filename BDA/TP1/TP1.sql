-- 2.2
ALTER TABLE Pandemic
ADD CONSTRAINT pk_pandemic PRIMARY KEY (iso3, date),
ADD CONSTRAINT fk_pandemic_iso3 FOREIGN KEY (iso3) REFERENCES Pays (iso3),
ADD CONSTRAINT ck_pandemic_cases CHECK (cases >= 0),
ADD CONSTRAINT ck_panemic_deaths CHECK (deaths >= 0),
ADD CONSTRAINT ck_pandemic_rrate CHECK (rrate >= 0),
ADD CONSTRAINT ck_pandemic_icu CHECK (icu >= 0),
ADD CONSTRAINT ck_pandemic_hpatients CHECK (hpatients >= 0),
ADD CONSTRAINT ck_pandemic_tests CHECK (test >= 0),
ADD CONSTRAINT ck_pandemic_prate CHECK (prate >= 0),
ADD CONSTRAINT ck_pandemic_vacc CHECK (vacc >= 0),
ADD CONSTRAINT ck_pandemic_fvacc CHECK (fvacc >= 0);

-- 2.4
SELECT *
FROM Continent;

-- 2.5
SELECT COUNT(*)
FROM Continent;
SELECT COUNT(*)
FROM Region;
SELECT COUNT(*)
FROM Country;
SELECT COUNT(*)
FROM Border;
SELECT COUNT(*)
FROM Pandemic;

-- 2.6
SET PAGESIZE 10000;
COLUMN OBJECT_NAME FORMAT A25;
COLUMN CREATED FORMAT A10;
SELECT OBJECT_NAME, CREATED
FROM USER_OBJECTS;

-- 3.1
SET SERVEROUTPUT ON;

ACCEPT pIso3 PROMPT 'Saisissez l''ISO3 du pays';
ACCEPT pIso2 PROMPT 'Saisissez l''ISO2 du pays';
ACCEPT pNom  PROMPT 'Saisissez le nom du pays';
ACCEPT pCap  PROMPT 'Saisissez la capitale du pays';
ACCEPT pPop  PROMPT 'Saisissez la population du pays';
ACCEPT pSup  PROMPT 'Saisissez la superficie du pays';
ACCEPT pCode PROMPT 'Saisissez le code de région du pays';
ACCEPT pCont PROMPT 'Saisissez le continent du pays';

DECLARE
    vIso3 Country.Iso3%TYPE       := '&pIso3';
    vIso2 Country.Iso2%TYPE       := '&pIso2';
    vNom Country.Name%TYPE        := '&pNom';
    vCap Country.Capital%TYPE     := '&pCap';
    vPop Country.population%TYPE := '&pPop';
    vSup Country.area%TYPE       := '&pSup';
    vCode Country.rcode%TYPE      := '&pCode';
    vCont Country.cname%TYPE      := '&pCont';
    n NUMBER
    erreur_pays EXCEPTION;
    erreur_iso3 EXCEPTION;
    erreur_iso2 EXCEPTION;
    erreur_cont EXCEPTION;
    erreur_ck EXCEPTION;
    erreur_fk EXCEPTION;
    PRAGMA EXCEPTION_INIT(erreur_ck, -2290);
    PRAGMA EXCEPTION_INIT(erreur_fk, -2291);
BEGIN
    
    INSERT INTO Country (iso3, iso2, name, capital, population, area, rcode, cname)
    VALUES (vIso3, vIso2, vNom, vCap, vPop, vSup, vCode, vCont),
    DBMS_OUTPUT.PUT_LINE('Pays '||vNom||' ajouté');
    COMMIT;
EXCEPTION
    WHEN erreur_ck THEN
        ROLLBACK;
        IF (SQLERRM LIKE '%CK_COUNTRY_AREA%') THEN
            DBMS_OUTPUT.PUT_LINE('Superficie de '||vNom||'négative ou nul');
        ELSIF (SQLERRM LIKE '%CK_COUNTRY_POPULATION%') THEN
            DBMS_OUTPUT.PUT_LINE('Population de '||vNom||'négative ou nul');
        ELSIF (SQLERRM LIKE '%CK_COUNTRY_RCode%') THEN
            DBMS_OUTPUT.PUT_LINE('Code de région de '||vNom||'négatif ou nul');
    WHEN erreur_fk THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Code de région inconnu !');
    WHEN DUP_VAL_ON_INDEX THEN
        ROLLBACK;
        IF (SQLERRM LIKE '%PK_COUNTRY%') THEN
            DBMS_OUTPUT.PUT_LINE('Pays '||vNom||'Existant !');
        ELSIF (SQLERRM LIKE'%UK_COUNTRY_ISO2%') THEN
            DBMS_OUTPUT.PUT_LINE('Code ISO2 '||vIso2||'Existant !');
        ELSIF (SQLERRM LIKE'%UK_COUNTRY_name%') THEN
            DBMS_OUTPUT.PUT_LINE('Code ISO2 '||vNom||'Existant !');
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        RAISE_APPLICATIONN_ERROR(-20000, 'ERREUR IMPREVUE !');
END;
/
