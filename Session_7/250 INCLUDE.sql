SELECT [EmployeeLastName]
FROM [dbo].[tblEmployee]
WHERE EmployeeNumber BETWEEN 140 AND 150

CREATE NONCLUSTERED INDEX idx_DateOfBirthWithIncludes
ON [dbo].[tblEmployee]([DateOfBirth])
include ([EmployeeFirstName],[EmployeeMiddleName],[EmployeeLastName])

DROP INDEX [idx_tblEmployeeNumber] ON [dbo].[tblEmployee]

SELECT [EmployeeFirstName],[EmployeeMiddleName],[EmployeeLastName]
FROM [dbo].[tblEmployee] WHERE DateOfBirth BETWEEN '2000-02-02' AND '2009-01-01'

CREATE CLUSTERED INDEX idx_EmployeeNumber
ON [dbo].[tblEmployee]([EmployeeNumber])

-- Filtered index
-- Finds the Selection in a much faster time to optimised data storage

-- Warning too many non clustered indices will result in slower operations