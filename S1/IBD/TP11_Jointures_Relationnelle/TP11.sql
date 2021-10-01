SELECT M.nom
FROM Montagne M, Localiser L1, Localiser L2
WHERE L1.nomp = 'France'
AND L2.nomp = 'Italie'
AND L1.nm = L2.nm
AND M.nm = L1.nm;

SELECT F.nom
FROM Fleuve F, Traverser T1,  Traverser T2
WHERE T1.nomp = 'France'
AND T2.nomp = 'Allemagne'
AND T1.nf = T2.nf
AND F.nf = T1.nf;

SELECT DISTINCT P1.nom, P2.nom
FROM Pays P1, Pays P2, Localiser L1, Localiser L2, Montagne M
WHERE P1.nomc = 'Asie'
AND P2.nomc = 'Europe'
AND L1.nomp = P1.nom
AND L2.nomp = P2.nom
AND M.nm = L1.nm
AND M.nm = L2.nm;

SELECT P1.nom
FROM Pays P1, Pays P2, Frontiere F1, Frontiere F2
WHERE P1.nomc = 'Amérique'
AND P2.nomc = 'Europe'
AND F1.nomp = P1.nom
AND F2.nomp = P2.nom
AND F1.nomf = P2.nom AND F2.nomf = P1.nom;

SELECT DISTINCT P2.nom
FROM Pays P1, Pays P2, Localiser L1, Localiser L2, Traverser T1, Traverser T2
WHERE P1.nom = 'Russie'
AND L1.nomp = 'Russie'
AND T1.nomp = 'Russie'
AND L2.nomp = P2.nom
AND T2.nomp = P2.nom
AND L1.nm = L2.nm
AND T1.nf = T2.nf;

SELECT DISTINCT L2.nomp
FROM Localiser L1, Localiser L2
WHERE L1.nomp = 'France' 
and L1.nm = L2.nm 
and L2.nomp <> L1.nomp;

SELECT DISTINCT P2.nom
FROM Localiser L1, Localiser L2, Pays P1, Pays P2
WHERE P1.nomc = 'Asie'
AND L1.nm = L2.nm
AND L1.nomp = P1.nom
AND L2.nomp = P2.nom
AND P1.nomc <> P2.nomc;

SELECT DISTINCT P1.nom, P2.nom
FROM Pays P1, Pays P2, Traverser T1, Traverser T2
WHERE P1.nomc = 'Europe'
AND T1.nf = T2.nf
AND T1.nomp = P1.nom
AND T2.nomp = P2.nom
AND P1.nomc <> P2.nomc;

SELECT DISTINCT P1.nom, P2.nom
FROM Pays P1, Pays P2, Frontiere F
WHERE F.nomp = P1.nom
AND F.nomf = P2.nom
AND P1.nomc <> P2.nomc;

SELECT C.nom FROM Pays P, Continent C
WHERE C.nom = P.nomc(+)
and P.nom IS NULL;

SELECT P.nom
FROM Pays P, Localiser L
WHERE P.nomc = 'Amérique'
AND P.nom = L.nomp(+)
AND L.nomp IS NULL;

SELECT P.nom, COUNT(T.nf) AS NBF
FROM Pays P, Traverser T
WHERE P.nomc = 'Amérique'
AND T.nomp(+) = P.nom
GROUP BY P.nom
ORDER BY NBF DESC;
