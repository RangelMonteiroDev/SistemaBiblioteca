use SistemaBiblioteca;


GO

CREATE OR ALTER TRIGGER GatilhoInDepartamento

ON Person.Departamento

AFTER INSERT, DELETE, UPDATE

AS

BEGIN

    DECLARE

    @operacao VARCHAR(40),

    @usuario  VARCHAR(40),

    @dataOperacao DATE,

    @enderecoIP NVARCHAR(50);


    SET @usuario = SYSTEM_USER;

    SET @dataOperacao = GETDATE();


    SELECT @enderecoIP = client_net_address FROM sys.dm_exec_connections

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

            SET @operacao = 'DELETE';

        END
    ELSE
        BEGIN

            SET @operacao = 'INVALID'
        END 


    INSERT INTO Seguranca.Auditoria (Operacao, Usuario, Tabela, Esquema, UsuarioIP, operacaoDATA)

    VALUES (@operacao, @usuario, 'Departamento', 'Person', @enderecoIP, @operacao, @dataOperacao);           

END

GO