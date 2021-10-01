--1.1.a
CREATE OR REPLACE PROCEDURE ajouterMontagne(vNom Montagne.nom%TYPE, vAlt Montagne.altitude%TYPE, vCha Montagne.Chaine%TYPE) IS
	n NUMBER;
	altError EXCEPTION;
	nomError EXCEPTION;

BEGIN
	--Vérification de l'existence de la montagne
	SELECT COUNT(*) INTO n
	FROM Montagne
	WHERE nom = vNom;
	IF (n > 0) THEN
		RAISE nomError;
	END IF;
	--Vérification de l'altitude
	IF (vAlt <= 0) THEN
		RAISE altError;
	END IF;
	--Insérer nouvelle montagne
	INSERT INTO Montagne(nm, nom, altitude, chaine)
	VALUES (seq_montagne.NEXTVAL, vNom, vAlt, vCha);
	DBMS_OUTPUT.PUT_LINE('Montagne '||vNom||' ajoutée.');
	--Valider (fin de commande)
	COMMIT;
	
EXCEPTION
	WHEN nomError THEN
		ROLLBACK;
		DBMS_OUTPUT.PUT_LINE('Montagne existante !');
	WHEN altError THEN
		ROLLBACK;
		DBMS_OUTPUT.PUT_LINE('Altitude invalide !');
	WHEN OTHERS THEN
		ROLLBACK;
		DBMS_OUTPUT.PUT_LINE(SQLERRM);
		RAISE_APPLICATION_ERROR(-20000, 'ERREUR IMPREVUE !');
END;
/