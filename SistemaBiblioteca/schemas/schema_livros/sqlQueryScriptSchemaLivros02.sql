ALTER TABLE Livros.Emprestimo 

DROP COLUMN mesEmprestimo;



ALTER TABLE Livros.Emprestimo 

ADD dataPrevistaEntrega date;


ALTER TABLE Livros.Emprestimo 

ADD dataRenovacao date;

