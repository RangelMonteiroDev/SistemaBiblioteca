
CREATE OR ALTER TRIGGER GatilhoDataBaseSistemaBiblioteca

ON Person.PagamentoMensal 

AFTER INSERT, UPDATE, DELETE

AS 

BEGIN

    DECLARE

    @UserSystem VARCHAR(40),

    @operacao VARCHAR(40),

    @dataOperacao DATE,

    @userIP NVARCHAR(50);


    SELECT @userIP = client_net_address FROM sys.dm_exec_connections

    WHERE session_id = @@SPID;


    SET @dataOperacao = GETDATE();

    SET @UserSystem = SYSTEM_USER;


    IF EXISTS (SELECT * FROM inserted) AND EXISTS (SELECT * from deleted)
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

            SET @operacao = 'NAO RECONHECIDA';

        END    

    INSERT INTO Seguranca.Auditoria (
        
        Operacao, Usuario, Tabela, Esquema, UsuarioIP,

        operacaoDATA
    
    )

    VALUES (@operacao, @UserSystem, 'PagamentoMensal', 'Person', @userIP, @dataOperacao)    

END;