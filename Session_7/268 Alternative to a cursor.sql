SELECT T.* FROM tblTransaction AS T
RIGHT JOIN tblEmployee AS E
ON T.EmployeeNumber = E.EmployeeNumber
WHERE E.EmployeeNumber BETWEEN 120 AND 299
AND T.EmployeeNumber IS NOT NULL

SELECT * FROM tblTransaction AS T
RIGHT JOIN tblEmployee AS E
ON T.EmployeeNumber = E.EmployeeNumber
WHERE E.EmployeeNumber BETWEEN 130 AND 140