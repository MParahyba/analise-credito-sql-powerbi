CREATE DATABASE BankAnalyticsDB;
GO

USE BankAnalyticsDB;
GO
-- 1. TABELA DE CLIENTES

CREATE TABLE Cliente(
ClienteID INT PRIMARY KEY IDENTITY(1,1),
Nome VARCHAR(100) NOT NULL,
IDADE INT,
ScoreCredito INT CHECK (ScoreCredito BETWEEN 0 AND 1000),
RendaMensal DECIMAL(10,2),
Regiao VARCHAR(50)
);

-- 2 TABELA DE CONTAS BANCARIAS 

CREATE TABLE Contas (
ContaID INT PRIMARY KEY IDENTITY(1,1),
ClienteID INT FOREIGN KEY REFERENCES Cliente(ClienteID),
TipoConta VARCHAR (20) CHECK (TipoConta IN ('Corrente', 'Poupança', 'Universitaria','PJ')),
DataAbertura DATE,
SaldoAtual DECIMAL(15,2)
);

-- 3 TABELA DE EMPRESTIMOS 

CREATE TABLE Emprestimos (
EmprestimoID INT PRIMARY KEY IDENTITY(1,1),
ContaID INT FOREIGN KEY REFERENCES Contas(ContaID),
ValorContratado DECIMAL (15,2) NOT NULL,
NumeroParcelas INT,
TaxaJurosAnual DECIMAL(5,2),
DataContratacao DATE,
StatusEmprestimo VARCHAR(20)
CHECK (StatusEmprestimo IN ('Pago', 'Em Dia', 'Atrasado'))
);

-- CRIEI O BANCO DE DADOS E AS TABELAS AO QUAL IREI USAR, AGORA CRIAR NOMES E DATAS...


