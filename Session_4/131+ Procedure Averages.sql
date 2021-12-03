IF OBJECT_ID('AverageBalance','P') IS NOT NULL
DROP PROC AverageBalance
GO

CREATE PROC AverageBalance(@EmployeeNumberFrom INT, @EmployeeNumberTo INT, @AverageBalance INT OUTPUT) AS
	BEGIN
		DECLARE @TotalAmount MONEY
		DECLARE @NumOfEmployee INT
		
		SELECT @TotalAmount = SUM(Amount) FROM tblTransaction
		WHERE Employeenumber BETWEEN @EmployeeNumberFrom AND @EmployeeNumberTo
		
		SELECT @NumOfEmployee = COUNT(DISTINCT EmployeeNumber) FROM tblEmployee
		WHERE EmployeeNumber BETWEEN @EmployeeNumberFrom AND @EmployeeNumberTo

		SET @AverageBalance = @TotalAmount/@NumOfEmployee

--		IF @NumOfEmployee = 0
--		BEGIN
--			SET @AverageBalance = 0
--		END
--		ELSE
--		BEGIN
--			SET @AverageBalance = @TotalAmount / @NumOfEmployee
--		END
	END
GO

--DECLARE @AvgBalance INT
--GO											DECLARE @AvgBalance is only remembered inside this one batch
--AverageBalance 4, 5, @AvgBalance OUTPUT		... Because this is a beginning of a new batch it has now forgotten that DECLARE @AvgBalance was ever made 
--SELECT @AvgBalance AS Average_Balance
--GO											This batch won't work because the statement  doesnt have they Keyword EXEC or EXECUTE

--DECLARE @AvgBalance INT
--AverageBalance 4, 5, @AvgBalance OUTPUT
--SELECT @AvgBalance AS Average_Balance
--GO											--This batch won't work because the statement  doesnt have they Keyword EXEC or EXECUTE

DECLARE @AvgBalance INT
EXEC  AverageBalance 4, 5, @AvgBalance OUTPUT
SELECT @AvgBalance AS Average_Balance
GO

DECLARE @AvgBalance INT
EXEC AverageBalance 323, 228, @AvgBalance OUTPUT
SELECT @AvgBalance AS Average_Balance
GO

DECLARE @AvgBalance int
EXECUTE AverageBalance @EmployeeNumberFrom = 223, @EmployeeNumberTo = 227, @AverageBalance = @AvgBalance OUTPUT
SELECT @AvgBalance AS Average_Balance
GO

--________________________________________________________________________________________________________

DECLARE @AvgBalance INT, @ReturnStatus INT
EXEC @ReturnStatus = AverageBalance 4, 5, @AvgBalance OUTPUT
SELECT @AvgBalance AS Average_Balance, @ReturnStatus AS Return_Status
GO

DECLARE @AvgBalance INT, @ReturnStatus INT
EXEC @ReturnStatus = AverageBalance 4, 327, @AvgBalance OUTPUT
SELECT @AvgBalance AS Average_Balance, @ReturnStatus AS Return_Status
GO

DECLARE @AvgBalance INT, @ReturnStatus INT
EXECUTE @ReturnStatus = AverageBalance @EmployeeNumberFrom = 223, @EmployeeNumberTo = 227, @AverageBalance = @AvgBalance OUTPUT
SELECT @AvgBalance AS Average_Balance, @ReturnStatus AS Return_Status
GO