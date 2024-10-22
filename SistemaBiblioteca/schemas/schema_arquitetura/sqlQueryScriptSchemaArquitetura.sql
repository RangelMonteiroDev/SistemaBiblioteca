use SistemaBiblioteca;


CREATE SCHEMA Arquitetura;


CREATE TABLE Arquitetura.Arquitetura (

    idArquitetura INT NOT NULL IDENTITY(1,1) PRIMARY KEY,

    idAndar INT NOT NULL,

    idSala INT NOT NULL,

    quantidadeAndares INT NOT NULL,

    quantidadeSalas INT NOT NULL,

    ultimaAtualizacao DATE


);


CREATE TABLE Arquitetura.Andares (

idAndar INT IDENTITY(1,1) PRIMARY KEY,

idSala INT NOT NULL,

quantiSalas INT NOT NULL

);


CREATE TABLE Arquitetura.Sala (

    idSala INT NOT NULL IDENTITY(1,1) PRIMARY KEY,

    idPrateleira INT NOT NULL,

    quantidadePrayeleira INT NOT NULL,

    ativa BIT NOT NULL,

    ocupada BIT NOT NULL,

    reservada BIT NOT NULL


);



CREATE TABLE Arquitetura.Prateleiras (


    idPrateleira INT NOT NULL IDENTITY(1,1) PRIMARY KEY,

    idLivro INT NOT NULL,

    FOREIGN KEY (idLivro)

    REFERENCES Livros.Livros(idLivro)


);


ALTER TABLE Arquitetura.Andares

ADD CONSTRAINT FkIDSala

FOREIGN KEY (idSala)

REFERENCES Arquitetura.Sala;


ALTER TABLE Arquitetura.Sala

ADD CONSTRAINT FkIdPrateleira

FOREIGN KEY(idPrateleira)

REFERENCES Arquitetura.Prateleiras(idPrateleira);


