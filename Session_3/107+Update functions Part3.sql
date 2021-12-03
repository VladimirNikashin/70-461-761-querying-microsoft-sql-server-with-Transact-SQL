ALTER TRIGGER TR_tblTransaction
ON tblTransaction
AFTER UPDATE
AS
BEGIN
	BEGIN
		--	IF @@ROWCOUNT>0
		--if UPDATE(DateOfTransaction)
		IF COLUMNS_UPDATED() & 2 = 2
		BEGIN
			SELECT * ,'Inserted - tblTransaction' AS Transaction_Inserted FROM inserted
			SELECT * , 'Deleted - tblTransaction' AS Transaction_Deleted FROM deleted
		END
	END
END
GO

UPDATE tblTransaction
SET DateOfTransaction = '2015-07-12'
WHERE Amount = 123 AND DateOfTransaction = '2015-07-12' AND EmployeeNumber = 123

IF EXISTS( SELECT * FROM tblTransaction WHERE Amount = 123 AND DateOfTransaction = '2015-07-12' AND EmployeeNumber = 124 )
DELETE FROM tblTransaction WHERE Amount = 123 AND DateOfTransaction = '2015-07-12' AND EmployeeNumber = 124
GO

IF EXISTS( SELECT * FROM tblTransaction WHERE Amount = 123 AND DateOfTransaction = '2015-07-11' AND EmployeeNumber = 124 )
DELETE FROM tblTransaction WHERE Amount = 123 AND DateOfTransaction = '2015-07-11' AND EmployeeNumber = 124
GO

INSERT INTO tblTransaction(Amount, DateOfTransaction, EmployeeNumber) VALUES (123,'2015-07-11', 123)

SELECT * FROM ViewByDepartment WHERE EmployeeNumber = 123

BEGIN TRANSACTION
DELETE FROM ViewByDepartment
WHERE TotalAmount = -2.77 and EmployeeNumber = 132
ROLLBACK TRANSACTION