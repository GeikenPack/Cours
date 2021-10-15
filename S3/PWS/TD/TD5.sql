SELECT M.codeM, M.nom
FROM Medecin M, Travailler T
WHERE T.DtT = 11/11/2014 AND T.nbHt > 10 AND M;codeM = T.codeM;

SELECT M.codeM, M.nom
FROM Medecin M, Service S
WHERE M.codeM = S.codeM
AND S.nomS = "Urgence" OR D.nomS = "Chirurgie";

