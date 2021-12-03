BEGIN TRANSACTION
UPDATE [dbo].[tblEmployee] SET EmployeeNumber = 122 WHERE EmployeeNumber = 123 -- It updates from a shared lock to an update lock and then updates that further to an exclusive lock.
WAITFOR DELAY '00:00:10' -- It will keep the lock running for 10 seconds
COMMIT TRANSACTION -- Upon Commit it will release the lock