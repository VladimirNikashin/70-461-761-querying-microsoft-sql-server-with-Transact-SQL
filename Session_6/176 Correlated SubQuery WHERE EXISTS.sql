SELECT *, (SELECT COUNT(T.EmployeeNumber) 
FROM tblTransaction AS T) AS NumTransactions
FROM tblEmployee AS E
WHERE E.EmployeeLastName LIKE 'y%'-- Correlated subquery
GO

SELECT * FROM tbltransaction AS T
WHERE EXISTS
	(SELECT EmployeeNumber From tblEmployee AS E WHERE EmployeeLastName LIKE 'y%' AND T.EmployeeNumber = E.EmployeeNumber)
	ORDER BY EmployeeNumber

SELECT T.*
FROM tblTransaction AS T
INNER JOIN tblEmployee AS E
ON E.EmployeeNumber = T.EmployeeNumber
WHERE E.EmployeeLastName LIKE '%y'
ORDER BY T.EmployeeNumber 