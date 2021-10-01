SELECT nom
FROM Localiser, Montagne
WHERE Localiser.nm = Montagne.nm AND localiser.nomp='France';

SELECT P.*
FROM Pays P, Frontiere F
WHERE F.nomp = 'France' AND f.nomf = P.nom AND P.nomc = 'Europe';

SELECT P.*
FROM Pays P, Frontiere F
WHERE F.nomp = 'France' AND f.nomf = P.nom AND P.nomc != 'Europe';

SET PAGESIZE 1000;
SELECT DISTINCT M.*
FROM Montagne M, Localiser L, Pays P
WHERE L.nm = M.nm AND L.nomp = P.nom AND P.nomc = 'Europe'
ORDER BY M.nom;

SELECT F.nomp, M.nom
FROM Localiser L, Montagne M, Frontiere F
WHERE L.nm = M.nm AND L.nomp = F.nomp AND F.nomf = 'Suisse'
ORDER BY nomp;

SELECT DISTINCT M.nom
FROM Montagne M, Localiser L
WHERE M.nm = L.nm AND (L.nomp='France' OR L.nomp='Italie');

SELECT P.nomc, P.nom, F.nom
FROM Pays P, Fleuve F, Frontiere FR, Traverser T
WHERE F.nf = T.nf AND T.nomp = FR.nomp AND FR.nomf = 'Russie' AND FR.nomp = P.nom
ORDER BY P.nomc, P.nom;

SELECT P.nom, COUNT(F.nom) AS NBF
FROM Pays P, Fleuve F, Traverser T
WHERE F.nf = T.nf AND T.nomp = P.nom AND P.nomc = 'Europe'
GROUP BY P.nom
ORDER BY NBF DESC;

SELECT P.nomc, COUNT(F.nom) AS NBF, COUNT(DISTINCT P.nom) AS NBP, SUM(F.longueur) AS LNG
FROM Pays P, Fleuve F, Traverser T
WHERE F.nf = T.nf AND T.nomp = P.nom
GROUP BY P.nomc;

SELECT P.nomc
FROM Pays P, Montagne M, Localiser L
WHERE M.nm = L.nm AND L.nomp = P.nom
HAVING MAX(COUNT(M.nom)) = (SELECT MAX(COUNT(nom))
							FROM Montagne
							GROUP BY nom);