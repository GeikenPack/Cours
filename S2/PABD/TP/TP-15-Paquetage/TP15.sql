CREATE OR REPLACE PACKAGE gestion_geo AS
    PROCEDURE AjouterPays(vNom Pays.Nom%TYPE,
                vCap Pays.Capitale%TYPE,
                vSup Pays.Superficie%TYPE,
                vPop Pays.Population%TYPE,
                vIs3 Pays.Iso3%TYPE,
                vIs2 Pays.Iso2%TYPE,
                vCon Pays.NomC%TYPE);

    PROCEDURE AjouterMontagne(vNom Montagne.Nom%TYPE,
                              vAlt Montagne.Altitude%TYPE,
                              vCha Montagne.Chaine%TYPE);

    PROCEDURE ajouterMontagnePays(vNomM Montagne.nom%TYPE, vAlt Montagne.altitude%TYPE, vChaine Montagne.chaine%TYPE, vNomP Pays.nom%TYPE);

    PROCEDURE SupprimerPays(vNom Pays.Nom%TYPE);

    PROCEDURE AJouterFrontiere(vNomP Frontiere.NomP%TYPE,
                               vNomF Frontiere.NomF%TYPE,
                               vLong Frontiere.Longueur%TYPE);

    PROCEDURE AfficherFrontires(vNomP Pays.nom%TYPE);
END gestion_geo;
/

