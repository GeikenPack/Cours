--Q1.
UPDATE Salles S, Postes P, Logiciels L, Segments Se
SET S.nbPostes = (SELECT COUNT(*) FROM Postes P WHERE P.idSalle = S.idSalle),
	P.nbLog = (SELECT COUNT(*) FROM Installer I WHERE I.idPoste = P.idPoste),
	L.nbInstall = (SELECT COUNT(*) FROM Installer I WHERE I.idLogiciel = L.idLogiciel),
	Se.nbSalles = (SELECT COUNT(*) FROM Salles S WHERE S.idSegment = Se.idSegment),
	Se.nbPostes = (SELECT COUNT(*) FROM Postes P WHERE P.idSegment = Se.idSegment);
	
--Q2.
SELECT P.nomPoste
FROM Postes P, Installer I
WHERE P.idPoste = I.idPoste
AND I.idLogiciel IN (SELECT idLogiciel
					FROM Installer
					WHERE idPoste = 'p2')
AND P.idPoste != 'p2';
					
SELECT P.nomPoste
FROM Postes P
WHERE EXISTS (SELECT idLogiciel FROM Installer WHERE idPoste = 'p2'
			  INTERSECT
			  SELECT idLogiciel FROM Installer WHERE idPoste = P.idPoste)
AND P.idPoste != 'p2';
			  
--Q3.
SELECT P.nomPoste
FROM Postes P
WHERE NOT EXISTS (SELECT idLogiciel FROM Installer WHERE idPoste = P.idPoste
				  MINUS
				  SELECT idLogiciel FROM Installer WHERE idPoste = 'p8')
AND P.idPoste != 'p8';

--Q4.
SELECT P.nomPoste
FROM Postes P
WHERE NOT EXISTS (SELECT idLogiciel FROM Installer WHERE idPoste = P.idPoste
				  MINUS
				  SELECT idLogiciel FROM Installer WHERE idPoste = 'p4')
AND NOT EXISTS (SELECT idLogiciel FROM Installer WHERE idPoste = 'p4'
				MINUS
				SELECT idLogiciel FROM Installer WHERE idPoste = P.idPoste)
AND P.idPoste != 'p4';