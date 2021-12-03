USE [70-461]
GO

if exists(SELECT * FROM INFORMATION_SCHEMA.VIEWS WHERE [TABLE_NAME] = 'ViewByDepartment' AND [TABLE_SCHEMA] = 'dbo')
	DROP VIEW [dbo].[ViewByDepartment]
GO

CREATE VIEW [dbo].[ViewByDepartment] WITH ENCRYPTION AS -- Only works with a GO keyword after and or before the statementat. And only works without an ORDER BY Statement
SELECT D.Department, T.EmployeeNumber, T.DateOfTransaction, T.Amount AS TotalAmount
FROM tblDepartment AS D
LEFT JOIN tblEmployee AS E
ON D.Department = E.Department
LEFT JOIN tblTransaction AS T
ON E.EmployeeNumber = T.EmployeeNumber
WHERE T.EmployeeNumber BETWEEN 120 AND 139
--ORDER BY D.Department, T.EmployeeNumber
GO

--Run the below seperately
SELECT V.name, S.text FROM sys.syscomments AS S
INNER JOIN sys.views AS V
ON S.id = V.object_id


SELECT object_definition(object_id('dbo.ViewByDepartment'))
SELECT * FROM sys.sql_modules