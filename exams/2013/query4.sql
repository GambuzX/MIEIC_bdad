.mode	columns
.headers	on

DROP VIEW if exists bugs_q;

CREATE VIEW bugs_q AS
SELECT Aplicacao.nome, COUNT(*) as amount
FROM Bug join Aplicacao
ON Bug.idAplicacao=Aplicacao.idAplicacao
GROUP BY Aplicacao.nome
ORDER BY amount DESC;

SELECT nome
FROM bugs_q
LIMIT 1;
