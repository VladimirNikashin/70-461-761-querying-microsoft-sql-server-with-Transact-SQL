-- RIGHT JOIN
SELECT * FROM(
SELECT E.EmployeeNumber AS ENumber, E.EmployeeFirstName,
E.EmployeeLastName, T.EmployeeNumber AS TNumber,
Sum(T.Amount) AS TotalAmount
FROM tblEmployee AS E
RIGHT JOIN tblTransaction AS T
ON E.EmployeeNumber = T.EmployeeNumber
GROUP BY E.EmployeeNumber,T.EmployeeNumber,E.EmployeeFirstName, E.EmployeeLastName, T.Amount
) AS newTable 
WHERE ENumber IS NULL 
ORDER BY ENumber, TNumber, EmployeeFirstName,EmployeeLastName

-- Derived Table
SELECT ENumber, EmployeeFirstName, EmployeeLastName FROM(
SELECT E.EmployeeNumber AS ENumber, E.EmployeeFirstName,
E.EmployeeLastName, T.EmployeeNumber AS TNumber,
Sum(T.Amount) AS TotalAmount
FROM tblEmployee AS E
LEFT JOIN tblTransaction AS T
ON E.EmployeeNumber = T.EmployeeNumber
GROUP BY E.EmployeeNumber,T.EmployeeNumber,E.EmployeeFirstName, E.EmployeeLastName
) AS newTable WHERE TNumber IS NULL ORDER BY ENumber, TNumber, EmployeeFirstName,EmployeeLastName


SELECT * FROM(
SELECT E.EmployeeNumber AS ENumber, E.EmployeeFirstName,
E.EmployeeLastName, T.EmployeeNumber AS TNumber,
Sum(T.Amount) AS TotalAmount
FROM tblEmployee AS E
LEFT JOIN tblTransaction AS T
ON E.EmployeeNumber = T.EmployeeNumber
GROUP BY E.EmployeeNumber,T.EmployeeNumber,E.EmployeeFirstName, E.EmployeeLastName
) AS newTable WHERE TNumber IS NULL ORDER BY ENumber, TNumber, EmployeeFirstName,EmployeeLastName


SELECT E.EmployeeNumber AS ENumber, E.EmployeeFirstName,
E.EmployeeLastName, T.EmployeeNumber AS TNumber,
Sum(T.Amount) AS TotalAmount
FROM tblEmployee AS E
LEFT JOIN tblTransaction AS T
ON E.EmployeeNumber = T.EmployeeNumber
WHERE T.EmployeeNumber IS NULL
GROUP BY E.EmployeeNumber,T.EmployeeNumber,E.EmployeeFirstName, E.EmployeeLastName
ORDER BY E.EmployeeNumber, T.EmployeeNumber, E.EmployeeFirstName,E.EmployeeLastName
	