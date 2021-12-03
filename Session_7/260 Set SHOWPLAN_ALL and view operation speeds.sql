
--SET SHOWPLAN_XML ON
--GO

--SET SHOWPLAN_TEXT ON
--GO

--SET SHOWPLAN_ALL ON		--sets statistic information in table form
--GO

--SET STATISTICS TIME ON		--Shows cpu time for processing query
--GO

--SET STATISTICS IO ON
--GO

SELECT D.Department, D.DepartmentHead, E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName
FROM [dbo].[tblDepartment] AS D
LEFT LOOP JOIN [dbo].[tblEmployee] AS E
ON D.Department = E.Department
WHERE D.Department = 'HR'
GO

--SET SHOWPLAN_XML ON		--OFF is default
--GO

--SET SHOWPLAN_TEXT ON		--OFF is default
--GO

--SET SHOWPLAN_ALL ON		--OFF is default
--GO

--SET STATISTICS TIME OFF		--OFF is default
--GO

--SET STATISTICS IO OFF		--OFF is default
--GO