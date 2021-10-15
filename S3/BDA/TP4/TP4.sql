--1.1
DROP TABLE Statistique;
CREATE TABLE Statistique
(
    iso3 CHAR(3),
    ddate DATE,
    cases NUMBER,
    vac NUMBER,
    fvacc NUMBER,
    CONSTRAINT pk_statistique PRIMARY KEY (iso3)
);

--1.2
INSERT INTO Statistique (iso3, ddate, cases, vac, fvacc)
SELECT DISTINCT iso3, ddate, cases, vacc, fvacc
FROM Pandemic P
WHERE ddate = (SELECT MAX(ddate)
               FROM Pandemic
               WHERE iso3 = P.iso3
               AND vacc IS NOT NULL
               AND cases IS NOT NULL
               AND fvacc IS NOT NULL);

SELECT * FROM Statistique;

--1.3
CREATE OR REPLACE TRIGGER t_iud_pandemic
AFTER INSERT OR UPDATE OF cases, vacc, fvacc
ON Pandemic
FOR EACH ROW
BEGIN
    UPDATE Statistique
    SET ddate = :NEW.ddate,
        cases = :NEW.cases,
        vac = :NEW.vacc,
        fvacc = :NEW.fvacc
    WHERE iso3 = :NEW.iso3
    AND ddate <= :NEW.ddate;
END;
/

INSERT INTO Pandemic (iso3, ddate, cases, vacc, fvacc)
VALUES ('FRA', TO_DATE('2021-09-20','YYYY-MM-DD'), 1, 1, 1);

SELECT * FROM Statistique;

--2.1
DROP TABLE Trace;
CREATE TABLE Trace
(
    no NUMBER,
    ordre VARCHAR(250)
);

--2.2
DROP SEQUENCE SEQ_no;
CREATE SEQUENCE SEQ_no;

--2.3
CREATE OR REPLACE TRIGGER t_iud_pandemic_trace
AFTER INSERT OR UPDATE OF cases, vacc, fvacc
ON Pandemic
FOR EACH ROW
DECLARE
    tDate DATE;
BEGIN
    SELECT ddate INTO tDate 
    FROM Statistique 
    WHERE iso3 = :NEW.iso3;

    IF (INSERTING AND tDate < :NEW.ddate) THEN
        INSERT INTO Trace
        VALUES(SEQ_no.nextval,
               'UPDATE Statistique
                SET ddate = '''||:NEW.ddate||''',
                    cases = '||:NEW.cases||',
                    vac = '||:NEW.vacc||',
                    fvacc = '||:NEW.fvacc||'
                WHERE iso3 = '||:NEW.iso3||'
                AND ddate <= '''||:NEW.ddate||''';');
    ELSIF (UPDATING AND tDate < :NEW.ddate) THEN
        INSERT INTO Trace
        VALUES(SEQ_no.nextval,
               'UPDATE Statistique
                SET ddate = '''||:NEW.ddate||''',
                    cases = '||:NEW.cases||',
                    vac = '||:NEW.vacc||',
                    fvacc = '||:NEW.fvacc||'
                WHERE iso3 = '||:NEW.iso3||'
                AND ddate <= '''||:NEW.ddate||''';');
    END IF;
END;
/

DROP TRIGGER t_iud_pandemic;

INSERT INTO Pandemic (iso3, ddate, cases, vacc, fvacc)
VALUES ('FRA', TO_DATE('2021-09-21','YYYY-MM-DD'), 11, 11, 11);

SELECT * FROM Trace;

--2.5
DECLARE CURSOR c1 IS SELECT ordre
                     FROM Trace
                     ORDER BY no FOR UPDATE;
BEGIN
    FOR ligne IN c1 LOOP
        EXECUTE IMMEDIATE ligne.ordre;
        DELETE FROM Trace WHERE CURRENT OF c1;
    END LOOP;
END;
/
