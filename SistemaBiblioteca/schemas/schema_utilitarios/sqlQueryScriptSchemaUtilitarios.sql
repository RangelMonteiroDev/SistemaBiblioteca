use SistemaBiblioteca;


CREATE SCHEMA Utilitarios;


CREATE TABLE Utilitarios.Mesas (

idMesa INT IDENTITY(1,1) NOT NULL PRIMARY KEY,

idUsuario INT  NOT NULL,

ocupada BIT NOT NULL,

reservada BIT NOT NULL,

dataCompra date,

dataCadastro date,

precoCompra money

);


ALTER TABLE Arquitetura.Sala

ADD idMesa INT NOT NULL

GO

ALTER TABLE Arquitetura.Sala

ADD CONSTRAINT FkMesaID

FOREIGN KEY (idMesa)

REFERENCES Utilitarios.Mesas (idMesa);


ALTER TABLE Utilitarios.Mesas 

ADD CONSTRAINT FKIDUsuario

FOREIGN KEY (idUsuario)

REFERENCES Person.Usuario (idUsuario);



CREATE TABLE Utilitarios.Computadores (

    idComputador UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,

    idUsuario INT NOT NULL, 

    ocupado BIT NOT NULL,

    reservado BIT NOT NULL,

    dataCompra date NOT NULL,

    dataCadastramento date NOT NULL,

    precoCompra money NOT NULL,

    FOREIGN KEY(idUsuario)

    REFERENCES Person.Usuario (idUsuario)


)

GO

ALTER TABLE Arquitetura.Sala 

ADD idComputador UNIQUEIDENTIFIER NOT NULL

GO

ALTER TABLE Arquitetura.Sala

ADD CONSTRAINT FkUUIDComputador

FOREIGN KEY (idComputador)

REFERENCES Utilitarios.Computadores (idComputador);



CREATE TABLE Utilitarios.Armarios (

    idArmario INT IDENTITY(1,1) PRIMARY KEY NOT NULL,

    idUsuario INT NOT NULL,

    ocupado BIT NOT NULL,

    reservado BIT NOT NULL,

    dataCompra DATE NOT NULL,

    dataCadastramento DATE NOT NULL,

    precoCompra money NOT NULL,

    FOREIGN KEY (idUsuario)

    REFERENCES Person.Usuario (idUsuario)


)


GO


ALTER TABLE Arquitetura.Sala

ADD idArmario INT NOT NULL

GO

ALTER TABLE Arquitetura.Sala

ADD CONSTRAINT FkIdArmario

FOREIGN KEY (idArmario)

REFERENCES Utilitarios.Armarios (idArmario);

