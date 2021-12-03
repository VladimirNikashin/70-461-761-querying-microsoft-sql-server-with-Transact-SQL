IF EXISTS(SELECT * FROM SYS.OBJECTS WHERE name = 'NumberOfTransactions')
DROP FUNCTION NumberOfTransactions
GO

--IF OBJECT_ID (N'NumberOfTransactions',N'FN') IS NOT NULL
--DROP FUNCTION NumberOfTransactions
--GO

CREATE FUNCTION NumberOfTransactions(@EmployeeNumber int)
RETURNS INT
AS BEGIN
DECLARE @NumberOfTransactions INT
SELECT @NumberOfTransactions = COUNT(*) FROM tblTransaction
WHERE EmployeeNumber = @EmployeeNumber
RETURN @NumberOfTransactions
END
GO

SELECT *, dbo.NumberOfTransactions(EmployeeNumber) AS TransNum
FROM tblEmployee --Function in this select clause is 3x faster than the method below

SELECT E.EmployeeNumber,E.EmployeeFirstName,E.EmployeeLastName, COUNT(T.EmployeeNumber) AS TransNum
FROM tblEmployee AS E
LEFT JOIN tblTransaction AS T
ON E.EmployeeNumber = T.EmployeeNumber
GROUP BY E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName