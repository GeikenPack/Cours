SELECT nm, nom, altitude
FROM Montagne
WHERE altitude >= 6000
AND chaine = 'Cordillère des Andes'
ORDER BY altitude DESC;

SELECT  DISTINCT M.nm, M.nom, M.altitude
FROM Montagne M, Localiser L
WHERE M.altitude > 8000
AND M.nm = L.nm
AND (L.nomp = 'Inde'
OR L.nomp = 'Népal')
ORDER BY altitude DESC;

COLUMN nom FORMAT A32;
COLUMN capitale FORMAT A15;
COLUMN nomc FORMAT A10;
SELECT DISTINCT P.nom, P.capitale, P.superficie, P.nomc
FROM Pays P, Montagne M, Localiser L, Fleuve F, Traverser T
WHERE M.altitude > 5000 AND F.longueur > 2000
AND M.nm = L.nm AND T.nf = F.nf
AND P.nom = L.nomp AND P.nom = T.nomp;

SELECT L1.nm
FROM Localiser L1, Localiser L2
WHERE L1.nomp = 'Argentine' AND L2.nomp = 'Chili'
AND L1.nm = L2.nm;

SELECT F1.*
FROM Fleuve F1, Fleuve F2
WHERE F2.nom = 'Le Mékong'
AND F1.longueur > F2.longueur;

SELECT P.nom, P.capitale, P.superficie
FROM Pays P, Traverser T
WHERE P.nomc = 'Amérique'
AND P.nom = T.nomp(+)
AND T.nf IS NULL;

SELECT P.nomc, COUNT(F.nf) AS NBF, MAX(F.longueur) AS maxl
FROM Pays P, Traverser T, Fleuve F
WHERE P.nom = T.nomp AND T.nf = F.nf
GROUP BY P.nomc;

SELECT nomp, COUNT(L.nm) AS nbm
FROM Localiser L
GROUP BY nomp
HAVING COUNT(L.nm) > 10;

SELECT P.nom, P.capitale, P.superficie
FROM Pays P, Localiser L
GROUP BY P.nom
HAVING COUNT(L.nm) >=ALL(COUNT(L.nm));

SELECT ...

SELECT P.nom, P.capitale, P.superficie, P.nomc
FROM Pays P, Localiser L, Montagne M
WHERE L.nomp = P.nom AND L.nm = M.nm AND M.altitude > 5000
INTERSECT 
SELECT P.nom, P.capitale, P.superficie, P.nomc
FROM Pays P, Traverser T, Fleuve F
WHERE P.nom = T.nomp AND T.nf = F.nf AND F.longueur > 2000;

SELECT nom, capitale, superficie, nomc
FROM Pays
WHERE nom IN(SELECT nomp
			 FROM Localiser
			 WHERE nm IN(SELECT nm
						 FROM Montagne 
						 WHERE altitude > 6000));

SELECT *
FROM Fleuve
WHERE longueur = (SELECT MAX(longueur)
				  FROM Fleuve);
				  
SELECT *
FROM Fleuve
WHERE longueur >= ALL(SELECT NVL(longueur, 0)
					  FROM Fleuve);
					  
