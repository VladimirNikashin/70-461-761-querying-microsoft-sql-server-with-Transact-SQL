IF OBJECT_ID('NameEmployees','P') IS NOT NULL
DROP PROC NameEmployees
GO

CREATE PROC NameEmployees(@EmployeeNumberFrom int, @EmployeeNumberTo int) AS
	BEGIN
		IF EXISTS( SELECT * FROM tblEmployee WHERE EmployeeNumber BETWEEN @EmployeeNumberFrom AND @EmployeeNumberTo)
		BEGIN
			DECLARE @EmployeeNumber int = @EmployeeNumberFrom
			WHILE @EmployeeNumber <= @EmployeeNumberTo
				BEGIN
--				IF NOT EXISTS (SELECT * FROM tblEmployee WHERE EmployeeNumber = @EmployeeNumber)
--					BEGIN
--					SET @EmployeeNumber = @EmployeeNumber + 1		-- The same as: SET @EmployeeNumber =+
--					CONTINUE
--					END
--				IF EXISTS (SELECT * FROM tblEmployee WHERE EmployeeNumber = @EmployeeNumber)
--					BEGIN
--						SET @EmployeeNumber = +1
--						CONTINUE
--					END
				IF EXISTS (SELECT * FROM tblEmployee WHERE EmployeeNumber = @EmployeeNumber)
				SELECT EmployeeNumber, EmployeeFirstName, EmployeeLastName
				FROM tblEmployee
				WHERE Employeenumber = @EmployeeNumber
				SET @EmployeeNumber = @EmployeeNumber + 1
--				IF @EmployeeNumber = 500	   -- Conditional setup for BREAK, CONTINUE and GOTO
--				BREAK						   -- Stops the loop
--				CONTINUE					   -- Makes conditional loops repeat
--				GOTO						   -- Skips lines or starts at particular lines of code, Creates Spaghetti logic... avoid GOTO
			END
		END
	END
GO

NameEmployees 4, 5
EXECUTE NameEmployees 223, 227
EXEC NameEmployees 323, 327
EXEC NameEmployees 323, 1327 -- With regards to this particular procedure avoid running this line. It takes too long to complete this execution.
GO