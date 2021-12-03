CREATE CLUSTERED INDEX idx_tblEmployee ON [dbo].[tblEmployee]([EmployeeNumber])

DROP INDEX idx_tblEmployee ON [dbo].[tblEmployee]

SELECT * FROM [dbo].[tblEmployee2] WHERE [EmployeeNumber] = 127
SELECT* FROM [dbo].[tblEmployee2]

SELECT *
INTO [dbo].[tblEmployee2]
FROM [dbo].[tblemployee]
WHERE EmployeeNumber <> 131

-- Seek = Going through a few number of rows based on an index
-- Scan = Going through entire table to find something

ALTER TABLE [dbo].[tblEmployee2]
ADD CONSTRAINT pk_tblEmployee PRIMARY KEY (EmployeeNumber)