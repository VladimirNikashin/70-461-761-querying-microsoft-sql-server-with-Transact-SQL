SET STATISTICS OI OFF -- default
GO

SET STATISTICS OI ON -- This adds extra statistical messages to the message tab
GO

SELECT D.Department, D.DepartmentHead, E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName
FROM [dbo].[tblDepartment] AS D
LEFT LOOP JOIN [dbo].[tblEmployee] AS E
ON D.Department = E.Department
WHERE D.Department = 'HR'
GO

-- In stat messages if you ever see the word LOB or BLOB it means object of the following data type
--text
--ntext
--image
--varchar(max)
--varbinary(max)
--nvarchar(max)