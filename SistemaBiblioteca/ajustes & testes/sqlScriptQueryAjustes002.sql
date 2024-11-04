use SistemaBiblioteca;


EXEC  Person.InserirPagamento 'mai', 1400.00;

SELECT  * from Seguranca.Auditoria;

ALTER TABLE Seguranca.Auditoria 

ALTER COLUMN AuditoriaPerPersonID int;

DROP TABLE Seguranca.Auditoria

GO

CREATE TABLE Seguranca.Auditoria(

	idAuditoria int identity(1,1) NOT NULL PRIMARY KEY,
	
	Operacao varchar(40) NOT NULL,
	
	Usuario varchar(50) NOT NULL,
	
	Tabela  varchar(50) NOT NULL,
	
	Esquema varchar(50) NOT NULL,
	
	UsuarioIP nvarchar(50) NOT NULL,
	
	operacaoDATA date NOT null
	

);



ALTER TABLE [Person].[Usuario] DROP CONSTRAINT [FK__Usuario__idPesso__3D5E1FD2]
GO


ALTER TABLE Person.Usuario 

DROP COLUMN idPessoa;

