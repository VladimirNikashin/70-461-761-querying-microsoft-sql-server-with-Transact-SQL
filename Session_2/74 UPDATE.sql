SELECT * FROM tblEmployee WHERE EmployeeNumber = 194
SELECT * FROM tblTransaction WHERE EmployeeNumber = 3
SELECT * FROM tblTransaction WHERE EmployeeNumber = 194

BEGIN TRANSACTION

--SELECT * FROM tblTransaction WHERE EmployeeNumber = 194

UPDATE tblTransaction
set EmployeeNumber = 194
OUTPUT inserted.*,deleted.* -- deleted represents the old rows, inserted represents the new rows
FROM tblTransaction
WHERE EmployeeNumber = 3
-- WHERE EmployeeNumber in (3,5,7,9)
-- WHERE EmployeeNumber between 3 and 10 and DateOfTransaction > ''

--SELECT * FROM tblTransaction WHERE EmployeeNumber = 194

ROLLBACK TRANSACTION