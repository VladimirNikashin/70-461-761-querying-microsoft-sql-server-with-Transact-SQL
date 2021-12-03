BEGIN TRANSACTION

ALTER TABLE tblEmployee
ADD Manager INT
GO

UPDATE tblEmployee
SET Manager = ((EmployeeNumber - 123)/10)+123
WHERE EmployeeNumber>123
SELECT E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName, E.Manager,
	   M.EmployeeNumber AS ManagerNumber, M.EmployeeFirstName AS ManagerFisrtName, M.EmployeeLastName AS ManagerLastName
FROM tblEmployee AS E
LEFT JOIN tblEmployee AS M 
ON E.Manager = M.EmployeeNumber
GO

ROLLBACK TRANSACTION
