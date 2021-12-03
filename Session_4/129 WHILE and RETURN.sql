IF OBJECT_ID('NameEmployees','P') IS NOT NULL
DROP PROC NameEmployees
GO

CREATE PROC NameEmployees(@EmployeeNumberFrom int, @EmployeeNumberTo int, @NumberOfRows int OUTPUT) AS
	BEGIN
		IF EXISTS( SELECT * FROM tblEmployee WHERE EmployeeNumber BETWEEN @EmployeeNumberFrom AND @EmployeeNumberTo)
		BEGIN
			SELECT EmployeeNumber, EmployeeFirstName, EmployeeLastName
			FROM tblEmployee
			WHERE Employeenumber BETWEEN @EmployeeNumberFrom AND @EmployeeNumberTo
			SET @NumberOfRows = @@ROWCOUNT
			RETURN 0 -- If it returns a Zero... Or Null... then it means it was successfull
		END
		ELSE
		BEGIN
			SET @NumberOfRows = 0
			RETURN 1	-- If it returns number other than zero then it was a failure
		END
	END
GO

--DECLARE @NumberRows INT
--GO											DECLARE @NumberRows is only remembered inside this one batch
--NameEmployees 4, 5, @NumberRows OUTPUT		... Because this is a beginning of a new batch it has now forgotten that DECLARE @NumberRows was ever made 
--SELECT @NumberRows AS MyRowCount
--GO											This batch won't work because the statement  doesnt have they Keyword EXEC or EXECUTE

--DECLARE @NumberRows INT
--NameEmployees 4, 5, @NumberRows OUTPUT
--SELECT @NumberRows AS MyRowCount
--GO											--This batch won't work because the statement  doesnt have they Keyword EXEC or EXECUTE

DECLARE @NumberRows INT
EXEC  NameEmployees 4, 5, @NumberRows OUTPUT
SELECT @NumberRows AS MyRowCount
GO

DECLARE @NumberRows INT
EXEC NameEmployees 323, 228, @NumberRows OUTPUT
SELECT @NumberRows AS MyRowCount
GO

DECLARE @NumberRows int
EXECUTE NameEmployees @EmployeeNumberFrom = 223, @EmployeeNumberTo = 227, @NumberOfRows = @NumberRows OUTPUT
SELECT @NumberRows AS MyRowCount
GO

--________________________________________________________________________________________________________

DECLARE @NumberRows INT, @ReturnStatus INT
EXEC @ReturnStatus = NameEmployees 4, 5, @NumberRows OUTPUT
SELECT @NumberRows AS MyRowCount, @ReturnStatus AS Return_Status
GO

DECLARE @NumberRows INT, @ReturnStatus INT
EXEC @ReturnStatus = NameEmployees 4, 327, @NumberRows OUTPUT
SELECT @NumberRows AS MyRowCount, @ReturnStatus AS Return_Status
GO

DECLARE @NumberRows INT, @ReturnStatus INT
EXECUTE @ReturnStatus = NameEmployees @EmployeeNumberFrom = 223, @EmployeeNumberTo = 227, @NumberOfRows = @NumberRows OUTPUT
SELECT @NumberRows AS MyRowCount, @ReturnStatus AS Return_Status
GO