

-- 1. LIMPAR AS TABELAS PARA NÃO DAR DUPLICIDADE 
DELETE FROM Emprestimos;
DELETE FROM Contas;
DELETE FROM Cliente;

-- Reiniciar os contadores do IDENTITY para começar do 1 de novo
DBCC CHECKIDENT ('Cliente', RESEED, 0);
DBCC CHECKIDENT ('Contas', RESEED, 0);
DBCC CHECKIDENT ('Emprestimos', RESEED, 0);
GO

-- 2. ALTERAR A RESTRIÇÃO DA TABELA CONTAS PARA ACEITAR 'PJ'
-- Vamos derrubar a restrição antiga e criar uma nova que aceita 'PJ'
ALTER TABLE Conta DROP CONSTRAINT CK__Conta__TipoCont__5165187F; -- Se der erro nessa linha, pode pular ela.
ALTER TABLE Conta ADD CONSTRAINT CK_TipoConta CHECK (TipoConta IN ('Corrente', 'Poupança', 'Universitária', 'PJ'));
GO

-- 3. INSERIR TODOS OS 25 CLIENTES
INSERT INTO Cliente (Nome, Idade, ScoreCredito, RendaMensal, Regiao) VALUES
('Matheus Silva', 23, 850, 4500.00, 'Sul'),
('Ana Souza', 34, 280, 2800.00, 'Sudeste'),
('Carlos Lima', 45, 620, 7200.00, 'Nordeste'),
('Beatriz Santos', 29, 410, 3100.00, 'Centro-Oeste'),
('Ricardo Alves', 52, 190, 1900.00, 'Norte'),
('Gabriel Barbosa', 25, 780, 5200.00, 'Sul'),
('Mariana Costa', 42, 310, 2400.00, 'Sudeste'),
('Lucas Mendes', 31, 920, 9500.00, 'Sudeste'),
('Juliana Rocha', 22, 450, 1800.00, 'Nordeste'),
('Rodrigo Fonseca', 50, 150, 3200.00, 'Norte'),
('Fernanda Lima', 28, 640, 4100.00, 'Sul'),
('Thiago Santos', 37, 880, 12000.00, 'Centro-Oeste'),
('Amanda Melo', 45, 510, 3800.00, 'Nordeste'),
('Felipe Dias', 19, 350, 1500.00, 'Sudeste'),
('Camila Oliveira', 33, 710, 6000.00, 'Sul'),
('Bruno Ramos', 26, 290, 2900.00, 'Norte'),
('Larissa Souza', 41, 820, 8300.00, 'Centro-Oeste'),
('Gustavo Henrique', 48, 600, 5500.00, 'Sudeste'),
('Patricia Cruz', 30, 400, 2700.00, 'Nordeste'),
('Leonardo Silva', 35, 950, 15000.00, 'Sul'),
('Aline Teixeira', 24, 570, 3400.00, 'Sudeste'),
('Diego Martins', 55, 210, 2200.00, 'Norte'),
('Sofia Guimaraes', 27, 730, 4900.00, 'Sul'),
('Rafael Castro', 39, 660, 7100.00, 'Centro-Oeste'),
('Isabela Vieira', 32, 180, 1600.00, 'Nordeste');

-- 4. INSERIR TODAS AS 25 CONTAS 
INSERT INTO Contas (ClienteID, TipoConta, DataAbertura, SaldoAtual) VALUES
(1, 'Corrente', '2024-01-15', 1200.50),
(2, 'Universitária', '2023-06-20', 50.00),
(3, 'PJ', '2022-11-10', 25000.00),
(4, 'Corrente', '2024-03-01', 450.00),
(5, 'Poupança', '2021-05-18', 10.25),
(6, 'Corrente', '2024-02-10', 3200.00),
(7, 'Corrente', '2023-08-15', -150.00),
(8, 'PJ', '2022-04-12', 45000.00),
(9, 'Universitária', '2025-01-20', 120.00),
(10, 'Corrente', '2023-11-05', -800.00),
(11, 'Poupança', '2024-05-18', 5000.00),
(12, 'PJ', '2021-09-01', 89000.00),
(13, 'Corrente', '2023-03-14', 1450.00),
(14, 'Universitária', '2025-02-28', 45.00),
(15, 'Corrente', '2024-07-22', 2100.00),
(16, 'Corrente', '2024-01-30', -40.00),
(17, 'Poupança', '2022-06-15', 12500.00),
(18, 'PJ', '2020-10-10', 112000.00),
(19, 'Corrente', '2023-12-01', 3400.00),
(20, 'Corrente', '2024-08-19', -600.00),
(21, 'Universitária', '2025-03-05', 300.00),
(22, 'Corrente', '2022-05-24', 15.00),
(23, 'Poupança', '2024-10-02', 800.00),
(24, 'Corrente', '2023-07-11', 4100.00),
(25, 'Corrente', '2024-04-04', -1200.00);

-- 5. INSERIR TODOS OS 25 EMPRÉSTIMOS
INSERT INTO Emprestimos (ContaID, ValorContratado, NumeroParcelas, TaxaJurosAnual, DataContratacao, StatusEmprestimo) VALUES
(1, 5000.00, 12, 12.5, '2025-10-10', 'Em Dia'),
(2, 3000.00, 24, 22.4, '2025-01-20', 'Atrasado'),
(3, 50000.00, 48, 8.9, '2024-05-15', 'Pago'),
(4, 8000.00, 18, 15.6, '2025-11-05', 'Em Dia'),
(5, 4000.00, 12, 24.9, '2025-02-10', 'Atrasado'),
(6, 12000.00, 24, 11.5, '2025-05-10', 'Em Dia'),
(7, 5000.00, 12, 24.9, '2025-11-15', 'Atrasado'),
(8, 150000.00, 60, 7.8, '2024-02-20', 'Pago'),
(9, 2000.00, 18, 19.5, '2025-08-01', 'Em Dia'),
(10, 8000.00, 12, 26.0, '2025-03-10', 'Atrasado'),
(11, 7500.00, 24, 14.2, '2025-06-14', 'Em Dia'),
(12, 250000.00, 72, 6.5, '2024-01-10', 'Em Dia'),
(13, 10000.00, 24, 15.8, '2025-04-22', 'Em Dia'),
(14, 1500.00, 12, 22.1, '2025-09-05', 'Atrasado'),
(15, 25000.00, 36, 10.9, '2024-11-18', 'Pago'),
(16, 6000.00, 18, 24.5, '2025-02-12', 'Atrasado'),
(17, 45000.00, 48, 9.2, '2024-08-30', 'Em Dia'),
(18, 80000.00, 36, 8.5, '2025-01-15', 'Em Dia'),
(19, 11000.00, 24, 16.0, '2025-07-20', 'Atrasado'),
(20, 300000.00, 60, 5.9, '2024-05-05', 'Pago'),
(21, 4000.00, 12, 18.4, '2025-10-01', 'Em Dia'),
(22, 15000.00, 36, 25.5, '2025-01-22', 'Atrasado'),
(23, 13000.00, 24, 12.8, '2025-06-18', 'Em Dia'),
(24, 35000.00, 48, 11.2, '2024-12-05', 'Em Dia'),
(25, 9000.00, 18, 27.2, '2025-03-01', 'Atrasado');
GO