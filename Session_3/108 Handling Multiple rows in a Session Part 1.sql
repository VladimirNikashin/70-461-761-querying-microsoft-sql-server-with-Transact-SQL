ALTER TRIGGER tr_ViewByDepartment
ON dbo.ViewByDepartment
INSTEAD OF DELETE
AS
BEGIN
	SELECT *, 'To Be Deleted' AS ToBeDeleted FROM deleted 
	DECLARE @EmployeeNumber AS INT
	DECLARE @DateOfTransaction AS SMALLDATETIME
	DECLARE @Amount AS SMALLMONEY
	SELECT @EmployeeNumber = EmployeeNumber, @DateOfTransaction = DateOfTransaction, @Amount = TotalAmount 
	FROM deleted
	DELETE tblTransaction 
	FROM tblTransaction AS T
	WHERE T.EmployeeNumber = @EmployeeNumber
	AND T.DateOfTransaction = @DateOfTransaction
	AND T.Amount = @Amount
END
GO

BEGIN TRANSACTION
SELECT * ,'Before Delete' AS BeforeDeleted FROM ViewByDepartment  WHERE EmployeeNumber = 132
DELETE FROM ViewByDepartment
WHERE EmployeeNumber = 132 AND TotalAmount = 861.16
SELECT *, 'After Delete' As AfterDeleted FROM ViewByDepartment  WHERE EmployeeNumber = 132
ROLLBACK TRANSACTION