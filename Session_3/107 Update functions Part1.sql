ALTER TRIGGER TR_tblTransaction
ON tblTransaction
AFTER DELETE, INSERT, UPDATE
AS
BEGIN
	BEGIN
		if @@ROWCOUNT>0
		BEGIN
			SELECT * ,'Inserted - tblTransaction' AS Transaction_Inserted FROM inserted
			SELECT * , 'Deleted - tblTransaction' AS Transaction_Deleted FROM deleted
		END
	END
END
GO

UPDATE tblTransaction
SET DateOfTransaction = '2015-07-12'
WHERE Amount = 123 AND DateOfTransaction = '2015-07-11' AND EmployeeNumber = 123

IF EXISTS( SELECT * FROM tblTransaction WHERE Amount = 123 AND DateOfTransaction = '2015-07-11' AND EmployeeNumber = 123 )
DELETE FROM tblTransaction WHERE Amount = 123 AND DateOfTransaction = '2015-07-11' AND EmployeeNumber = 123
GO

INSERT INTO tblTransaction(Amount, DateOfTransaction, EmployeeNumber) VALUES (123,'2015-07-11', 123)

SELECT * FROM ViewByDepartment WHERE EmployeeNumber = 123

BEGIN TRANSACTION
DELETE FROM ViewByDepartment
WHERE TotalAmount = -2.77 and EmployeeNumber = 132
ROLLBACK TRANSACTION