       IDENTIFICATION DIVISION.
       program-id. TP4.
       Author. Jonathan Morgado-Samagaio.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT FETUD ASSIGN TO "fetud.dat.dat" ORGANIZATION IS 
           INDEXED
           ACCESS MODE IS DYNAMIC
           RECORD KEY IS INE-ETU
           ALTERNATE RECORD IS MOYS4-ETU DUPLICATES
           ALTERNATE RECORD IS UA-ETU DUPLICATES.

           SELECT FETUDOK ASSIGN TO "fetudok.dat" ORGANIZATION IS 
           INDEXED
           ACCESS MODE IS DYNAMIC
           RECORD KEY IS INE-ETUOK.

       DATA DIVISION.
       FILE SECTION.
       FD FETUD.
       01 E-ETU.
           02 INE-ETU PIC 9(4).
           02 NOM-ETU PIC X(10).
           02 MOYS4-ETU PIC 99V99.
           02 MOYS3-ETU PIC 99V99.
           02 COMP-ETU PIC 9.
           02 UA-ETU PIC 99.

       FD FETUDOK.
       01 E-ETUOK.
           02 INE-ETUOK PIC 9(4).
           02 NOM-ETUOK PIC X(10).
           02 MOYS4-ETUOK PIC 99V99.

       WORKING-STORAGE SECTION.
       77 EOF_FETUD PIC 9 VALUE 0.
       77 EOF_FETUDOK PIC 9 VALUE 0.
       77 MOYS4-MIN PIC 99V99.
       77 NUMBER-STUD-REG PIC 99.
       77 INE_INPUT PIC 9(4).
       77 NB-ETU-S4-V PIC 99.

       PROCEDURE DIVISION.
       PROGRAMME-PRINCIPAL.
           DISPLAY "Début du programme".
           DISPLAY "--------Création-------"
           PERFORM CREATION.
           DISPLAY "--------Display par UA-------"
           PERFORM DISPLAY-ETU-UA.
           DISPLAY "--------Display si validé-------"
           PERFORM DISPLAY-ETU-S4.
           STOP RUN.

       CREATION.
           OPEN INPUT FETUD.
           OPEN OUTPUT FETUDOK.
           COMPUTE MOYS4-ETU = 10.
           COMPUTE EOF_FETUD = 0.
           START FETUD key is >= MOYS4-ETU
               INVALID KEY DISPLAY "Aucun élève as plus de 10 de moy"
               NOT INVALID KEY
                   READ FETUD NEXT RECORD AT END MOVE 1 TO EOF_FETUD
                   END-READ
                   PERFORM UNTIL EOF_FETUD = 1 OR MOYS4-ETU >= MOYS4-MIN
                       COMPUTE INE-ETUOK = INE-ETU
                       MOVE NOM-ETU TO NOM-ETUOK
                       COMPUTE MOYS4-ETUOK = MOYS4-ETU
                       WRITE E-ETUOK END-WRITE
                       COMPUTE NUMBER-STUD-REG = NUMBER-STUD-REG + 1
                       READ FETUD NEXT RECORD AT END MOVE 1 TO EOF_FETUD
                       END-READ
                    END-PERFORM
           END-START.
           DISPLAY "Number of student registered" NUMBER-STUD-REG.
           CLOSE FETUD.
           CLOSE FETUDOK.

       DISPLAY-ETU-UA.
           DISPLAY "Saisissez l'INE".
           ACCEPT INE_INPUT.
           OPEN I-O FETUDOK.
           OPEN INPUT FETUD.
           COMPUTE EOF_FETUDOK = 0.
           COMPUTE INE-ETUOK = INE_INPUT
           START FETUDOK KEY IS = INE-ETUOK
               INVALID KEY DISPLAY "Aucun étudiant à cet INE"
               NOT INVALID KEY
                   READ FETUDOK NEXT RECORD AT END MOVE 1 TO EOF_FETUDOK
                   COMPUTE INE-ETU = INE-ETUOK
                   START FETUD KEY IS = INE-ETU
                       READ FETUD NEXT RECORD AT END MOVE 1 TO EOF_FETUD
                       DISPLAY "Ine : " INE-ETU
                       DISPLAY "Nom : " NOM-ETU
                       DISPLAY "Moyenne S4 : " MOYS4-ETU
                       DISPLAY "Moyenne S3 : " MOYS3-ETU
                       DISPLAY "Comp ? " COMP-ETU
                       DISPLAY "Nb UA :" UA-ETU
                       IF UA-ETU >= 25 THEN
                           DELETE FETUDOK RECORD
                               INVALID KEY DISPLAY "Suppr impossible"
                               NOT INVALID KEY
                                 DISPLAY "Etudiant supprimé, UA >= 25"
                           END-DELETE
                       END-IF
                   END-READ
           END-START.
           CLOSE FETUD.
           CLOSE FETUDOK.
       
       DISPLAY-ETU-S4.
           OPEN INPUT FETUD.
           COMPUTE EOF_FETUD = 0.
           COMPUTE UA-ETU = 0.
           START FETUD KEY IS = UA-ETU
               INVALID KEY DISPLAY "Aucun étudiant a 0 UA"
               NOT INVALID KEY
                   READ FETUD NEXT RECORD AT END MOVE 1 TO EOF_FETUD
                   PERFORM UNTIL EOF_FETUD = 1 OR UA-ETU = 0
                       DISPLAY "Ine : " INE-ETU
                       DISPLAY "Nom : " NOM-ETU
                       DISPLAY "Moyenne S4 : " MOYS4-ETU
                       DISPLAY "Moyenne S3 : " MOYS3-ETU
                       DISPLAY "Nomp ? " COMP-ETU
                       DISPLAY "Nb UA :" UA-ETU
                       IF MOYS4-ETU >= 10 THEN
                           COMPUTE NB-ETU-S4-V = NB-ETU-S4-V + 1
                       END-IF
                       READ FETUD NEXT RECORD AT END MOVE 1 TO EOF_FETUD
                   END-PERFORM
           END-START.
           DISPLAY NB-ETU-S4-V " élèves ont eu le s4 automatiquement.".
           CLOSE FETUD.
           CLOSE FETUDOK.
