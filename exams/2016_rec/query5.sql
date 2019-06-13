.mode columns
.headers on


CREATE TEMP TABLE query5Table(
	nome1 TEXT,
	nome2 TEXT,
	PRIMARY KEY(nome1, nome2),
	CHECK(nome1 != nome2)
);

CREATE TRIGGER trigger1
BEFORE INSERT ON query5Table
FOR EACH ROW
WHEN EXISTS(SELECT * FROM query5Table qt WHERE qt.nome1=New.nome2 AND qt.nome2=New.nome1)
BEGIN
	SELECT raise(ignore); 
END;

INSERT INTO query5Table(nome1, nome2)
SELECT E1.nome, E2.nome
FROM Curso C1 join Estudante E1 join Amizade A join Estudante E2 join Curso C2
WHERE C1.ID=E1.curso AND E1.ID=A.ID1 AND A.ID2=E2.ID AND E2.curso=C2.ID
AND C1.nome != C2.nome
GROUP BY E1.nome, E2.nome;


SELECT * FROM query5Table;


DROP TABLE query5Table;
DROP TRIGGER trigger1;