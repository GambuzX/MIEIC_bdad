.mode	columns
.headers	on

SELECT hostname
FROM Servidor JOIN Pessoa
ON Servidor.idResponsavel=Pessoa.idPessoa
WHERE hostname LIKE 'alu%' 
AND mail='joao.almeida@cica.pt'
AND EXISTS(SELECT *
			FROM Bug B natural join AplicacaoServidor A natural join Servidor S);