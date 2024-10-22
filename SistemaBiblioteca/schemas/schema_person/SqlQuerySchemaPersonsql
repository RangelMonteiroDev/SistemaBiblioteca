use SistemaBiblioteca;

CREATE SCHEMA Person;


CREATE TABLE Person.Person (

    idPessoa INT IDENTITY(1,1) PRIMARY KEY,

    nome VARCHAR(40),

    idade TINYINT,

    cpf CHAR(11),

    ativo bit
);




ALTER TABLE Person.Person 

ALTER COLUMN nome VARCHAR(40) NOT NULL

GO

ALTER TABLE Person.Person 

ALTER COLUMN idade TINYINT NOT NULL

GO

ALTER TABLE Person.Person 

ALTER COLUMN cpf char(11) NOT NULL

GO

ALTER TABLE Person.Person 

ALTER COLUMN ativo bit NOT NULL;


ALTER TABLE Person.Person 

ADD CONSTRAINT indexUnique

UNIQUE (cpf);




CREATE TABLE Person.Localizacao (

    idLocalizacao INT IDENTITY(1,1) PRIMARY KEY,

    cidade VARCHAR(40),

    estado CHAR(2),

    cep CHAR(8),

    nacionalidade CHAR(3)

);


ALTER TABLE Person.Localizacao

ALTER COLUMN cidade VARCHAR(20) NOT NULL

GO

ALTER TABLE Person.Localizacao

ALTER COLUMN estado char(2) NOT NULL

GO

ALTER TABLE Person.Localizacao

ALTER COLUMN cep CHAR(8) NOT NULL

GO

ALTER TABLE Person.Localizacao

ALTER COLUMN nacionalidade CHAR(3) NOT NULL;


ALTER TABLE Person.Localizacao

ADD CONSTRAINT indexUniqueCep

UNIQUE(cep);


ALTER TABLE Person.Person 

ADD idLocalizacao INT;



ALTER TABLE Person.Person

ADD CONSTRAINT FkLocalizacao

FOREIGN KEY(idLocalizacao)

REFERENCES Person.Localizacao(idLocalizacao);





CREATE TABLE Person.Usuario (

    idUsuario INT IDENTITY(1,1) PRIMARY KEY,

    idPessoa  INT,

    email VARCHAR(40),

    senha VARCHAR(40),

    nickname VARCHAR(20),

    emprestimoLivro bit,

    quantidadeEmprestimo int,

    FOREIGN KEY (idPessoa)

    REFERENCES Person.Person (idPessoa)
);



ALTER TABLE Person.Usuario 

ALTER COLUMN idUsuario INT NOT NULL

GO

ALTER TABLE Person.Usuario

ADD CONSTRAINT fkIdUsuario

FOREIGN KEY (idUsuario)

REFERENCES Person.Person (idPessoa)

GO

ALTER TABLE Person.Usuario

DROP COLUMN idPessoa;




ALTER TABLE Person.Usuario

ALTER COLUMN email varchar(40) NOT NULL

GO

ALTER TABLE Person.Usuario

ALTER COLUMN senha VARCHAR(12) NOT NULL

GO 

ALTER TABLE Person.Usuario

ALTER COLUMN nickname VARCHAR(40) NOT NULL

GO

ALTER TABLE Person.Usuario

ALTER COLUMN emprestimoLivro bit NOT NULL

GO

ALTER TABLE Person.Usuario

ALTER COLUMN quantidadeEmprestimo INT NOT NULL
;


ALTER TABLE Person.Usuario

ADD CONSTRAINT uniqueIndexUsuario

UNIQUE(email, nickname);



CREATE TABLE Person.Departamento(

    idDepartamento INT IDENTITY(1,1) PRIMARY KEY,

    nome VARCHAR(40) NOT NULL,

    tipo VARCHAR(40) NOT NULL,

    quantidadeFuncionarios INT NOT NULL,

    ativo BIT NOT NULL

);


CREATE TABLE Person.PagamentoMensal(

    idPagamento INT IDENTITY(1,1) PRIMARY KEY,

    mesPagamento CHAR(3) NOT NULL,

    dataHoraPagamento DATETIME NOT NULL,

    aumento bit NOT NULL,

    valorAumento money,

    desconto bit NOT NULL,

    valorDesconto money

);



CREATE TABLE Person.Membros (

    idMembro int PRIMARY KEY,

    idDepartamento int NOT NULL,

    idPagamento int NOT NULL,

    classeMembro VARCHAR(20),

    FOREIGN KEY (idMembro)

    REFERENCES Person.Person(idPessoa),

    FOREIGN KEY (idDepartamento)

    REFERENCES Person.Departamento(idDepartamento),

    FOREIGN KEY (idPagamento)

    REFERENCES Person.PagamentoMensal(idPagamento)

);