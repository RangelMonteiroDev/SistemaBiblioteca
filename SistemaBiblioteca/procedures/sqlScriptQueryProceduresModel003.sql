use SistemaBiblioteca;


GO

CREATE OR ALTER PROCEDURE Person.InserirPagamento(

    @mesPagamento CHAR(3), @valor money
)

AS

BEGIN

    DECLARE

    @dataPagamento DATE;

    SET @dataPagamento = GETDATE();

    INSERT INTO Person.PagamentoMensal
    (mesPagamento, dataHoraPagamento, aumento, desconto, valorTotalPagamento)

    VALUES (

        @mesPagamento, @dataPagamento, 0, 0, @valor
    );


END;

GO


GO

CREATE OR ALTER PROCEDURE Person.AumentarValorPagamento 
(@cpf CHAR(11), @valorAumento money)

AS 

BEGIN

DECLARE @idMembro INT,

@idPagamento INT,

@valorEspera money,

@resultadoCalculo money;


SELECT @idMembro = idPessoa FROM Person.Person

WHERE cpf = @cpf;


SELECT @idPagamento = idPagamento FROM Person.Membros

WHERE idMembro = @idMembro


SELECT @valorEspera = valorTotalPagamento FROM Person.PagamentoMensal

WHERE idPagamento = @idPagamento;


SET @resultadoCalculo = @valorEspera + @valorAumento;



UPDATE Person.PagamentoMensal

SET aumento = 1,

valorAumento = @valorAumento,

valorTotalPagamento = @resultadoCalculo

WHERE idPagamento = @idPagamento;


END

GO



GO

CREATE OR ALTER PROCEDURE Person.DescontoPagamento 
(@cpf CHAR(11), @porcenagemDesconto INT)

AS

BEGIN 

DECLARE 

@idMembro INT,

@idPagamento INT,

@valorEspera money,

@resuladoOperacaoSubtracao money,

@resultadoCalculo money;


SELECT @idMembro = idPessoa FROM Person.Person

WHERE cpf = @cpf;


SELECT @idPagamento = idPagamento FROM Person.Membros

WHERE idMembro = @idMembro;


SELECT @valorEspera = valorTotalPagamento FROM Person.PagamentoMensal

WHERE idPagamento = @idPagamento;


SET @resultadoCalculo = @porcenagemDesconto * (@valorEspera / 100); 

SET @resuladoOperacaoSubtracao = @valorEspera - @resultadoCalculo;


UPDATE Person.PagamentoMensal

SET desconto = 1,

valorAumento = @resultadoCalculo,

valorDesconto = @resultadoCalculo,

valorTotalPagamento = @resuladoOperacaoSubtracao

WHERE idPagamento = @idPagamento;

END


GO


