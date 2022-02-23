       IDENTIFICATION DIVISION.
       program-id. TP3.
       Author. Jonathan Morgado-Samagaio.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT FIC-STA ASSIGN TO "fstages.dat" ORGANIZATION IS RECORD
           SEQUENTIAL.
           SELECT FIC-ETU ASSIGN TO "FETU.dat" ORGANIZATION IS LINE
           SEQUENTIAL.

           SELECT FIC-ENT ASSIGN TO "FENT.dat" ORGANIZATION IS RECORD
           SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
      *----- Enregistrement des stages
       FD FIC-STA.
       01 ENR-STA.
           02 SIRET PIC 9(4).
           02 ENT PIC X(10).
           02 ADR.
               03 CP.
                   04 DPT PIC 99.
                   04 COM PIC 999.
                03 VILLE PIC X(15).
           02 ETU PIC X(10).

      *----- Enregistrement des Etudiants
       FD FIC-ETU.
       01 ENR-ETU.
           02 NOM PIC X(10).
           02 NOTE-STAGE PIC 99V99.

      *----- Enregistrement des Entreprises
       FD FIC-ENT.
       01 ENR-ENT.
           02 SIR PIC 9(4).
           02 ENTREP PIC X(10).
           02 NB-STA PIC 99.
           02 MOY-STA PIC 999V99.

       WORKING-STORAGE SECTION.
       77 EOF PIC 9 VALUE 0.
       77 EOF-ETU PIC 9 VALUE 0.
       77 NB-STAGE PIC 99 VALUE 0.
       77 NB-ENT PIC 99 VALUE 0.
       77 NB-STAGIAIRE PIC 99 VALUE 0.
       77 SIRETT PIC 9(4).
       77 MOY PIC 9999V99.

       PROCEDURE DIVISION.
       PROGRAMME-PRINCIPAL.
           DISPLAY "--------Stages-------"
           PERFORM DISPLAY-STA.
           DISPLAY "--------Entreprise-------".
           PERFORM DISPLAY-ENT.
           DISPLAY "--------Fin-------"
           STOP RUN.

       DISPLAY-STA.
      *----- Afficher les entreprises et les stagiaires
           OPEN OUTPUT FIC-ENT.
           OPEN INPUT FIC-STA.
           READ FIC-STA AT END MOVE 1 TO EOF END-READ.
           PERFORM UNTIL EOF = 1
               DISPLAY "---------------"
               DISPLAY "Entreprise : " ENT
      *----- Sauvegarde du Siret pour vérifier qu'il y a plusieurs étudiants par
      *      entreprises
               COMPUTE SIRETT = SIRET
               PERFORM UNTIL SIRET NOT = SIRETT OR EOF = 1
                   DISPLAY "Nom etu : " ETU
                   "Lieu : " CP "-" VILLE
                   COMPUTE NB-STAGE = NB-STAGE + 1
      *----- On parcours touts les étudiants pour chaque entreprises pour 
      *      récupérer leur moyenne
                   OPEN INPUT FIC-ETU
                   READ FIC-ETU AT END MOVE 1 TO EOF-ETU END-READ
                   PERFORM UNTIL EOF-ETU = 1
                       IF NOM = ETU THEN
                           COMPUTE NB-STAGIAIRE = NB-STAGIAIRE + 1
                           COMPUTE MOY = MOY + NOTE-STAGE
                       END-IF
                       READ FIC-ETU AT END MOVE 1 TO EOF-ETU
                       END-READ
                   END-PERFORM
                   CLOSE FIC-ETU
                   COMPUTE EOF-ETU = 0
                   READ FIC-STA AT END MOVE 1 TO EOF END-READ
               END-PERFORM
      *----- On calcul la moyenne et on écrit dans notre enregistrement des 
      *      entreprises
               COMPUTE MOY = MOY / NB-STAGIAIRE
               COMPUTE SIR = SIRET
               MOVE ENT TO ENTREP
               COMPUTE NB-STA = NB-STAGIAIRE
               COMPUTE MOY-STA = MOY
               DISPLAY "Nombre stagiaires : " NB-STAGIAIRE
               DISPLAY "Moyenne : " MOY
               COMPUTE NB-ENT = NB-ENT + 1
      *----- Réinitialisation des variables pour les stagiaires
               COMPUTE NB-STAGIAIRE = 0
               COMPUTE MOY = 0

               WRITE ENR-ENT END-WRITE
           END-PERFORM.
           DISPLAY "---------------".
           DISPLAY "Nombre d'etidiants places en stage : " NB-STAGE.
           DISPLAY "Nombre d'entreprise prenant des stagiaires : "
           NB-ENT.
           DISPLAY "---------------".
           CLOSE FIC-STA.
           CLOSE FIC-ENT.

       DISPLAY-ENT.
           OPEN INPUT FIC-ENT.
           COMPUTE EOF = 0.
           READ FIC-ENT AT END MOVE 1 TO EOF END-READ.
           PERFORM UNTIL EOF = 1
               DISPLAY "----------"
               DISPLAY "SIRET : " SIR
               DISPLAY "Nom entreprise : " ENTREP
               DISPLAY "Nombre stagiaires : " NB-STA
               DISPLAY "Moyenne des stagiaires : " MOY-STA
               READ FIC-ENT AT END MOVE 1 TO EOF END-READ
           END-PERFORM.
           CLOSE FIC-ENT.