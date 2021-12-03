ALTER TRIGGER TR_tblTransaction
ON tblTransaction
AFTER DELETE, INSERT, UPDATE
AS
BEGIN
	BEGIN
		SELECT *, 'Inserted - tblTransaction' AS Tbl_Inserted FROM Inserted
		SELECT *, 'Deleted - tblTransaction' AS Tbl_Deleted FROM  Deleted
	END
END
GO

IF EXISTS(SELECT * FROM tblTransaction WHERE EmployeeNumber = 123 AND Amount = 123)
DELETE tblTransaction WHERE EmployeeNumber = 123 AND Amount = 123
GO

INSERT INTO tblTransaction(Amount, DateOfTransaction, EmployeeNumber)
VALUES (123,'2015-07-11', 123)
GO

SELECT * FROM tblTransaction WHERE EmployeeNumber = 123 AND Amount = 123
SELECT * FROM ViewByDepartment WHERE totalAmount = - 2.77 AND EmployeeNumber = 132

BEGIN TRANSACTION
DELETE FROM ViewByDepartment
WHERE TotalAmount = -2.77 AND EmployeeNumber = 132
ROLLBACK TRANSACTION