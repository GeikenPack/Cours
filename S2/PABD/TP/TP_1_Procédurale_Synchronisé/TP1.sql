--1.2
ALTER TABLE Continent
ADD (NBP DECIMAL(5));

--1.3
UPDATE Continent C
SET C.NBP = (SELECT COUNT(*) 
		     FROM Pays P
			 WHERE P.nomc = C.nom);
			 
--1.4
SELECT * FROM Continent

--1.5
ALTER TABLE Pays
ADD (NBP DECIMAL(5),
	 NBF DECIMAL(5),
	 NBM DECIMAL(5));

--1.6
UPDATE Pays P
SET P.NBP = (SELECT COUNT(*) 
			 FROM Frontiere F 
			 WHERE F.nomp = P.nom),
	P.NBF = (SELECT COUNT(*) 
			 FROM Traverser T 
			 WHERE T.nomp = P.nom),
	P.NBM = (SELECT COUNT(*) 
			 FROM Localiser L 
			 WHERE L.nomp = P.nom);


--2.1.a
SELECT *
FROM Fleuve
WHERE nf IN (SELECT nf 
			 FROM Traverser 
			 WHERE nomp = 'Inde');

--2.1.b
SELECT * 
FROM Fleuve F
WHERE EXISTS (SELECT T.nf 
			  FROM Traverser T 
			  WHERE T.nomp = 'Inde' 
			  AND T.nf = F.nf);  

--2.2.a
SELECT nom, capitale
FROM Pays
WHERE nom IN (SELECT nomf FROM Frontiere WHERE nomp = 'Inde');

--2.2.b
SELECT nom, capitale
FROM Pays P
WHERE EXISTS (SELECT F.nomf 
			  FROM Frontiere F 
			  WHERE F.nomp = 'Inde' 
			  AND F.nomf = P.nom);

--2.3.a
SELECT *
FROM Fleuve
WHERE nf IN (SELECT nf
			 FROM Traverser
			 WHERE nomp = 'Inde' 
			 AND  nf IN (SELECT nf
                         FROM Traverser
                         WHERE nomp = 'Chine'));
						 
--2.3.b
SELECT *
FROM Fleuve F
WHERE EXISTS (SELECT nf 
			  FROM Traverser T 
			  WHERE T.nomp = 'Chine' 
			  AND T.nf = F.nf
			  
			  INTERSECT
			  
			  SELECT nf 
			  FROM Traverser T 
			  WHERE T.nomp = 'Inde' 
			  AND T.nf = F.nf);
			  
--2.4.a
SELECT nom, capitale
FROM Pays
WHERE nom IN (SELECT nomp
			  FROM Traverser
			  WHERE nf IN (SELECT nf 
						   FROM Traverser
						   WHERE nomp = 'Inde'))
AND nom != 'Inde';

--2.4.b
SELECT P.nom, P.capitale
FROM Pays P
WHERE EXISTS (SELECT T.nf
			  FROM Traverser T
			  WHERE T.nomp = 'Inde'
			  
			  INTERSECT 
			  
			  SELECT T.nf
			  FROM Traverser T
			  WHERE P.nom = T.nomp)
AND P.nom != 'Inde';

--2.5.a
SELECT nom
FROM Continent
WHERE NBP = (SELECT MAX(NBP) FROM Continent);

--2.5.b
SELECT nomc
FROM Pays
GROUP BY nomc
HAVING COUNT(nom) = (SELECT MAX(COUNT(nom)) 
					 FROM Pays 
					 GROUP BY nomc);


--2.6.a
SELECT nomc, nom
FROM Pays P1
WHERE NBM = (SELECT MAX(NBM) 
			 FROM Pays P2 
			 WHERE P1.nomc = P2.nomc);

--2.6.b
SELECT nomc, nom
FROM Pays P
WHERE nom IN (SELECT nomp
			  FROM Localiser
			  GROUP BY nomp
			  HAVING COUNT(nomp) = (SELECT MAX(COUNT(nomp)) 
									FROM Localiser 
									WHERE nomp IN (SELECT nom 
												   FROM Pays 
												   WHERE nomc = P.nomc)
									GROUP BY nomp));

			 
			 