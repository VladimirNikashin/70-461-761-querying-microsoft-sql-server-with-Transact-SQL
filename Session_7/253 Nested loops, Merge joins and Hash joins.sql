DROP INDEX [idx_LastNameForHR] on [dbo].[tblEmployee]
DROP INDEX [idx_DateOfBirthWithInclude] ON [dbo].[tblEmployee]
DROP INDEX [idx_tblEmployee_DateOfBirth_Department] ON [dbo].[tblEmployee]
DROP INDEX [idx_tblEmployee_DateOfBirth] ON [dbo].[tblEmployee]
GO

--Nested loop
SELECT D.Department, D.DepartmentHead, E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName
FROM [dbo].[tblEmployee] AS E
LEFT JOIN [dbo].[tblDepartment] AS D
ON E.Department = D.Department
WHERE D.Department = 'HR'
--

-- Hash Map Join
SELECT *
FROM [dbo].[tblEmployee] AS E
LEFT JOIN [dbo].[tblDepartment] AS D
ON E.Department = D.Department
--

-- Merge Join
CREATE UNIQUE CLUSTERED INDEX [idx_tblEmployee] ON [dbo].[tblEmployee] ([EmployeeNumber])
CREATE UNIQUE CLUSTERED INDEX [idx_tblTransaction] ON [dbo].[tblTransaction] ([EmployeeNumber], [DateOfTransaction], [Amount])

SELECT E.EmployeeNumber, T.Amount
FROM [dbo].[tblEmployee] AS E
LEFT JOIN [dbo].[tblTransaction] AS T
ON E.EmployeeNumber = T.EmployeeNumber
--

-- Hash join
SELECT * 
INTO [dbo].[tblEmployeeNoIndex]
FROM [dbo].[tblEmployee]

SELECT * 
INTO [dbo].[tblTransactionNoIndex]
FROM [dbo].[tblTransaction]

SELECT E.EmployeeNumber, T.Amount
FROM [dbo].[tblEmployeeNoIndex] AS E
LEFT JOIN [dbo].[tblTransactionNoIndex] AS T
ON E.EmployeeNumber = T.EmployeeNumber