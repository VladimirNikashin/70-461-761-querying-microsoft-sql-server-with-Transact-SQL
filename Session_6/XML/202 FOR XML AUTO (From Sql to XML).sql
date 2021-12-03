SELECT E.EmployeeFirstName AS '@EmployeeFirstName', -- Defined attributes must come first in the select statement.
	   E.EmployeeLastName AS '@EmployeeLastName', 
	   E.EmployeeNumber, 
	   E.DateOfBirth,
	   T.Amount, 
	   T.DateOfTransaction
FROM tblEmployee AS E
LEFT JOIN tblTransaction AS T
ON E.EmployeeNumber = T.EmployeeNumber
WHERE E.EmployeeNumber BETWEEN 200 AND 202
FOR XML PATH('Employees') -- You Can Customise data to be either elements or attributes
GO

SELECT E.EmployeeNumber, E.EmployeeFirstName,E.EmployeeLastName, E.DateOfBirth,T.Amount, T.DateOfTransaction
FROM tblEmployee AS E
LEFT JOIN tblTransaction AS T
ON E.EmployeeNumber = T.EmployeeNumber
WHERE E.EmployeeNumber BETWEEN 200 AND 202
FOR XML PATH('Employees') -- You Can Customise data to be either elements or attributes
GO

SELECT E.EmployeeNumber, E.EmployeeFirstName,E.EmployeeLastName, E.DateOfBirth,T.Amount, T.DateOfTransaction
FROM tblEmployee AS E
LEFT JOIN tblTransaction AS T
ON E.EmployeeNumber = T.EmployeeNumber
WHERE E.EmployeeNumber BETWEEN 200 AND 202
FOR XML PATH
GO