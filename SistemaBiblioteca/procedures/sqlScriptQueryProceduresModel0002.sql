use SistemaBiblioteca;


CREATE OR ALTER PROCEDURE Person.DescontoMulta (

    @descontoMulta BIT, @valorDesconto money, @cpf CHAR(11)
)

AS

BEGIN

    DECLARE

    @resultadoCalculo money,

    @valorAtual money,

    @idUser INT,

    @valorEspera INT,

    @idMulta INT;



    SELECT @idUser = idPessoa FROM Person.Person

    WHERE cpf = @cpf;


    SELECT @idMulta = idMulta FROM Person.Usuario

    WHERE idUsuario = @idUser;


    SELECT @valorAtual = valorTotalMulta  FROM Person.multa
    
    WHERE idMulta = @idMulta;


    SET @valorEspera = @valorAtual;


    SET @resultadoCalculo = @valorEspera - 10 * (@valorAtual / 100);


    UPDATE Person.multa

    SET descontoMulta = @descontoMulta,
    
    valorDesconto = @valorDesconto,

    ativa = 0,

    valorTotalMulta = @resultadoCalculo

    WHERE idMulta = @idMulta;


END;


ALTER TABLE Person.PagamentoMensal

ALTER COLUMN dataHoraPagamento DATE NOT NULL

GO

ALTER TABLE Person.PagamentoMensal

ADD valorTotalPagamento money NOT NULL;

/*Hoje não tive muito tempo para 'codar' o projeto'