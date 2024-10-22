# SistemaBiblioteca
SistemaBiblioteca

Este repositório contém o esquema do banco de dados para o Sistema de Biblioteca, incluindo tabelas, relacionamentos, procedimentos armazenados, funções e implementação de segurança.
Estrutura do Banco de Dados

O banco de dados é dividido em várias schemas, cada uma delas contendo tabelas relacionadas a diferentes funcionalidades do sistema. As principais schemas são:

    Person: Contém informações sobre pessoas, usuários, departamentos, localização e membros.
    Livros: Gerencia dados sobre livros, autores e empréstimos.
    Arquitetura: Define a estrutura física da biblioteca, incluindo salas e andares.
    Utilitarios: Contém dados sobre recursos, como mesas, computadores e armários.

Tabelas Principais
1. Person

    Person.Person: Armazena dados pessoais dos usuários.
    Person.Usuario: Relaciona usuários a suas informações de conta.
    Person.Localizacao: Contém informações de localização dos usuários.
    Person.Departamento: Armazena informações sobre os departamentos da biblioteca.
    Person.PagamentoMensal: Controla os pagamentos mensais relacionados aos usuários.
    Person.Membros: Relaciona membros a departamentos e pagamentos.

2. Livros

    Livros.Livros: Armazena dados sobre os livros disponíveis na biblioteca.
    Livros.Autor: Contém informações sobre os autores dos livros.
    Livros.Emprestimo: Gerencia o processo de empréstimo de livros.

3. Arquitetura

    Arquitetura.Arquitetura: Define a estrutura física da biblioteca.
    Arquitetura.Sala: Armazena informações sobre as salas da biblioteca.
    Arquitetura.Andares: Contém dados sobre os andares da biblioteca.

4. Utilitarios

    Utilitarios.Mesas: Armazena informações sobre mesas disponíveis.
    Utilitarios.Computadores: Contém dados sobre computadores disponíveis.
    Utilitarios.Armarios: Armazena informações sobre armários.

Procedimentos Armazenados

Os procedimentos armazenados são utilizados para encapsular a lógica de negócios e facilitar operações no banco de dados. Os principais procedimentos incluem:

    Person.InsertInTbLocalizacao: Insere dados na tabela de localizações.
    Person.InsertInTbPerson: Insere novos registros de pessoas.
    Person.AlterarValorMulta: Atualiza o valor de multas associadas aos usuários.
    Person.multa: Insere novas multas e relaciona-as aos usuários.

Segurança

A segurança do banco de dados será implementada por meio de roles e usuários. Isso garantirá que apenas usuários autorizados tenham acesso a funcionalidades específicas do sistema.
Roles

    Admin: Acesso total para gerenciar usuários, dados e configurações do sistema.
    Usuario: Acesso restrito para gerenciar seus próprios dados e realizar empréstimos de livros.

Users

    Serão criados usuários para acessar o sistema, cada um associado a um papel (role) específico para controlar o nível de acesso.

Implementação Futuras

    Funções: Serão implementadas funções para cálculos e operações específicas no banco de dados.
    Procedimentos Adicionais: Novos procedimentos armazenados serão criados para gerenciar melhor os dados e a lógica de negócios.
    Documentação: A documentação do sistema será atualizada conforme novas funcionalidades forem implementadas.

Como Executar

Para executar o script, utilize um cliente de SQL Server e conecte-se ao banco de dados SistemaBiblioteca. Execute os comandos SQL na ordem correta para criar as schemas, tabelas, e outros objetos do banco de dados.
