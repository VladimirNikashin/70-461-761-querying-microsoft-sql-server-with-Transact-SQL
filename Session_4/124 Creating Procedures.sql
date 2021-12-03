CREATE PROC NameEmployees AS
BEGIN
	SELECT EmployeeNumber, EmployeeFirstName, EmployeeLastName
	FROM tblEmployee
END
GO

NameEmployees
EXECUTE NameEmployees
EXEC NameEmployees