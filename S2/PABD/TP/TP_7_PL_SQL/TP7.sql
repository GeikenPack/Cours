--1.1
SET SERVEROUTPUT ON;
ACCEPT pNomM PROMPT 'Saisissez le nom de la montagne';
ACCEPT pAlt PROMPT 'Saisissez l altitude de la montagne';
ACCEPT pChaine PROMPT 'Saisissez le nom de la chaine de la montagne';
ACCEPT pNomP PROMPT 'Saisissez le nom du pays';

DECLARE
	vNomM Montagne.nom%TYPE := '&pNomM';
	vAlt Montagne.altitude%TYPE := '&pAlt';
	vChaine Montagne.chaine%TYPE := '&pChaine';
	vNomP Pays.nom%TYPE := '&pNomP';
	
BEGIN
	IF vAlt < 0 THEN
		RAISE_APPLICATION_ERROR(-20001, 'Altitude négative');
	END IF;
	INSERT INTO Montagne(nm, nom, altitude, chaine) 
	VALUES(seq_montagne.NEXTVAL, vNomM, vAlt, vChaine);
	DBMS_OUTPUT.PUT_LINE('Montagne'||vNomM||' ajoutée.');
	INSERT INTO Localiser(nm, nomp)
	VALUES (seq_montagne.CURRVAL, vNomP);
	DBMS_OUTPUT.PUT_LINE('Montagne'||vNomM||' ajoutée dans'||vNomP||'.');
	COMMIT;
END;

--2.1   
SET SERVEROUTPUT ON;
ACCEPT pListe PROMPT 'Saisir la liste des montagnes';
ACCEPT pNom PROMPT 'Saissiez le nom du pays';

DECLARE
	vListe VARCHAR(30) := '&pListe';
	vNom Pays.nom%TYPE := '&pNom';
    listeEx BOOLEAN := FALSE;

BEGIN
	FOR i IN (SELECT regexp_substr(vListe, '[^-]+', 1, level) AS colonne 
	FROM DUAL
	CONNECT BY regexp_substr(vListe, '[^-]+', 1, level) IS NOT NULL) LOOP
        listeEx := TRUE;
		INSERT INTO Localiser(nm, nomp) Values(i.colonne, vNom);
        DBMS_OUTPUT.PUT_LINE('Localisation enregistré');
	END LOOP;
	
    IF (listeEx = FALSE;) THEN
        RAISE_APPLICATION_ERROR(-20001, 'Liste vide');
    ELSE
        COMMIT;
    END IF;
    
END;

