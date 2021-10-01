ALTER TABLE Montagne
ADD CONSTRAINT uk_montagne_nom UNIQUE (nom);

SET SERVEROUTPUT ON;

ACCEPT pNom PROMPT 'Saisir un nom de montagne : ';
ACCEPT pAlt PROMPT 'Saisir l''altitude de la montagne : ';
ACCEPT pCha PROMPT 'Saisir la chaîne de montagnes : ';

DECLARE
   vNom Montagne.Nom%TYPE      := '&pNom';
   vAlt Montagne.Altitude%TYPE := &pAlt;
   vCha Montagne.Chaine%TYPE   := '&pCha';
   n NUMBER;
   altError EXCEPTION;
   PRAGMA EXCEPTION_INIT(altError, -2290);
BEGIN
	-- Insérer la nouvelle montagne
	INSERT INTO Montagne (nm, nom, altitude, chaine) 
	VALUES (seq_montagne.NEXTVAL, vNom, vAlt, vCha);
	DBMS_OUTPUT.PUT_LINE('Montagne '||vNom||' ajoutée.');
	-- Valider (fin de transaction)
	COMMIT;
EXCEPTION
	WHEN DUP_VAL_ON_INDEX THEN
		ROLLBACK;
		DBMS_OUTPUT.PUT_LINE ('Montagne existante !');
	WHEN altError THEN
		ROLLBACK;
		DBMS_OUTPUT.PUT_LINE ('Altitude invalide !');
	WHEN OTHERS THEN
		ROLLBACK;
		DBMS_OUTPUT.PUT_LINE (SQLERRM);
		RAISE_APPLICATION_ERROR (-20000, 'ERREUR IMPREVUE !');
END;
/