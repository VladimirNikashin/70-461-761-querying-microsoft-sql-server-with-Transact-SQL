SELECT [EmployeeLastName]
FROM [dbo].[tblEmployee]
WHERE [Department] = 'HR'

CREATE NONCLUSTERED INDEX idx_LastNameForHR
ON [dbo].[tblEmployee]([EmployeeLastName]) WHERE [Department] = 'HR'

-- Filtered index
-- Finds the Selection in a much faster time to optimised data storage

-- Warning too many non clustered indices will result in slower operations