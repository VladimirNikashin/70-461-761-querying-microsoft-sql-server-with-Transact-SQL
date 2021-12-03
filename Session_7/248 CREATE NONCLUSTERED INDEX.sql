CREATE NONCLUSTERED INDEX idx_tblEmployee_DateOfBirth ON [dbo].[tblEmployee]([DateOfBirth])
CREATE NONCLUSTERED INDEX idx_tblEmployee_DateOfBirth_Department ON [dbo].[tblEmployee]([DateOfBirth],Department)

DROP INDEX idx_tblEmployee ON [dbo].[tblEmployee]

SELECT * FROM [dbo].[tblEmployee2] WHERE [EmployeeNumber] = 127
SELECT* FROM [dbo].[tblEmployee2]

SELECT DateOfBirth, Department
FROM [dbo].[tblemployee]
WHERE DateOfBirth > '1992-01-01' AND DateOfBirth < '1993-01-01'

-- Seek = Going through a few number of rows based on an index
-- Scan = Going through entire table to find something

ALTER TABLE [dbo].[tblDepartment]
ADD CONSTRAINT unq_tblDepartment UNIQUE (Department)

DROP TABLE [dbo].[tblEmployee2]