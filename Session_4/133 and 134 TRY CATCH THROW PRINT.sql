IF OBJECT_ID('AverageBalance','P') IS NOT NULL
DROP PROC AverageBalance
GO

CREATE PROC AverageBalance(@EmployeeNumberFrom INT, @EmployeeNumberTo INT, @AverageBalance INT OUTPUT) AS
	BEGIN
		DECLARE @TotalAmount DECIMAL(5,2)
		DECLARE @NumOfEmployee INT
		
		BEGIN TRY
		PRINT 'The Employee numbers are from ' + convert(varchar(10),@EmployeeNumberFrom) + ' to ' + CONVERT(VARCHAR(10),@EmployeeNumberTo)
		SELECT @TotalAmount = SUM(Amount) FROM tblTransaction
		WHERE Employeenumber BETWEEN @EmployeeNumberFrom AND @EmployeeNumberTo
		
		SELECT @NumOfEmployee = COUNT(DISTINCT EmployeeNumber) FROM tblEmployee
		WHERE EmployeeNumber BETWEEN @EmployeeNumberFrom AND @EmployeeNumberTo

		SET @AverageBalance = @TotalAmount/@NumOfEmployee

		END TRY
		BEGIN CATCH
		SET @AverageBalance = 0
		IF ERROR_NUMBER() = 8134 -- @@ERROR returns the error of the last used command, ERROR_NUMBER() returns the error number of the last error
		BEGIN
		SET @AverageBalance = 0
		PRINT 'There are no valid Employees in this range.'
		RETURN 8134
		END
		ELSE
			DECLARE @ErrorMessage AS VARCHAR(255)
			SELECT @ErrorMessage = ERROR_MESSAGE()
			raiserror ('Too many drunks', 16, 1)
			--THROW 56789, 'Unknown', 1


			--SELECT ERROR_MESSAGE() AS ErrorMessage, 
			--	   ERROR_LINE() AS ErrorLine, -- Shows which code line is responsible for the error
			--	   ERROR_NUMBER() AS ErrorNumber, 
			--	   ERROR_PROCEDURE() AS ErrorProcedure,
			--	   ERROR_SEVERITY() AS ErrorSeverity,	-- 0 to 10 is for information only
			--	   16 default SQL SERVER log saying yes an error has occurred
			--	   20-25 means its very severe
			--	   ERROR_STATE() AS ErrorState
			--RETURN 1

			SELECT 'Hi There'
		END CATCH
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