SELECT SUM(M.codeM, nomM, nbHT)
FROM Medecin M, Travailler T, Service S
WHERE (D.nomS = 'Urgence' OR TO_CHAR(T.dtt, 'DAY') = 'DIMANCHE') AND M.nomM = 'Foldingue'
AND T.codeS = S.codeS AND M.codeM = T.codeM

SELECT COUNT(codeM, TO_CHAR(T.dtt,'DAY'))
FROM Service S, Travailler T
WHERE S;codeS = T.codeS
AND(T.dtt,'DAY') = 'DIMANCHE'
AND S.nomS = 'Urgence'
GROUP BY TO_CHAR(T.dtt,'DAY')