CREATE OR REPLACE PACKAGE BODY gestion_geo AS
    PROCEDURE ajouterPays(vNom Pays.Nom%TYPE, vCap Pays.Capitale%TYPE, vSup Pays.Superficie%TYPE, vPop Pays.Population%TYPE, vIs3 Pays.Iso3%TYPE, vIs2 Pays.Iso2%TYPE, vCon Pays.NomC%TYPE) IS
	vTestP NUMBER;
	vTestI3 NUMBER;
	vTestI2 NUMBER;
	vTestC NUMBER;
	supError EXCEPTION;
	popError EXCEPTION;
	nomPError EXCEPTION;
	iso3Error EXCEPTION;
	iso2Error EXCEPTION;
	contError EXCEPTION;
	
    BEGIN
        --Vérifications dela superficie et de la population
        IF (vSup <= 0) THEN 
            RAISE supError;
        END IF;
        IF (vPop <= 0) THEN 
            RAISE popError;
        END IF;
        SELECT COUNT(*) INTO vTestP FROM Pays WHERE nom = vNom;
        SELECT COUNT(*) INTO vTestI3 FROM Pays WHERE iso3 = vIs3;
        SELECT COUNT(*) INTO vTestI2 FROM Pays WHERE iso2 = vIs2;
        SELECT COUNT(*) INTO vTestC FROM Pays WHERE nomc = vCon;
        IF vTestP >= 1 THEN
            RAISE nomPError;
        END IF;
        IF vTestI3 >= 1 THEN
            RAISE iso3Error;
        END IF;
        IF vTestI2 >= 1 THEN
        RAISE iso2Error;
        END IF;
        IF vTestC < 1 THEN
        RAISE contError;
        END IF;
        --Insertion du nouveau Pays
        INSERT INTO Pays (nom, capitale, superficie, population, iso3, iso2, nomc)
        VALUES (vNom, vCap, vSup, vPop, vIs3, vIs2, vCon);
        --Affichage d’un message
        DBMS_OUTPUT.PUT_LINE('Pays '||vNom||' ajouté.');
        --Validation
        COMMIT;
    EXCEPTION
        WHEN supError THEN
            ROLLBACK;
            DBMS_OUTPUT.PUT_LINE('Superficie invalide !');
        WHEN popError THEN
            ROLLBACK;
            DBMS_OUTPUT.PUT_LINE('Population invalide !');
        WHEN nomPError THEN
            ROLLBACK;
            DBMS_OUTPUT.PUT_LINE('Pays existant !');
        WHEN iso3Error THEN
            ROLLBACK;
            DBMS_OUTPUT.PUT_LINE('Code iso3 invalide !');
        WHEN iso2Error THEN
            ROLLBACK;
            DBMS_OUTPUT.PUT_LINE('Code iso2 invalide !');
        WHEN contError THEN
            ROLLBACK;
            DBMS_OUTPUT.PUT_LINE('Continent inexistant !');
        WHEN OTHERS THEN
            ROLLBACK;
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
            RAISE_APPLICATION_ERROR(-20000, 'ERREUR IMPREVUE !');
    END ajouterPays;

    PROCEDURE AjouterMontagne(vNom Montagne.Nom%TYPE,
                              vAlt Montagne.Altitude%TYPE,
                              vCha Montagne.Chaine%TYPE) IS
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
    END AjouterMontagne;

    PROCEDURE ajouterMontagnePays(vNomM Montagne.nom%TYPE, vAlt Montagne.altitude%TYPE, vChaine Montagne.chaine%TYPE, vNomP Pays.nom%TYPE) IS
	vTestM NUMBER;
	vTestP NUMBER;
	altError EXCEPTION;
	nomMError EXCEPTION;
	nomPError EXCEPTION;
	
    BEGIN
        --Vérification de l'altitude
        IF vAlt < 0 THEN
            RAISE altError;
        END IF;
        SELECT COUNT(*) INTO vTestM FROM Montagne WHERE nom = vNomM;
        SELECT COUNT(*) INTO vTestP FROM Pays WHERE nom = vNomP;
        --Vérification de l'existance de la montagne
        IF vTestM >= 1 THEN
            RAISE nomMError;
        END IF;
        --Verification de l'existance du pays
        IF vTestP < 1 THEN
            RAISE nomPError;
        END IF;
        --Ajoute de la montagne 
        INSERT INTO Montagne(nm, nom, altitude, chaine) 
        VALUES(seq_montagne.NEXTVAL, vNomM, vAlt, vChaine);
        DBMS_OUTPUT.PUT_LINE('Montagne'||vNomM||' ajoutée.');
        --Ajout de la montagne dans le pays
        INSERT INTO Localiser(nm, nomp)
        VALUES (seq_montagne.CURRVAL, vNomP);
        DBMS_OUTPUT.PUT_LINE('Montagne'||vNomM||' ajoutée dans'||vNomP||'.');
        --Validation
        COMMIT;
    EXCEPTION
        WHEN altError THEN
            ROLLBACK;
            DBMS_OUTPUT.PUT_LINE('Altitude invalide !');
        WHEN nomMError THEN
            ROLLBACK;
            DBMS_OUTPUT.PUT_LINE('Montagne existante !');
        WHEN nomPError THEN
            ROLLBACK;
            DBMS_OUTPUT.PUT_LINE('Pays inexistant !');
        WHEN OTHERS THEN
            ROLLBACK;
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
            RAISE_APPLICATION_ERROR(-20000, 'ERREUR IMPREVUE !');
    END;

    PROCEDURE supprimerPays(vNom Pays.nom%TYPE) IS
	vTestP NUMBER;
	nomPError EXCEPTION;

    BEGIN
        --Verification de l'existence du pays
        SELECT COUNT(*) INTO vTestP FROM Pays WHERE nom = vNom;
        IF (vTestP < 1) THEN
            RAISE nomPError;
        END IF;
        --Suppression du pays
        DELETE FROM Localiser WHERE nomp = vNom;
        DELETE FROM Traverser WHERE nomp = vNom;
        DELETE FROM Frontiere WHERE nomf = vNom OR nomp = vNom;
        DELETE FROM Pays WHERE nom = vNom;
        --VALIDATIONCOMMIT;
    EXCEPTION
        WHEN nomPError THEN
            ROLLBACK;
            DBMS_OUTPUT.PUT_LINE('Pyas inexistant !');
        WHEN OTHERS THEN
            ROLLBACK;
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
            RAISE_APPLICATION_ERROR(-20000, 'ERREUR IMPREVUE !');
    END supprimerPays;

    PROCEDURE AjouterFrontiere(vNomP Frontiere.nomp%TYPE, vNomF Frontiere.nomf%TYPE, vLong Frontiere.longueur%TYPE) IS
	n NUMBER;
	nomPError EXCEPTION;
	nomFError EXCEPTION;
	frontError EXCEPTION;
	longError EXCEPTION;

    BEGIN
        IF (vLong <= 0) THEN
            RAISE longError;
        END IF;
        SELECT COUNT(*) INTO n FROM Pays WHERE nom = vNomP;
        IF (n < 1) THEN
            RAISE nomPError;
        END IF;
        SELECT COUNT(*) INTO n FROM Pays WHERE nom = vNomF;
        IF (n < 1) THEN
            RAISE nomFError;
        END IF;
        SELECT COUNT(*) INTO n FROM Frontiere WHERE nomp = vNomP AND nomf = vNomF;
        IF (n > 0) THEN
            RAISE frontError;
        END IF;
        INSERT INTO Frontiere(nomp, nomf, longueur)
        VALUES (vNomP, vNomF, vLong);
        INSERT INTO Frontiere(nomp, nomf, longueur)
        VALUES (vNomF, vNomP, vLong);
        DBMS_OUTPUT.PUT_LINE('Frontiere ajoutée');
        COMMIT;
    EXCEPTION
        WHEN nomPError THEN
            ROLLBACK;
            DBMS_OUTPUT.PUT_LINE('Pays Inexistant');
        WHEN nomFError THEN
            ROLLBACK;
            DBMS_OUTPUT.PUT_LINE('Frontiere inexistente');
        WHEN frontError THEN
            ROLLBACK;
            DBMS_OUTPUT.PUT_LINE('Frontiere existante');
        WHEN longError THEN
            ROLLBACK;
            DBMS_OUTPUT.PUT_LINE('Longueur invalide');
        WHEN OTHERS THEN
            ROLLBACK;
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
            RAISE_APPLICATION_ERROR(-20000, 'ERREUR IMPREVUE !');
    END AjouterFrontiere;

    PROCEDURE AfficherFrontires(vNomP Pays.nom%TYPE) IS
    n NUMBER;
    nomError EXCEPTION;
    CURSOR c1 IS SELECT f.nomf FROM Frontiere f, Pays p WHERE f.nomp = p.nom AND p.nom = vNomP ORDER BY p.superficie;

    BEGIN
        --Vérification de l'existence du pays
        SELECT COUNT(nom) INTO n FROM Pays WHERE nom = vNomP;
        IF (n <= 0) THEN
            RAISE nomError;
        END IF;
    FOR li IN c1 LOOP
        DBMS_OUTPUT.PUT_LINE(li.nomf);
    END LOOP;
    EXCEPTION
        WHEN nomError THEN
            ROLLBACK;
            DBMS_OUTPUT.PUT_LINE('Pays Inexistant');
        WHEN OTHERS THEN
            ROLLBACK;
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
            RAISE_APPLICATION_ERROR(-20000, 'ERREUR IMPREVUE !');
    END AfficherFrontires;
END gestion_geo;
/

SET SERVEROUTPUT ON;
EXEC gestion_geo.AfficherFrontires('France');