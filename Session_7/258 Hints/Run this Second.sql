SELECT D.Department, D.DepartmentHead, E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName
FROM [dbo].[tblDepartment] AS D
LEFT HASH JOIN [dbo].[tblEmployee] AS E
ON D.Department = E.Department
WHERE D.Department = 'HR'
GO

SELECT D.Department, D.DepartmentHead, E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName
FROM [dbo].[tblDepartment] AS D
LEFT MERGE JOIN [dbo].[tblEmployee] AS E
ON D.Department = E.Department
WHERE D.Department = 'HR'
GO

SELECT D.Department, D.DepartmentHead, E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName
FROM [dbo].[tblDepartment] AS D
LEFT LOOP JOIN [dbo].[tblEmployee] AS E
ON D.Department = E.Department
WHERE D.Department = 'HR'
GO

SELECT D.Department, D.DepartmentHead, E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName
FROM [dbo].[tblDepartment] AS D
LEFT JOIN [dbo].[tblEmployee] AS E WITH (NOLOCK) -- WITH (NOLOCK) basically means read uncommitted data... aka dirty data
ON D.Department = E.Department
WHERE D.Department = 'HR'
GO

SELECT D.Department, D.DepartmentHead, E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName
FROM [dbo].[tblDepartment] AS D
LEFT JOIN [dbo].[tblEmployee] AS E WITH (REPEATABLEREAD) 
ON D.Department = E.Department
WHERE D.Department = 'HR'
GO

SELECT D.Department, D.DepartmentHead, E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName
FROM [dbo].[tblDepartment] AS D
LEFT JOIN [dbo].[tblEmployee] AS E WITH (REPEATABLEREAD, READUNCOMMITTED) -- This is query wont work due to conflicting locking hints... however this is an example of how to add multiple Hints.
ON D.Department = E.Department
WHERE D.Department = 'HR'
GO

--Hints are
--NOLOCK
--READUNCOMMITTED
--UPDLOCK
--REPEATABLEREAD
--SERIALIZABLE
--READCOMMITTED
--TABLOCK
--TABLOCKX
--PAGLOCK
--ROWLOCK
--NOWAIT
--READPAST
--XLOCK
--SNAPSHOT
--NOEXPAND
--FORCESEEK
--FORCESCAN