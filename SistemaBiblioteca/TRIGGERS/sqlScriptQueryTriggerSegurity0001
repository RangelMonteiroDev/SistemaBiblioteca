
GO

CREATE OR ALTER TRIGGER AuditoriaPersonPersonTrigger

ON Person.Person

INSTEAD OF UPDATE, INSERT, DELETE

AS

BEGIN

DECLARE 

@operacao VARCHAR(40),

@usuario VARCHAR(40),

@IPuser NVARCHAR(40),

@dataOperacao DATE;


SET @usuario = SYSTEM_USER;

SET @dataOperacao = GETDATE();


SELECT @IPuser = client_net_address FROM sys.dm_exec_connections

WHERE session_id = @@SPID;


IF EXISTS (SELECT * FROM inserted ) AND EXISTS (SELECT * FROM DELETED)
    BEGIN

        SET @operacao = 'UPDATE';
    END
ELSE IF EXISTS (SELECT * FROM INSERTED)
    BEGIN

        SET @operacao = 'INSERT';
    END
ELSE IF EXISTS (SELECT * FROM DELETED)
    BEGIN

        SET @operacao = 'DELETE';
    END
ELSE 
    BEGIN

        SET @operacao = 'DESCONHECIDA';
    END

INSERT INTO Seguranca.AuditoriaPersonPerson (Operacao, Usuario, Tabela, Esquema, 

UsuarioIP, operacaoDATA)

VALUES (@operacao, @usuario, 'Person', 'Person', @IPuser, @dataOperacao);

END;

GO