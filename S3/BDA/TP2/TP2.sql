-- 1.1
ALTER TABLE Continent
ADD NBP DECIMAL(3);

-- 1.2
UPDATE Continent c
SET NBP = (SELECT COUNT(*)
           FROM Country co
           WHERE co.cname = c.name);

SELECT * FROM Continent;

-- 1.3
CREATE OR REPLACE TRIGGER t_i_pays_continent_nbp
AFTER INSERT
ON Country
FOR EACH ROW
BEGIN
    UPDATE Continent c
    SET NBP = NBP + 1
    WHERE :NEW.cname = c.name;
END;

INSERT INTO Country  
VALUES ('UT2', 'U2', 'UT2 Jean Jaurès', 'IUT Blagnac', NULL, NULL, NULL, '039', 'Europe');
SELECT * FROM Continent;
ROLLBACK;

DELETE FROM Country
WHERE iso3 = 'UT2';

CREATE OR REPLACE TRIGGER t_i_pays_continent_nbp
AFTER INSERT OR DELETE OR UPDATE of cname
ON Country
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        UPDATE Continent c
        SET NBP = NBP + 1
        WHERE :NEW.cname = c.name;
    ELSIF DELETING THEN
        UPDATE Continent c
        SET NBP = NBP - 1
        WHERE :OLD.cname = c.name;
    ELSIF UPDATING THEN
        UPDATE Continent c
        SET NBP = NBP +1
        WHERE :NEW.cname = c.name;
        UPDATE Continent c
        SET NBP = NBP -1
        WHERE :OLD.cname = c.name;
    END IF;
END;

INSERT INTO Country  
VALUES ('UT2', 'U2', 'UT2 Jean Jaurès', 'IUT Blagnac', NULL, NULL, NULL, '039', 'Europe');
SELECT * FROM Continent;
ROLLBACK;

UPDATE COUNTRY
SET cname = 'Africa'
WHERE iso3 = 'UT2';
SELECT * FROM Continent;

DELETE FROM Country
WHERE iso3 = 'UT2';
SELECT * FROM Continent;