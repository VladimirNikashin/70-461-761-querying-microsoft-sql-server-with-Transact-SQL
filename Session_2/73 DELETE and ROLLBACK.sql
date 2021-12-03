BEGIN TRANSACTION

SELECT count(*) FROM tblTransaction

DELETE tblTransaction
FROM tblEmployee AS E
RIGHT JOIN tblTransaction AS T
ON E.EmployeeNumber = T.EmployeeNumber
WHERE E.EmployeeNumber IS NULL

SELECT count(*) FROM tblTransaction

ROLLBACK TRANSACTION

SELECT count(*) FROM tblTransaction