SELECT * FROM Continent;

COLUMN taux FORMAT 99.99;
SELECT nom, superficie AS SUP, population AS POP, croissance AS TAUX FROM Continent;

SELECT nomp AS "Pays Frontaliers"
FROM Frontiere 
WHERE nomf = 'France' 
ORDER BY nomp ASC;

SET PAGESIZE 1000;
COLUMN nom FORMAT A18;
COLUMN capitale FORMAT A19;
SELECT * FROM Pays WHERE nomC = 'Europe' ORDER BY superficie DESC;

SELECT * FROM Pays WHERE nomc = 'Europe' AND population>50000000 ORDER BY superficie DESC;

SELECT * FROM Pays WHERE nomc = 'Asie' OR nomc = 'Europe' ORDER BY nomc, nom ASC;

SELECT nom, population/superficie AS densite FROM Pays WHERE nomc = 'Asie' AND population>500000000;

SELECT * FROM Pays WHERE SUBSTR(UPPER(nom), 1, 3) = iso3;

SELECT * FROM Pays WHERE iso3 IS NULL OR iso2 IS NULL;

SELECT * FROM Montagne WHERE chaine LIKE '%Owen Stanley%';