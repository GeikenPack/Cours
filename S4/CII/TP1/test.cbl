       IDENTIFICATION DIVISION.
       program-id. test.
       Author. Jonathan Morgado-Samagaio.

       DATA DIVISION.
       working-storage section.
       77 nbCrenaux PIC 9.
       77 sommeCrenaux PIC 99 VALUE 0.
       77 nbHeures PIC 99V9.
       77 nbHeuresByCrenaux PIC 9V9 VALUE 1.5.
       77 nbPause PIC 9.
       77 heurePause PIC 99V9 VALUE 0.
       77 dureeMasque PIC 9 Value 4.
       77 nbMasques PIC 99.

       PROCEDURE DIVISION.
           DISPLAY "Semaine 1 :".
           PERFORM INPUT-CRENAUX 5 TIMES.
           PERFORM INPUT-PAUSE.
           MOVE nbPause TO heurePause.
           COMPUTE heurePause = heurePause * nbHeuresByCrenaux.

           DISPLAY "Semaine 2 : ".
           PERFORM INPUT-CRENAUX 5 TIMES.
           PERFORM INPUT-PAUSE.
           COMPUTE nbPause = nbPause * nbHeuresByCrenaux.
           COMPUTE heurePause = heurePause + nbPause.

           MOVE sommeCrenaux TO nbHeures.
           COMPUTE nbHeures = nbHeures * nbHeuresByCrenaux.
           DISPLAY "Nombre d'heures : " nbHeures.

           ADD heurePause TO nbHeures.
           DISPLAY "Nombre de pauses : " heurePause.
           MOVE nbHeures TO nbMasques.
           COMPUTE nbMasques ROUNDED = nbMasques / dureeMasque.

           DISPLAY "Nombre masques sans pauses a domicile : " nbMasques.

           DISPLAY "Nombre de pause a la maison sur deux semaines : ".
           ACCEPT nbPause.
           COMPUTE nbHeures = nbHeures - (nbPause * nbHeuresByCrenaux).
           COMPUTE nbMasques ROUNDED = nbHeures / dureeMasque.
           DISPLAY "Nombre masques avec pauses a domicile : " nbMasques.
           STOP RUN.

       INPUT-CRENAUX.
           DISPLAY "Saisissez le nombre de créneaux de cours : ".
           ACCEPT nbCrenaux.
           COMPUTE sommeCrenaux = sommeCrenaux + nbCrenaux.

       INPUT-PAUSE.
           DISPLAY "Saisissez le nombre de pauses dans la semaine : ".
           ACCEPT nbPause.
