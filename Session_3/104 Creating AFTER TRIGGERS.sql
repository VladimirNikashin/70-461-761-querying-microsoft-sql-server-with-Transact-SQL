CREATE TRIGGER TR_tblTransaction
    ON tblTransaction
    AFTER DELETE, INSERT, UPDATE
    AS
    BEGIN
		SELECT * FROM inserted -- Shows everything that has been inserted.
		SELECT * FROM deleted -- Shows everything that has been removed.
    END
GO

BEGIN TRANSACTION
INSERT INTO tblTransaction(Amount, DateOfTransaction, EmployeeNumber)
VALUES(123, '2015-07-10', 123)
ROLLBACK TRANSACTION
GO
	
SET  NOCOUNT ON -- Tells program to disable messages
SELECT * FROM tblDepartment
SET NOCOUNT OFF -- Tells program to re-enable messages
