.mode columns
.headers on

SELECT E.nome
FROM Estudante E
WHERE EXISTS (SELECT *
				FROM Amizade A join Estudante E1 JOIN Estudante E2
				WHERE A.ID1=E1.ID AND A.ID2=E2.ID
				AND E1.ID=E.ID
				AND E2.nome LIKE 'Gabriel%');

SELECT E1.nome
FROM Estudante E1 JOIN Amizade A JOIN Estudante E2
WHERE E1.ID=A.ID1 AND A.ID2=E2.ID
AND E2.nome LIKE 'Gabriel%';