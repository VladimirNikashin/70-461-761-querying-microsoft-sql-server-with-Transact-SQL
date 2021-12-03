BEGIN TRANSACTION

INSERT INTO ViewByDepartment(EmployeeNumber, DateOfTransaction, TotalAmount) 
VALUES (132,'2015-07-07', 999.99)

SELECT * FROM ViewByDepartment ORDER BY Department, EmployeeNumber

ROLLBACK TRANSACTION

BEGIN TRANSACTION

SELECT * FROM ViewByDepartment WHERE EmployeeNumbeR IN (132,142)

UPDATE ViewByDepartment
SET EmployeeNumber = 142
WHERE EmployeeNumber = 132

SELECT * FROM ViewByDepartment ORDER BY EmployeeNumber, DateOfTransaction

ROLLBACK TRANSACTION