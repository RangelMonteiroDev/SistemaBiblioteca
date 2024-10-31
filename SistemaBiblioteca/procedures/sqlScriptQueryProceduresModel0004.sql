use SistemaBiblioteca;

GO

CREATE OR ALTER PROCEDURE Livros.InsertInLivros (

    @cpfUser CHAR(11), @cpfAutor CHAR(11),  @nome VARCHAR(40), @genero VARCHAR(40),

    @dataLancamento DATE, @dataCadastramento DATE, @quantidade INT,

    @disponivel BIT, @idioma VARCHAR(4) 

)

AS

BEGIN

DECLARE 

@idUser INT,

@idAutor INT;


SELECT @idUser = idPessoa FROM Person.Person

WHERE cpf = @cpfUser;


SELECT @idAutor = idPessoa FROM Person.Person

WHERE cpf = @cpfAutor;


INSERT INTO Livros.Livros (
    idAutor, idUsuario, nome, genero, dataLancamento, dataCadastramento, quantidade,
    disponivel, idioma
    )
VALUES (
    @idAutor, @idUser, @nome, @genero, @dataLancamento, @dataCadastramento, @quantidade,
    @disponivel, @idioma

);    


END

GO


GO

CREATE OR ALTER PROCEDURE Livros.InsertInEmprestimo (

 @cpf CHAR(11),@dataEmprestimo DATE,

 @dataPrazo DATE, @renovacao BIT, @devolvido BIT, 

 @dataPrevistaEntrega DATE,

 @dateRenovacao DATE

)

AS

BEGIN

DECLARE

@idUser INT;


SELECT @idUser = idPessoa FROM Person.Person

WHERE cpf = @cpf;


INSERT INTO Livros.Emprestimo (

idUsuario, 

dataEmprestimo, dataPrazo, renovacao,

devolvido, dataPrevistaEntrega, dataRenovacao)

VALUES (@idUser, 

@dataEmprestimo, @dataPrazo, 

@renovacao, @devolvido, 

@dataPrevistaEntrega, @dateRenovacao);


END

GO