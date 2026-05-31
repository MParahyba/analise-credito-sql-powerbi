
SELECT 
c.Nome, 
c.ScoreCredito, 
co.SaldoAtual,
e.ValorContratado
FROM Cliente c
LEFT JOIN Contas co ON c.ClienteID =co.ClienteID
LEFT JOIN Emprestimos e ON e.ContaID = co.ContaID


SELECT 
c.Nome, 
c.ScoreCredito, 
co.SaldoAtual,
e.ValorContratado
FROM Cliente c
JOIN Contas co ON c.ClienteID =co.ClienteID
JOIN Emprestimos e ON e.EmprestimoID = co.ContaID

INSERT INTO Cliente (Nome, Idade, ScoreCredito, RendaMensal, Regiao) 
VALUES ('Cliente Teste Sem Conta', 30, 500, 3000.00, 'Sul');

SELECT c.Nome, c.ScoreCredito, co.SaldoAtual, e.ValorContratado
FROM Cliente c
JOIN Contas co ON c.ClienteID = co.ClienteID
JOIN Emprestimos e ON e.ContaID = co.ContaID;




SELECT
	c.Regiao,
		SUM(e.ValorContratado) AS TotalEmprestado
FROM Cliente c
JOIN Contas co ON c.ClienteID = co.ClienteID
JOIN Emprestimos e ON e.ContaID = co.ClienteID
GROUP BY c.Regiao;


SELECT 
    CASE 
        WHEN c.ScoreCredito < 300 THEN 'Alto Risco'
        WHEN c.ScoreCredito BETWEEN 300 AND 699 THEN 'Médio Risco'
        ELSE 'Baixo Risco'
    END AS ClassificacaoRisco,
    SUM(e.ValorContratado) AS TotalEmprestado
FROM Cliente c
JOIN Contas co ON c.ClienteID = co.ClienteID
JOIN Emprestimos e ON e.ContaID = co.ContaID
GROUP BY 
    CASE 
        WHEN c.ScoreCredito < 300 THEN 'Alto Risco'
        WHEN c.ScoreCredito BETWEEN 300 AND 699 THEN 'Médio Risco'
        ELSE 'Baixo Risco'
    END;
