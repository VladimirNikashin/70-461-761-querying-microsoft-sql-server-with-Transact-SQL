CREATE PROC procTransactionBig(@EmployeeNumber AS INT) WITH RECOMPILE
AS
SELECT *
FROM tblTransactionBig AS T
LEFT JOIN tblEmployee AS E
ON T.EmployeeNumber = E.EmployeeNumber
WHERE T.EmployeeNumber = @EmployeeNumber

EXEC procTransactionBig 132

DROP PROC procTransactionBig
GO