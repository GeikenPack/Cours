SELECT nomp
FROM Localiser
WHERE nm IN (SELECT nm
			FROM Montagne
			WHERE nom = 'Aconcagua');

SELECT nomp
FROM Localiser
WHERE nm = (SELECT nm
			FROM Montagne
			WHERE nom = 'Aconcagua');

SELECT nomp
FROM Localiser
WHERE nm = ALL(SELECT nm
			FROM Montagne
			WHERE nom = 'Aconcagua');
			
SELECT nomp
FROM Localiser
WHERE nm = ANY(SELECT nm
			FROM Montagne
			WHERE nom = 'Aconcagua');
			
--===============================================================================

SELECT nom, altitude
FROM Montagne
WHERE nm IN (SELECT nm
			FROM Localiser
			WHERE nomp = 'Argentine');
			
SELECT nom, altitude
FROM Montagne
WHERE nm = ANY (SELECT nm
			FROM Localiser
			WHERE nomp = 'Argentine');
			
SELECT nom, altitude
FROM Montagne
WHERE nm = ALL (SELECT nm
			FROM Localiser
			WHERE nomp = 'Argentine');
			
SELECT nom, altitude
FROM Montagne
WHERE nm = (SELECT nm
			FROM Localiser
			WHERE nomp = 'Argentine');
			
--==============================================================================

SELECT nom, altitude
FROM Montagne
WHERE nm IN (SELECT nm
			FROM Localiser
			WHERE nomp IN (SELECT nomp
						   FROM Frontiere
						   WHERE nomf = 'Argentine'));
						   
SELECT nom, altitude
FROM Montagne
WHERE nm = ANY(SELECT nm
			FROM Localiser
			WHERE nomp = ANY(SELECT nomp
						   FROM Frontiere
						   WHERE nomf = 'Argentine'));
						
--==============================================================================

SELECT chaine
FROM Montagne
WHERE altitude >= ALL(SELECT altitude
					  FROM Montagne);

SELECT chaine
FROM Montagne
WHERE altitude = (SELECT MAX(altitude)
				  FROM Montagne);

--==============================================================================

SELECT nom, altitude
FROM Montagne
WHERE altitude <= ALL(SELECT altitude
					  FROM Montagne);
					  
SELECT nom, altitude
FROM Montagne
WHERE altitude = (SELECT MIN(altitude)
				  FROM Montagne);
				  
--==============================================================================

SELECT nom
FROM Pays
WHERE nomc = 'Amérique'
AND nom NOT IN(SELECT nomp
			   FROM Localiser);
			   
SELECT nom
FROM Pays
WHERE nomc = 'Amérique'
AND nom <>ALL(SELECT nomp
			   FROM Localiser);
			   
--==============================================================================

SELECT nom
FROM Pays
WHERE nomc = 'Amérique'
AND nom NOT IN(SELECT nomp
			   FROM Localiser)
AND nom NOT IN(SELECT nomp
			   FROM Traverser);
			   
SELECT nom
FROM Pays
WHERE nomc = 'Amérique'
AND nom <>ALL(SELECT nomp
			   FROM Localiser)
AND nom <>ALL(SELECT nomp
			  FROM Traverser);
			  
--==============================================================================

SELECT nom, altitude
FROM Montagne
WHERE altitude =(SELECT MAX(altitude)
					  FROM Montagne
					  WHERE nm = ANY(SELECT nm
									FROM Localiser
									WHERE nomp = ANY(SELECT nom
													FROM Pays
													WHERE nomc = 'Amérique')));
								 