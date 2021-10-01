SELECT nomf FROM Frontiere WHERE nomp='France'
UNION
SELECT nomf FROM Frontiere WHERE nomp = 'Allemagne';


SELECT P.*
FROM Pays P, Frontiere F
WHERE F.nomp='France' AND F.nomf = P.nom
UNION
SELECT P.*
FROM Pays P, Frontiere F
WHERE F.nomp='Allemagne' AND F.nomf = P.nom;

SELECT nomf FROM Frontiere WHERE nomp = 'France'
INTERSECT
SELECT nomf FROM Frontiere WHERE nomp = 'Allemagne';

SELECT nomf FROM Frontiere WHERE nomp = 'Espagne'
MINUS
SELECT nomf FROM Frontiere WHERE nomp != 'Espagne';

SELECT M.* FROM Montagne M, Localiser L WHERE L.nomp = 'France' AND M.nm = L.nm
INTERSECT
SELECT M.* FROM Montagne M, Localiser L WHERE L.nomp = 'Italie' AND L.nm = M.nm;

SELECT M.* FROM Montagne M, Localiser L WHERE L.nomp = 'Inde' AND L.nm = M.nm
MINUS
SELECT M.* FROM Montagne M, Localiser L WHERE L.nomp != 'Inde' AND L.nm = M.nm;

SELECT M.* FROM Montagne M, Localiser L WHERE L.nomp = 'Inde' AND L.nm = M.nm
UNION
SELECT M.* FROM Montagne M, Localiser L WHERE L.nomp = 'Chine' AND L.nm = M.nm;

SELECT M.Chaine FROM Montagne M, Localiser L WHERE L.nomp = 'Chine' AND L.nm = m.nm
INTERSECT
SELECT M.Chaine FROM Montagne M, Localiser L WHERE L.nomp = 'Inde' AND L.nm = m.nm
INTERSECT
SELECT M.Chaine FROM Montagne M, Localiser L WHERE L.nomp = 'Pakistan' AND L.nm = m.nm;

SELECT F.nom FROM Fleuve F, Traverser T WHERE T.nomp = 'Chine' AND T.nf = F.nf
INTERSECT
SELECT F.nom FROM Fleuve F, Traverser T WHERE T.nomp = 'Inde' AND T.nf = F.nf
INTERSECT
SELECT F.nom FROM Fleuve F, Traverser T WHERE T.nomp = 'Pakistan' AND T.nf = F.nf;

SELECT F.nom FROM Fleuve F, Traverser T WHERE T.nomp = 'Chine' AND T.nf = F.nf
INTERSECT
SELECT F.nom FROM Fleuve F, Traverser T WHERE T.nomp = 'Inde' AND T.nf = F.nf
MINUS
SELECT F.nom FROM Fleuve F, Traverser T WHERE T.nomp = 'Pakistan' AND T.nf = F.nf;
