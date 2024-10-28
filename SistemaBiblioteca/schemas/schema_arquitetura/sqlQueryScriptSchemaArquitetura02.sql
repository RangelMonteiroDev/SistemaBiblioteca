DROP TABLE Arquitetura.Arquitetura

GO

DROP TABLE Arquitetura.Andares

GO

DROP TABLE Arquitetura.Sala

GO

DROP TABLE Arquitetura.Prateleiras;


CREATE TABLE Arquitetura.Arquitetura (

    idArdar INT NOT NULL PRIMARY KEY,

    numeroSala INT NOT NULL,

    quantidadeSala INT NOT NULL,

    ocupada BIT NOT NULL,

    reservada BIT NOT NULL,

    numeroPrataleira INT NOT NULL,

    quantidadePrateleira INT NOT NULL


);


ALTER TABLE Arquitetura.Arquitetura

ADD idLivro INT 

GO

ALTER TABLE Arquitetura.Arquitetura

ADD idArmario INT 

GO

ALTER TABLE Arquitetura.Arquitetura

ADD idComputador UNIQUEIDENTIFIER

GO

ALTER TABLE Arquitetura.Arquitetura

ADD idMesa INT 

GO

ALTER TABLE Arquitetura.Arquitetura

ADD CONSTRAINT FkIdLivro

FOREIGN KEY (idLivro)

REFERENCES Livros.Livros (idLivro)

GO

ALTER TABLE Arquitetura.Arquitetura

ADD CONSTRAINT FkIdArmario

FOREIGN KEY (idArmario)

REFERENCES Utilitarios.Armarios(idArmario)

GO

ALTER TABLE Arquitetura.Arquitetura

ADD CONSTRAINT FkIdComputador

FOREIGN KEY (idComputador)

REFERENCES Utilitarios.Computadores (idComputador)

GO

ALTER TABLE Arquitetura.Arquitetura

ADD CONSTRAINT FkIdMesa

FOREIGN KEY (idMesa)

REFERENCES Utilitarios.Mesas (idMesa);

/*Foi necessário refazer a Engenharia de dados desse SCHEMA */