SELECT E.EmployeeNumber, E.EmployeeFirstName,E.EmployeeLastName, E.DateOfBirth,T.Amount, T.DateOfTransaction
FROM tblEmployee AS E
LEFT JOIN tblTransaction AS T
ON E.EmployeeNumber = T.EmployeeNumber
WHERE E.EmployeeNumber BETWEEN 200 AND 202
FOR XML RAW('MyRow'), elements -- each row becomes an individual element