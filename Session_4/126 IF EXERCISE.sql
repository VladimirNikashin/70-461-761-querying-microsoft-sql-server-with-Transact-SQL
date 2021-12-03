IF EXISTS (SELECT * FROM sys.procedures WHERE NAME = 'NameEmployees')
DROP PROC NameEmployees
GO

-- The same as if exists
-- IF OBJECT_ID('NameEmployees', 'P') IS NOT NULL
-- DROP PROC NameEmployees
-- GO

CREATE PROC NameEmployees(@EmployeeNumber int) AS
BEGIN
IF EXISTS (SELECT * FROM tblEmployee WHERE EmployeeNumber = @EmployeeNumber)
	BEGIN
	IF @EmployeeNumber < 300
		BEGIN
			SELECT EmployeeNumber, EmployeeFirstName, EmployeeLastName
			FROM tblEmployee
			WHERE EmployeeNumber = @EmployeeNumber
		END
	ELSE 
		BEGIN
			SELECT EmployeeNumber, EmployeeFirstName, EmployeeLastName
			FROM tblEmployee
			WHERE EmployeeNumber = @EmployeeNumber
			SELECT * FROM tblTransaction WHERE EmployeeNumber = @EmployeeNumber
		END
	END
END
GO

NameEmployees 4
EXECUTE NameEmployees 223
EXEC NameEmployees 324 -- Selects all transactions that employee number 324 has made.
GO
