CREATE FUNCTION fnc_TransactionTotal(@intEmployee as int)
RETURNS MONEY
AS BEGIN
DECLARE @TotalAmount AS MONEY
SELECT @TotalAmount = sum(Amount)
FROM [dbo].[tblTransaction] WHERE EmployeeNumber = @intEmployee
RETURN @TotalAmount
END

SELECT dbo.fnc_TransactionTotal(134)
GO

SET STATISTICS TIME ON
GO

SELECT EmployeeNumber, dbo.fnc_TransactionTotal(EmployeeNumber)
FROM dbo.tblEmployee

SELECT E.EmployeeNumber, sum(Amount) AS TotalAmount
FROM dbo.tblEmployee AS E
LEFT JOIN dbo.tblTransaction AS T
ON E.EmployeeNumber = T.EmployeeNumber
GROUP BY E.EmployeeNumber
GO

CREATE FUNCTION fnc_TransactionAll (@intEmployee AS INT)
RETURNS @returntable TABLE
(Amount SMALLMONEY)
AS
BEGIN
	INSERT @returntable
	SELECT amount
	FROM dbo.tblTransaction
	WHERE EmployeeNumber = @intEmployee
	RETURN
END

SELECT * FROM dbo.fnc_TransactionAll (127)
GO

SELECT EmployeeNumber, sum(T.Amount) AS TotalAmount
FROM dbo.tblEmployee AS E
OUTER Apply fnc_TransactionAll(EmployeeNumber) AS T
GROUP BY EmployeeNumber
GO

-- The join is more efficient when looking at the execution plan.
SELECT E.EmployeeNumber, sum(T.Amount) AS TotalAmount
FROM dbo.tblEmployee AS E
LEFT JOIN dbo.tblTransaction as T on E.EmployeeNumber = T.EmployeeNumber 
GROUP BY E.EmployeeNumber
GO

SELECT E.EmployeeNumber, (SELECT sum(T.Amount) FROM tblTransaction AS T 
						  WHERE T.EmployeeNumber = E.EmployeeNumber) AS TotalAmount
FROM dbo.tblEmployee AS E
GO
-- functions cannot be optimized
-- Select queries can be optimized

SET STATISTICS TIME OFF
GO