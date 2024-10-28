use SistemaBiblioteca;

CREATE SCHEMA Seguranca
;


CREATE TABLE Seguranca.AuditoriaPersonPerson (


    AuditoriaPersonPersonID UNIQUEIDENTIFIER PRIMARY KEY NOT NULL,

    Operacao VARCHAR(40)  NOT NULL,

    Usuario  VARCHAR(40)  NOT NULL,

    Tabela   VARCHAR(40)  NOT NULL,

    Esquema  VARCHAR(40)  NOT NULL,

    UsuarioIP NVARCHAR(40) NOT NULL
);


ALTER TABLE Seguranca.AuditoriaPersonPerson

ADD operacaoDATA DATE;