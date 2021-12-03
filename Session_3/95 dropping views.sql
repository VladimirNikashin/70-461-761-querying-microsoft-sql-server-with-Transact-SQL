USE [70-461]
GO

--IF EXISTS(SELECT * FROM sys.views WHERE name = 'ViewByDepartment')
IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.VIEWS 
WHERE [TABLE_NAME] = 'ViewByDepartment' AND TABLE_SCHEMA = 'dbo')
	DROP VIEW dbo.ViewByDepartment
GO

CREATE VIEW ViewByDepartment as -- Only works with a GO keyword after and or before the statementat. And only works without an ORDER BY Statement
SELECT D.Department, T.EmployeeNumber, T.DateOfTransaction, T.Amount AS TotalAmount
FROM tblDepartment AS D
LEFT JOIN tblEmployee AS E
ON D.Department = E.Department
LEFT JOIN tblTransaction AS T
ON E.EmployeeNumber = T.EmployeeNumber
WHERE T.EmployeeNumber BETWEEN 120 AND 139
--ORDER BY D.Department, T.EmployeeNumber
GO