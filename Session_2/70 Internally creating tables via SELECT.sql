SELECT Department 
FROM
(select Department, count(*) as NumberOfDepartment
FROM tblEmployee
GROUP BY Department) as NewTable
GO

SELECT count(Department) as NumberOfDepartments
FROM
(select Department, count(*) as NumberOfDepartment
FROM tblEmployee
GROUP BY Department) as NewTable
GO

SELECT Department as NumberOfDepartments
INTO tblDepartment2
FROM
(select Department, count(*) as NumberOfDepartment
FROM tblEmployee
GROUP BY Department) as NewTable
GO

SELECT count(Department) as NumberOfDepartments
FROM tblEmployee
GO

SELECT count(Department) as NumberOfDepartments
FROM tblEmployee
GO

SELECT distinct Department,'' as DepartmentHead		-- Creates a new varchar table
into tblDepartment									-- Into Creates a Table
FROM tblEmployee									-- This related Select statement does not print out anything
GO

DROP TABLE tblDepartment
GO

SELECT distinct Department,N'' as DepartmentHead	-- Creates a new nvarchar table
into tblDepartment									-- Into Creates a Table
FROM tblEmployee									-- This related Select statement does not print out anything
GO

DROP TABLE tblDepartment
GO

SELECT distinct Department, CONVERT (varchar(20),N'') as DepartmentHead		-- Creates a new varchar(20) table
into tblDepartment															-- Into Creates a Table
FROM tblEmployee															-- This related Select statement does not print out anything
GO

ALTER TABLE tblDepartment
ALTER COLUMN Department varchar(21) null
GO

SELECT * FROM tblDepartment