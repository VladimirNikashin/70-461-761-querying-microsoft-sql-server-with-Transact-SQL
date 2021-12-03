UPDATE [dbo].[tblEmployee] SET EmployeeNumber = 123 WHERE EmployeeNumber = 122

-- To Mark a transaction first Alias it... then add WITH MARK... everything in the single quotes is the name of said Transaction.
SELECT @@TRANCOUNT
BEGIN TRANSACTION MyTransaction WITH MARK 'MY Transaction'
	SELECT @@TRANCOUNT -- 1
	BEGIN TRAN
		UPDATE [dbo].[tblEmployee]
		SET EmployeeNumber = 122
		WHERE EmployeeNumber = 123
		SELECT @@TRANCOUNT -- 2
	COMMIT TRANSACTION
	SELECT @@TRANCOUNT -- 1
ROLLBACK TRANSACTION
SELECT @@TRANCOUNT -- 0


SELECT @@TRANCOUNT -- 0
BEGIN TRANSACTION MyTransaction WITH MARK 'MY Transaction'
	SELECT @@TRANCOUNT -- 1
	BEGIN TRAN
		UPDATE [dbo].[tblEmployee]
		SET EmployeeNumber = 122
		WHERE EmployeeNumber = 123
		SELECT @@TRANCOUNT -- 2
	ROLLBACK TRANSACTION
	SELECT @@TRANCOUNT -- 0
IF @@TRANCOUNT > 0 -- TRANCOUNT is not greater than zero do not commit the below 
COMMIT TRANSACTION
	SELECT @@TRANCOUNT

SELECT @@TRANCOUNT -- 0
BEGIN TRANSACTION MyTransaction WITH MARK 'MY Transaction'
	SELECT @@TRANCOUNT -- 1
	BEGIN TRAN
		UPDATE [dbo].[tblEmployee]
		SET EmployeeNumber = 122
		WHERE EmployeeNumber = 123
		SELECT @@TRANCOUNT -- 2
	COMMIT TRANSACTION
	SELECT @@TRANCOUNT -- 1
IF @@TRANCOUNT > 0 -- TRANCOUNT is greater than zero proceed to commit the below 
ROLLBACK TRANSACTION
SELECT @@TRANCOUNT

SELECT * FROM [dbo].[tblEmployee]

-- TRANCOUNT
-- If you are nesting transactions then where are you nesting them.

-- BEGIN adds one to Trancount
-- COMMIT subtracts one from Trancount 
-- ROLLBACK SETS TRANCOUNT to 0
