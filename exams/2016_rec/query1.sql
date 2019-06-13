.mode columns
.headers on

SELECT Estudante.nome
FROM Estudante, Curso
WHERE Estudante.nome LIKE '%a%'
AND Curso.ID=Estudante.curso
AND Curso.nome = 'MIEIC';