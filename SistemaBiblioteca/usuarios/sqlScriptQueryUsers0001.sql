use SistemaBiblioteca;


/*Esse Script contém o código de criação de papéis e usuários do Sistema */

CREATE ROLE profissionalRH

GO

GRANT SELECT ON SCHEMA:: Person TO profissionalRH

GO

GRANT SELECT ON SCHEMA:: Livros TO profissionalRH

GO

GRANT SELECT ON SCHEMA :: Arquitetura TO profissionalRH

GO 

GRANT SELECT ON SCHEMA :: Utilitarios TO profissionalRH;



CREATE LOGIN LoginUserRH001  WITH PASSWORD = '#RH12345'

GO

CREATE USER userRH001 

FOR LOGIN LoginUserRH001

GO

ALTER ROLE profissionalRH ADD MEMBER userRH001;


--Essa função Altera a Senha padrão do usuário

GO

CREATE OR ALTER PROCEDURE AlterarSenhaRhUser001 (@novaSenha CHAR(8) )

AS

BEGIN

    DECLARE 

        @sql VARCHAR(50);

        SET @sql = 'ALTER LOGIN departamentoRH WITH PASSWORD = ' + ' ' + @novaSenha;

        EXEC sp_executesql @sql;

END

GO





CREATE ROLE Balconista

GO

GRANT SELECT, INSERT, UPDATE ON SCHEMA :: Person TO Balconista

GO

GRANT SELECT, INSERT, UPDATE ON SCHEMA :: Livros TO Balconista

GO

GRANT SELECT, INSERT, UPDATE ON SCHEMA :: Utilitarios TO Balconista

GO

GRANT SELECT, INSERT, UPDATE ON SCHEMA :: Arquitetura TO Balconista;


CREATE LOGIN LoginBalconistaUser001 WITH PASSWORD = '#Atendente123'

GO

CREATE USER Atentende0001 FOR LOGIN LoginBalconistaUser001

GO

ALTER ROLE Balconista ADD MEMBER Atentende0001;



--Essa função atualiza a senha padrão

GO

CREATE OR ALTER PROCEDURE AtualizarSenhaBalconista (@novaSenha CHAR(8))

AS

BEGIN

    DECLARE

    @sql VARCHAR (50);
    
    SET @sql = 'ALTER LOGIN LoginBalconistaUser001 WITH PASSWORD = ' + '' + @novaSenha;

    EXEC sp_executesql @sql;

END

GO


CREATE ROLE AnalistaContabil 

GO

GRANT SELECT ON SCHEMA :: Person TO AnalistaContabil;

CREATE LOGIN LoginAnalistaContab001 WITH PASSWORD = '#AnalistContb0001'

GO

CREATE USER AnalistaContab001 FOR LOGIN LoginAnalistaContab001;


ALTER ROLE AnalistaContabil ADD MEMBER AnalistaContab001;


--Função para altearar a Senha
GO

CREATE OR ALTER PROCEDURE AlterarSenhaAnalistaContab001 (@login VARCHAR(20), @novaSenha CHAR(8))

AS

BEGIN

    DECLARE 
    @sql VARCHAR(50);


    SET @sql = 'ALTER LOGIN ' + ' ' + @login + ' ' + 'WITH PASSWORD = ' + ' ' + @novaSenha;

    EXEC sp_executesql @sql;  

END

GO


CREATE ROLE Desenvolvedor

GO

GRANT SELECT, INSERT, UPDATE, DELETE ON SCHEMA :: Person TO Desenvolvedor

GO

GRANT EXECUTE ON Person.AlterarValorMulta

TO Desenvolvedor;
