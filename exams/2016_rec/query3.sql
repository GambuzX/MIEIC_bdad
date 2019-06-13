.mode columns
.headers on

DROP VIEW IF EXISTS AnosCurriculares;

CREATE VIEW AnosCurriculares AS
SELECT count(DISTINCT AnoCurricular) as quant
FROM Estudante;

SELECT E1.nome
FROM Estudante E1 join Amizade A join Estudante E2
WHERE E1.ID=A.ID1 AND A.ID2=E2.ID
GROUP BY E1.nome
HAVING Count(DISTINCT E2.anoCurricular)=(SELECT quant FROM AnosCurriculares);