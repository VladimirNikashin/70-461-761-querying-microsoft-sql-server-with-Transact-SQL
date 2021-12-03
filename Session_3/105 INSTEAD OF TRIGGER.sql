CREATE TRIGGER tr_ViewByDepartment
ON dbo.ViewByDepartment
INSTEAD OF DELETE
AS
BEGIN
    SELECT *, 'ViewByDepartment' FROM deleted
END
GO

ALTER TRIGGER tr_ViewByDepartment
ON dbo.ViewByDepartment
INSTEAD OF DELETE
AS
BEGIN
    DECLARE @EmployeeNumber AS INT
	DECLARE @DateOfTransaction AS SMALLDATETIME
	DECLARE @Amount AS SMALLMONEY
	SELECT @EmployeeNumber = EmployeeNumber, @DateOfTransaction = DateOfTransaction, @Amount = TotalAmount -- Same as SELECT EmployeeNumber, DateOfTransaction, TotalAmount
	FROM deleted
	-- SELECT * FROM deleted
	DELETE tblTransaction
	FROM tblTransaction AS T
	WHERE T.EmployeeNumber = @EmployeeNumber
	AND T.DateOfTransaction = @EmployeeNumber
	AND t.Amount = @Amount
END
GO

BEGIN TRANSACTION 
SELECT * FROM ViewByDepartment WHERE TotalAmount = -2.77 AND employeeNumber = 132
DELETE FROM ViewByDepartment
WHERE TotalAmount = 2.77 AND EmployeeNumber = 132
SELECT * FROM ViewByDepartment WHERE TotalAmount = -2.77 AND employeeNumber = 132
ROLLBACK TRANSACTION