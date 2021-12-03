IF OBJECT_ID('NameEmployees','P') IS NOT NULL
DROP PROC NameEmployees
GO

CREATE PROC NameEmployees(@EmployeeNumberFrom int, @EmployeeNumberTo int) AS
	BEGIN
		IF EXISTS( SELECT * FROM tblEmployee WHERE EmployeeNumber BETWEEN @EmployeeNumberFrom AND @EmployeeNumberTo)
		BEGIN
			SELECT EmployeeNumber, EmployeeFirstName, EmployeeLastName
			FROM tblEmployee
			WHERE Employeenumber BETWEEN @EmployeeNumberFrom AND @EmployeeNumberTo
		END
	END
GO

NameEmployees 4, 5
EXECUTE NameEmployees 223, 227
EXEC NameEmployees 323, 228
GO

EXEC NameEmployees @EmployeeNumberFrom = 323, @EmployeeNumberTo = 327 -- Same as: EXEC NameEmployees 323, 228
EXEC NameEmployees 323, @EmployeeNumberTo = 327 -- Same as: EXEC NameEmployees 323, 228
EXEC NameEmployees @EmployeeNumberTo = 327, @EmployeeNumberFrom = 323  -- Same as: EXEC NameEmployees 323, 228