--1.1
CREATE OR REPLACE VIEW V_Pays_Europeens (iso3, iso2, nom, cap, pop, sup, esp, nomR, cname, vacc, fvacc) AS
SELECT C.iso3, C.iso2, C.name, C.capital, C.population, C.area, C.expectancy, R.name, C.cname, P.vacc, P.fvacc
FROM Country C, Pandemic P, Region R
WHERE C.cname = 'Europe'
AND C.iso3 = P.iso3
AND C.rcode = R.code
AND P.ddate = (SELECT MAX(ddate)
               FROM Pandemic
               WHERE iso3 = P.iso3
               AND vacc IS NOT NULL
               AND fvacc IS NOT NULL);

--1.2
SELECT * FROM V_Pays_Europeens;

--1.3
INSERT INTO V_Pays_Europeens
VALUES ('TES', 'TE', 'Test', 'TesTT', 10, 10, 10, 151, 'Europe', 100, 100);

--1.4
CREATE OR REPLACE TRIGGER t_v_pays_europeens
INSTEAD OF INSERT
ON v_pays_europeens
FOR EACH ROW
DECLARE
    erreur_cname EXCEPTION;
    codeR CHAR(3);
BEGIN
    IF (:NEW.cname != 'Europe') THEN
        RAISE erreur_cname;
    END IF;
    SELECT code INTO coder FROM Region WHERE name = :NEW.nomR;
    DBMS_OUTPUT.PUT_LINE(coder);
    INSERT INTO COUNTRY (iso3, iso2, name, capital, population, area, expectancy, rcode, cname)
    VALUES (:NEW.iso3, :NEW.iso2, :NEW.nom, :NEW.cap, :NEW.pop, :NEW.sup, :NEW.esp, codeR, :NEW.cname);
    INSERT INTO Pandemic (iso3, vacc, fvacc)
    VALUES(:NEW.iso3, :NEW.vacc, :NEW.fvacc);
EXCEPTION
    WHEN erreur_cname THEN
        DBMS_OUTPUT.PUT_LINE('Continent de '||:NEW.nom||' invalide');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        RAISE_APPLICATION_ERROR(-20000, 'ERREUR INPREVUE !');
END;
/
