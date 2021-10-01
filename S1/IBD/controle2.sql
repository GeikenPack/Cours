SELECT F.nom, F.lng
FROM Fleuve F, Traverser T, Pays P
WHERE P.nomc = 'Amérique' AND P.nom = T.nomp AND T.nf = F.nf;

SELECT P.nom
FROM Pays P, Traverser T, Fleuve F
WHERE (F.nom = 'Amazone' OR F.nom = 'Napo') AND F.nf = T.nf AND T.nomp = P.nom;

SELECT P1.nom
FROM Pays P1, Pays P2
WHERE P1.pop < P2.pop AND P2.nom = 'Pérou';

SELECT F.nom
FROM Fleuve F, Drainer D
WHERE  F.nom = D.nomf AND D.noma IS NULL;

SELECT nomf, COUNT(noma) as NBA
FROM Drainer;

SELECT nomf
FROM Traverser T
WHERE COUNT(nomp) >= ALL(COUNT(nomp));

SELECT nom
FROM Pays
WHERE nom IN (SELECT nomp
			  FROM Traverser
			  WHERE nomf = 'Amazone' OR nomf = 'Napo');
			  
SELECT nom
FROM Pays
WHERE nom NOT IN(SELECT nomp
				 FROM Traverser);
				 
SELECT nomp FROM Traverser WHERE nomf = 'Amazone'
INTERSECT
SELECT nomp FROM Traverser WHERE nomf = 'Napo';

SELECT nomf FROM Frontiere WHERE nomp = 'Brésil'
INTERSECT
SELECT nomp FROM Traverser WHERE nomf = 'Amazone';