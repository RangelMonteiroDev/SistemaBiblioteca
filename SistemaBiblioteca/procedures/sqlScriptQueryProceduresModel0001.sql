use SistemaBiblioteca;

ALTER TABLE Arquitetura.Arquitetura 

ADD CONSTRAINT FkIdAndar

FOREIGN KEY (idAndar)

REFERENCES Arquitetura.Andares (idAndar)

GO

ALTER TABLE Arquitetura.Arquitetura 

ADD CONSTRAINT FkIdTbSala

FOREIGN KEY (idSala)

REFERENCES Arquitetura.Sala(idSala)

GO

ALTER TABLE Arquitetura.Arquitetura 

ALTER COLUMN idAndar INT

GO

ALTER TABLE Arquitetura.Arquitetura 

ALTER COLUMN idSala INT;


ALTER TABLE Person.Usuario

DROP COLUMN idPessoa;



CREATE OR ALTER PROCEDURE Person.InsertInTbLocalizacao (

    @cidade VARCHAR(40),

    @estado CHAR(2),

    @cep CHAR(13),

    @nacionalidade CHAR(3)
)

AS

BEGIN

    INSERT INTO Person.Localizacao (cidade, estado, cep, nacionalidade)

    VALUES (@cidade, @estado, @cep, @nacionalidade);

END
;


    CREATE SEQUENCE Person.SeqPerson 

    AS INT

    START WITH 1

    INCREMENT BY 1

    MINVALUE 1

    MAXVALUE 99999999;

  

CREATE OR ALTER PROCEDURE Person.InsertInTbPerson (

    @nome VARCHAR(40), @idade INT, @cpf CHAR(11), @ativo BIT, @sexo CHAR(1) 


)

AS 

BEGIN

DECLARE

@idLocalizacao INT;

SET @idLocalizacao = NEXT VALUE FOR Person.SeqPerson;

INSERT INTO Person.Person (nome, idade, cpf, ativo, idLocalizacao, sexo)

VALUES (@nome, @idade, @cpf, @ativo, @idLocalizacao, @sexo);


END;







CREATE OR ALTER PROCEDURE Person.Usuarios (

    @email VARCHAR(40), @senha VARCHAR(12), @nickname VARCHAR(40), @emprestimoLivro BIT,

    @cpf char(11)

)

AS

BEGIN

    DECLARE @idPessoa INT;

    SELECT @idPessoa = idPessoa FROM Person.Person WHERE cpf = @cpf;


    INSERT INTO Person.Usuario 
    
    (idPessoa, email, senha, nickname, emprestimoLivro, quantidadeEmprestimo )

    VALUES (@idPessoa, @email, @senha, @nickname, @emprestimoLivro, 0);

END;



ALTER TABLE Person.multa 

ALTER COLUMN dataMultaHorario DATE;



ALTER TABLE Person.multa

ADD valorTotalMulta money NOT NULL;


CREATE OR ALTER PROCEDURE Person.multa (
    
    @mesMulta CHAR(3), 
    @aumentoMulta BIT, 
    @valorAumento MONEY, 
    @descontoMulta BIT,
    @valorDesconto MONEY, 
    @ativa BIT,
    @valorTotal MONEY, 
    @cpf CHAR(11),
    @mesEmprestimo CHAR(3),
    @dataEmprestimo DATE,
    @dataPrazo DATE
)
AS
BEGIN
    DECLARE 
        @idMulta INT,
        @dataHoraMarcados DATE,
        @idUser INT;

    -- Get the idUser from Person.Person using cpf
    SELECT @idUser = idPessoa 
    FROM Person.Person 
    WHERE cpf = @cpf;

    -- Set current date to @dataHoraMarcados
    SET @dataHoraMarcados = GETDATE();

    -- Insert into Person.multa table
    INSERT INTO Person.multa (
        mesMulta, dataMultaHorario, aumentoMulta, valorAumento,
        descontoMulta, valorDesconto, ativa, valorTotalMulta
    )
    VALUES (
        @mesMulta, @dataHoraMarcados, @aumentoMulta, @valorAumento, 
        @descontoMulta, @valorDesconto, @ativa, @valorTotal
    );

    -- Retrieve the latest inserted idMulta
    SELECT @idMulta = MAX(idMulta) 
    FROM Person.multa;

    -- Update Person.Usuario with the idMulta
    UPDATE Person.Usuario
    SET idMulta = @idMulta
    WHERE idUsuario = @idUser;


    INSERT INTO Livros.Emprestimo (
        
        idUsuario,
        mesEmprestimo,
        dataEmprestimo,
        dataPrazo,
        renovacao,
        devolvido
        
         )

    VALUES (

        @idUser,
        @mesEmprestimo,
        @dataEmprestimo,
        @dataPrazo,
        0,
        0
    );

END;



CREATE OR ALTER PROCEDURE Person.AlterarValorMulta (

    @valorAumento money,

    @aumentoMulta BIT,

    @cpf CHAR(11)

)

AS

BEGIN

    DECLARE

    @idUser INT,

    @idMulta INT,

    @valorAtual money,

    @Calculo money;


    SELECT @idUser = idPessoa FROM Person.Person

    WHERE cpf = @cpf;

    SELECT @idMulta = idMulta FROM Person.Usuario

    WHERE idUsuario = @idUser;


    SELECT @valorAtual = valorTotalMulta

    FROM Person.multa

    WHERE idMulta = @idMulta;


    SET @Calculo = (@valorAtual + @valorAumento);



    UPDATE Person.multa

    SET aumentoMulta = @aumentoMulta,

        valorAumento = @valorAumento,

        valorTotalMulta = @Calculo

    WHERE idMulta = @idMulta; 


END;


