SELECT COUNT(nom) as NDC
FROM Continent;

SELECT nomc, COUNT(nom) as NBP
FROM Pays
GROUP BY nomc;

SELECT nomc, COUNT(nom) as NBP
FROM Pays
WHERE nomc LIKE 'A%'
GROUP BY nomc;

SELECT nomc, COUNT(nom) as NBP,MIN(population) as PMIN, MAX(population) as PMAX
FROM Pays
GROUP BY nomc;

SET PAGESIZE 1000;
SELECT nomp as Pays, COUNT(nomp) as NPM
FROM Localiser
GROUP BY nomp
ORDER BY NPM DESC;

SELECT nomp, COUNT(nomp) as NBP
FROM Traverser
GROUP BY nomp
HAVING COUNT(nomp) >= 5
ORDER BY NBP DESC;

SELECT MAX(population) as PMAX
FROM Pays

SELECT nom
FROM  Pays
WHERE population = 1439085892;

SELECT nom
FROM  Pays
WHERE population = (SELECT MAX(population)
					FROM Pays);

SELECT nomc
FROM Pays
GROUP BY nomc
HAVING COUNT(nom) = 55;

SELECT nomc
FROM Pays
GROUP BY nomc
HAVING COUNT(nom) = (SELECT MAX(COUNT(nom)) 
					 FROM Pays 
					 GROUP BY nomc);
					 
SELECT nomp
FROM Localiser
GROUP BY nomp
HAVING COUNT(nomp) = (SELECT MAX(COUNT(nomp)) 
					  FROM Localiser 
					  GROUP BY nomp);