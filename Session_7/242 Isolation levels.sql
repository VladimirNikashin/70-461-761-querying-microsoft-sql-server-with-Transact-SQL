--SET TRANSACTION ISOLATION LEVEL SERIALIZABLE READ -- Cannot read dirty data, it wont allow the dirty data to be modified and it wont allow new data to be added in. 
--SET TRANSACTION ISOLATION LEVEL REPEATABLE READ -- Cannot read dirty data and wont allow the data to be modified unless it has already been committed
--SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED -- To read dirty data do this
SET TRANSACTION ISOLATION LEVEL READ COMMITTED -- This is the default


BEGIN TRANSACTION
SELECT * FROM [dbo].[tblEmployee]
WAITFOR DELAY '00:00:20'
SELECT * FROM [dbo].[tblEmployee]
COMMIT TRANSACTION