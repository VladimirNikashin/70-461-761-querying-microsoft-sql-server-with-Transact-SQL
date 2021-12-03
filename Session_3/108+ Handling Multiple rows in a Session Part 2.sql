ALTER TRIGGER tr_ViewByDepartment
ON dbo.ViewByDepartment
INSTEAD OF DELETE
AS
BEGIN
	SELECT *, 'To be deleted' FROM deleted
	DELETE tblTransaction 
	FROM tblTransaction AS T
	join deleted AS D
	on T.EmployeeNumber = D.EmployeeNumber
	and T.DateOfTransaction = D.DateOfTransaction
	and T.Amount = D.TotalAmount
END
GO

BEGIN TRANSACTION
SELECT * ,'Before Delete' AS BeforeDeleted FROM ViewByDepartment  WHERE EmployeeNumber = 132
DELETE FROM ViewByDepartment
WHERE EmployeeNumber = 132 --AND TotalAmount = 861.16
SELECT *, 'After Delete' As AfterDeleted FROM ViewByDepartment  WHERE EmployeeNumber = 132
ROLLBACK TRANSACTION