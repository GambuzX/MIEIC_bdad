.mode	columns
.headers	on

CREATE TRIGGER UpdateBug
AFTER INSERT ON Bug
FOR EACH ROW
WHEN New.vulnerabilidade='sim'
BEGIN

	UPDATE Servidor
	SET vulneravel='sim'
	WHERE idServidor in (SELECT S.idServidor
							FROM Bug B JOIN AplicacaoServidor A jOIN Servidor S
							WHERE B.idAplicacao=New.idAplicacao
							AND B.idAplicacao=A.idAplicacao
							AND A.idServidor=S.idServidor);	

	UPDATE Bug
	Set prioridade=1
	WHERE Bug.idBug=New.idBug;

END;