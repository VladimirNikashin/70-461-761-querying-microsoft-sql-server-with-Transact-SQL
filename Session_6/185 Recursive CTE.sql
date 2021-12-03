BEGIN TRANSACTION
ALTER TABLE tblEmployee
ADD manager INT
GO
UPDATE tblEmployee
SET Manager = ((EmployeeNumber-123)/10)+ 123
WHERE EmployeeNumber>123;
SELECT E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName,
M.EmployeeNumber AS ManagerNumber, M.EmployeeFirstName AS ManagerFirstName,
M.EmployeeLastName AS ManagerLastName
FROM tblEmployee AS E
LEFT JOIN tblEmployee AS M
ON E.Manager = M.EmployeeNumber

-- Recursive CTE
-- CTE is a WITH statement

ROLLBACK TRANSACTION