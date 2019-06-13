.mode	columns
.headers	on

SELECT S.hostname, B.descricao, P.nome
FROM Bug B JOIN AplicacaoServidor A JOIN Servidor S JOIN Pessoa P
WHERE B.idAplicacao=A.idAplicacao AND A.idServidor=S.idServidor AND S.idResponsavel=P.idPessoa AND B.vulnerabilidade='sim'
ORDER BY S.hostname;