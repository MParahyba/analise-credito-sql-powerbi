CREATE VIEW vw_AnaliseCredito AS
SELECT 
    c.ClienteID,
    c.Nome, 
    c.Idade,
    c.ScoreCredito, 
    c.RendaMensal,
    c.Regiao,
    co.TipoConta,
    co.SaldoAtual,
    e.ValorContratado,
    e.StatusEmprestimo,
    CASE 
        WHEN c.ScoreCredito < 300 THEN 'Alto Risco'
        WHEN c.ScoreCredito BETWEEN 300 AND 699 THEN 'Médio Risco'
        ELSE 'Baixo Risco'
    END AS ClassificacaoRisco
FROM Cliente c
LEFT JOIN Contas co ON c.ClienteID = co.ClienteID
LEFT JOIN Emprestimos e ON e.ContaID = co.ContaID;
GO

SELECT * FROM vw_AnaliseCredito;