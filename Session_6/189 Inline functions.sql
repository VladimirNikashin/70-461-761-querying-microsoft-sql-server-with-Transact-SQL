CREATE FUNCTION TransactionList(
@EmployeeNumber int
)
RETURNS TABLE AS RETURN
(
    SELECT * FROM tblTransaction WHERE EmployeeNumber = @EmployeeNumber
)
GO

SELECT * FROM dbo.TransactionList(123)
SELECT * FROM tblEmployee WHERE EXISTS(SELECT * FROM dbo.TransactionList(EmployeeNumber))

SELECT DISTINCT E.*
FROM tblEmployee AS E
JOIN tblTransaction AS T ON E.EmployeeNumber = T.EmployeeNumber

SELECT * FROM tblEmployee AS E
WHERE EXISTS (SELECT EmployeeNumber FROM tblTransaction AS T WHERE E.EmployeeNumber = T.EmployeeNumber)

-- InLine function is used to return an entire table