use SistemaBiblioteca;


CREATE TABLE Person.multa (

    idMulta INT IDENTITY(1,1) PRIMARY KEY,

    mesMulta  char(3) NOT NULL,

    dataMultaHorario DATETIME  NOT NULL,

    aumentoMulta BIT NOT NULL,

    valorAumento money,

    descontoMulta BIT NOT NULL,

    valorDesconto money,

    ativa BIT NOT NULL



);


ALTER TABLE Person.Usuario

ADD idMulta INT 

GO

ALTER TABLE Person.Usuario

ADD CONSTRAINT fkIdMulta

FOREIGN KEY (idMulta)

REFERENCES Person.multa (idMulta);


ALTER TABLE Person.Person

ADD sexo char(1);



CREATE SCHEMA Livros;


CREATE TABLE Livros.Livros (

    idLivro INT PRIMARY KEY IDENTITY(1,1) NOT NULL,

    idAutor INT NOT NULL,

    idUsuario INT NOT NULL,

    nome VARCHAR(40) NOT NULL,

    genero VARCHAR(40) NOT NULL,

    dataLancamento date NOT NULL,

    dataCadastramento date NOT NULL,

    quantidade INT NOT NULL,

    disponivel BIT NOT NULL,

    idioma varchar(4)


);



CREATE TABLE Livros.Autor (

    idAutor INT NOT NULL PRIMARY KEY,

    quantidadeDeLivros INT,

    FOREIGN KEY (idAutor)

    REFERENCES Person.Person (idPessoa)



);



ALTER TABLE Livros.Livros

ADD CONSTRAINT FkAutorId

FOREIGN KEY (idAutor)

REFERENCES Livros.Autor (idAutor)

GO

ALTER TABLE Livros.Livros

ADD CONSTRAINT FkUserId

FOREIGN KEY (idUsuario)

REFERENCES Person.Usuario (idUsuario);



CREATE TABLE Livros.Emprestimo (


    idEmprestimo INT IDENTITY(1,1) PRIMARY KEY,

    idUsuario INT NOT NULL,

    mesEmprestimo char(3) NOT NULL,

    dataEmprestimo date NOT NULL,

    dataPrazo date NOT NULL,

    renovacao BIT NOT NULL,

    devolvido BIT NOT NULL,


    FOREIGN KEY (idUsuario)

    REFERENCES Person.Usuario (idUsuario)

);


