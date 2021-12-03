SELECT *,(SELECT COUNT(T.EmployeeNumber) 
FROM tblTransaction AS T) AS NumTransactions 
FROM tblEmployee AS E
WHERE E.EmployeeLastName LIKE 'y%' 
GO

SELECT E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName, (SELECT COUNT(T.EmployeeNumber) 
FROM tblTransaction AS T 
WHERE T.EmployeeNumber = E.EmployeeNumber) AS NumTransactions ,
(SELECT SUM(Amount) FROM tblTransaction AS T WHERE T.EmployeeNumber = E.EmployeeNumber) AS TotalAmount
FROM tblEmployee AS E
WHERE E.EmployeeLastName LIKE 'y%'-- Correlated subquery Doing it this way is faster in terms of performance
GO

SELECT E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName, COUNT (T.EmployeeNumber) AS NumTransactions
FROM tblTransaction AS T
INNER JOIN tblEmployee AS E
ON E.EmployeeNumber = T.EmployeeNumber
WHERE E.EmployeeLastName LIKE '%y'
GROUP BY E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName
ORDER BY E.EmployeeNumber
GO