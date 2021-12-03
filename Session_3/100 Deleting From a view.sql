SELECT * FROM ViewByDepartment
DELETE FROM ViewByDepartment
WHERE TotalAmount = 999.99 AND EmployeeNumber = 132
GO

CREATE VIEW ViewSimple AS
SELECT * FROM tblTransaction
GO

BEGIN TRANSACTION
DELETE FROM ViewSimple
WHERE EmployeeNumber = 132
SELECT * FROM ViewSimple
ROLLBACK TRANSACTION