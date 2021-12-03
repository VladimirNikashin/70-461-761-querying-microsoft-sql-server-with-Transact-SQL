BEGIN TRANSACTION -- this is the start of an explicit Transaction

SELECT * 
FROM [dbo].[tblEmployee]

UPDATE [dbo].[tblEmployee]
SET EmployeeNumber = 122
WHERE EmployeeNumber = 123

--UPDATE [dbo].[tblEmployee]
--SET EmployeeNumber = 123
--WHERE EmployeeNumber = 122

COMMIT TRANSACTION -- When a Begin Transaction is made it must always be ended otherwise it might cause a query to lock.

SELECT * FROM [dbo].[tblEmployee]