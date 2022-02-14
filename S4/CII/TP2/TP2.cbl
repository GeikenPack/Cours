       IDENTIFICATION DIVISION.
       program-id. TP2.
       Author. Jonathan Morgado-Samagaio.

       DATA DIVISION.
       working-storage section.
       01 TABJOURS.
           02 FILLER PIC 9(6) VALUE 312831.
           02 FILLER PIC 9(6) VALUE 303130.
           02 FILLER PIC 9(6) VALUE 313130.
           02 FILLER PIC 9(6) VALUE 313031.
       01 TAB REDEFINES TABJOURS.
           02 NBJ PIC 99 OCCURS 12.
       01 DATESAISIE.
           02 ANNEESAISIE PIC 9999.
           02 MOISSAISIE PIC 99.
           02 JOURSAISIE PIC 99.
       01 SYSDATE.
           02 ANNEESYS PIC 9999.
           02 MOISSYS PIC 99.
           02 JOURSYS PIC 99.
       77 NBJOURS PIC 999999 VALUE 0.
       77 DATEVALIDE PIC 9 VALUE 0.
       77 MOISACTUEL PIC 99.
       77 JOURSTEMP PIC 999999.
       77 AGE PIC 999.

       PROCEDURE DIVISION.
       PROGRAM-PRINCIPAL.
           PERFORM SAISIR-DATE.
           PERFORM DATE-SYSTEM.
           PERFORM VERIF-DATE-VALID.
           PERFORM CALC-JOURS-NAISSANCE.
           PERFORM CALC-AGE.
           PERFORM DISPLAY-MSG-AGE.
           STOP RUN.

       SAISIR-DATE.
           DISPLAY "Saisissez une date de naissance (AAAAMMDD)".
           ACCEPT dateSaisie.
           EXIT.

       DATE-SYSTEM.
           ACCEPT SYSDATE FROM DATE YYYYMMDD.
           EXIT.

       VERIF-DATE-VALID.
           PERFORM UNTIL DATEVALIDE = 1
               IF ANNEESAISIE < 1910 OR ANNEESAISIE > ANNEESYS OR
               (ANNEESAISIE = ANNEESYS AND MOISSAISIE > MOISSYS) OR
               (ANNEESAISIE = ANNEESYS AND MOISSAISIE = MOISSYS
               AND JOURSAISIE > JOURSYS) OR
               JOURSAISIE > NBJ(MOISSAISIE) OR MOISSAISIE > 12 THEN
                   DISPLAY "Date invalide"
                   PERFORM SAISIR-DATE
               ELSE
                   COMPUTE DATEVALIDE = 1
               END-IF
           END-PERFORM.
           EXIT.
       
       CALC-JOURS-NAISSANCE.
           IF ANNEESAISIE <> ANNEESYS THEN
               IF ANNEESAISIE <> ANNEESYS - 1
               AND MOISSAISIE < MOISSYS THEN
                   COMPUTE JOURSTEMP = ( ( ANNEESYS - 1 )
                   - ( ANNEESAISIE + 1))
                   COMPUTE JOURSTEMP = JOURSTEMP * 365
               END-IF
               COMPUTE NBJOURS = NBJOURS +
               (NBJ(MOISSAISIE) - JOURSAISIE)
               COMPUTE MOISACTUEL = MOISSAISIE + 1
               PERFORM UNTIL MOISACTUEL = 13
                   COMPUTE NBJOURS = NBJOURS + NBJ(MOISACTUEL)
                   COMPUTE MOISACTUEL = MOISACTUEL + 1
               END-PERFORM
               COMPUTE MOISACTUEL = 1
               PERFORM UNTIL MOISACTUEL = MOISSYS
                   COMPUTE NBJOURS = NBJOURS + NBJ(MOISACTUEL)
                   COMPUTE MOISACTUEL = MOISACTUEL + 1
               END-PERFORM
               COMPUTE NBJOURS = NBJOURS + JOURSYS
               
               COMPUTE NBJOURS = NBJOURS + JOURSTEMP
           ELSE
              IF MOISSAISIE = MOISSYS THEN
                  COMPUTE NBJOURS = NBJOURS + (JOURSYS - JOURSAISIE)
              ELSE
                  COMPUTE NBJOURS = NBJOURS + JOURSYS
              END-IF
              IF MOISSAISIE <> MOISSYS THEN
                  COMPUTE MOISACTUEL = 1
                   PERFORM UNTIL MOISACTUEL = MOISSYS
                       COMPUTE NBJOURS = NBJOURS + NBJ(MOISACTUEL)
                       COMPUTE MOISACTUEL = MOISACTUEL + 1
                   END-PERFORM
              END-IF
           END-IF.
           
           DISPLAY "Jours depuis naissance : " NBJOURS.
           EXIT.
       
       CALC-AGE.
           COMPUTE AGE = NBJOURS / 365.
           DISPLAY " Age : " AGE.
           EXIT.
        
       DISPLAY-MSG-AGE.
           EVALUATE AGE
               WHEN 0 THRU 1 DISPLAY "Baby"
               WHEN 2 THRU 10 DISPLAY "Gamin"
               WHEN 11 THRU 20 DISPLAY "Jeune"
               WHEN 21 THRU 40 DISPLAY "Fleur de l'âge"
               WHEN 41 THRU 60 DISPLAY "Encore actif"
               WHEN 61 THRU 70 DISPLAY "Jeune retraité"
               WHEN 71 THRU 99 DISPLAY "Vieux retraité"
               WHEN OTHER DISPLAY "Chêne"
           END-EVALUATE.
           EXIT.