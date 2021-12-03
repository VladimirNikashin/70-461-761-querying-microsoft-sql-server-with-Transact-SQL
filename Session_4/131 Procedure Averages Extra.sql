SELECT * FROM tblTransaction
WHERE EmployeeNumber BETWEEN 3 AND 11
ORDER BY EmployeeNumber

SELECT SUM(Amount) FROM tblTransaction
WHERE Employeenumber BETWEEN 3 AND 11

SELECT COUNT(DISTINCT EmployeeNumber) FROM tblTransaction
WHERE EmployeeNumber BETWEEN 3 AND 11

SELECT COUNT(DISTINCT EmployeeNumber) FROM tblEmployee
WHERE EmployeeNumber BETWEEN 3 AND 11