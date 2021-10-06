CREATE OR REPLACE TRIGGER t_iu_pays_rcode
AFTER INSERT OR UPDATE OF rcode
ON COUNTRY
FOR EACH ROW
DECLARE
    n NUMBER;
BEGIN
    SELECT COUNT(*) INTO n FROM Region R WHERE R.rcode = :NEW.rcode;
    IF (n != 0) THEN
        RAISE_APPLICATION_ERROR(-20000, 'Region incorrecte');
    END IF;
END;
/

CREATE OR REPLACE TRIGGER t_iu_pays_rcode
AFTER INSERT OR UPDATE OF rcode
ON Country
DECLARE
    n NUMBER;
BEGIN
    SELECT COUNT(*) INTO n
    FROM Country C
    WHERE C.rcode IN (SELECT R.rcode
                      FROM Region R
                      WHERE R.rcode IS NOT NULL AND R.cname IS NULL)
    AND C.rcode <> 154;

    IF (n != 0) THEN 
        RAISE_APPLICATION_ERROR(-20000, 'Region incorrecte');
    END IF;
END;
/

--Pour moi, le plus rapide est le 2eme trigger car il fait moins de selection.

CREATE OR REPLACE TRIGGER t_iu_pays_cname
AFTER INSERT OR UPDATE OF cname
ON Country
FOR EACH ROW
DECLARE
    n VARCHAR(10);
BEGIN
    SELECT cname INTO n FROM (SELECT cname FROM Region R1 WHERE R1.code = :NEW.rcode AND R1.cname IS NOT NULL
                              UNION
                              SELECT cname FROM Region R2 WHERE R2.code = :NEW.rcode AND R2.cname IS NULL);
    IF (:NEW.cname != n) THEN
        RAISE_APPLICATION_ERROR(-20001, 'Continent invalide');
    END IF;
END;
/

SELECT * FROM Region;

SET SERVEROUTPUT ON;
INSERT INTO Country  
VALUES ('UT2', 'U2', 'UT2 Jean Jaurès', 'IUT Blagnac', NULL, NULL, NULL, '202', 'Asia');

DELETE FROM Country
WHERE iso3 = 'UT2';