-- To Mark a transaction first Alias it... then add WITH MARK... everything in the single quotes is the name of said Transaction.
BEGIN TRANSACTION MyTransaction WITH MARK 'MY Transaction'

BEGIN TRAN
UPDATE [dbo].[tblEmployee]
SET EmployeeNumber = 122
WHERE EmployeeNumber = 123
COMMIT TRANSACTION

--UPDATE [dbo].[tblEmployee] SET EmployeeNumber = 123 WHERE EmployeeNumber = 122

ROLLBACK TRANSACTION -- When a Begin Transaction is made it must always be ended otherwise it might cause a query to lock.

SELECT * FROM [dbo].[tblEmployee]