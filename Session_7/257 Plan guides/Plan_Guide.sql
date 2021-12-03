SELECT *
INTO dbo.tblTransactionBig
FROM [dbo].[tblTransaction]

INSERT INTO dbo.tblTransactionBig ([Amount], [DateOfTransaction], [EmployeeNumber])
SELECT T1.Amount, T2.DateOfTransaction, 1 AS EmployeeNumber
FROM [dbo].[tblTransaction] AS T1
CROSS JOIN (SELECT * FROM [dbo].[tblTransaction] WHERE EmployeeNumber<200) AS T2

CREATE NONCLUSTERED INDEX idx_tbltblTransactionBig ON dbo.tblTransactionBig(EmployeeNumber)