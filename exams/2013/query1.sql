SELECT hostname, nome
FROM Servidor JOIN Pessoa
ON Servidor.idResponsavel=Pessoa.idPessoa
WHERE vulneravel='sim';