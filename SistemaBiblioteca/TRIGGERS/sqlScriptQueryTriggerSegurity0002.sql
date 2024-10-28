CREATE OR ALTER TRIGGER SeguityArquiteturaArquitetura

ON Arquitetura.Arquitetura

INSTEAD OF UPDATE, DELETE, INSERT

AS

BEGIN

DECLARE 

@operacao VARCHAR(30),

@usuario VARCHAR(30),

@usuarioIP NVARCHAR(40),

@dataOperacao DATE;


SET @dataOperacao = GETDATE();

SET @usuario = SYSTEM_USER;


SELECT @usuarioIP = client_net_address

FROM sys.dm_exec_connections

WHERE session_id = @@SPID;


IF EXISTS (SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
    BEGIN

    SET @operacao = 'UPDATE';

    END

ELSE IF EXISTS (SELECT * FROM inserted)
    BEGIN 

    SET @operacao = 'INSERT';

    END 

ELSE IF EXISTS (SELECT * FROM deleted)
    BEGIN

       SET @operacao = 'DELETED';
    END
ELSE 
    BEGIN

        SET @operacao = 'NAO RECONHECIDA';
    END

INSERT INTO Seguranca.Auditoria (Operacao, Usuario, Tabela, Esquema, UsuarioIP, operacaoDATA)

VALUES (@operacao, @usuario, 'Arquitetura', 'Arquitetura', @usuarioIP, @dataOperacao);

END;