.mode	columns
.headers	on

CREATE TRIGGER UpdateBugVuln
AFTER INSERT ON AplicacaoServidor
FOR EACH ROW
WHEN EXISTS(SELECT * FROM Bug WHERE vulnerabilidade='sim' AND Bug.idAplicacao=New.idAplicacao)
BEGIN
	UPDATE Servidor SET vulneravel='sim' WHERE Servidor.idServidor=New.idServidor;
END;