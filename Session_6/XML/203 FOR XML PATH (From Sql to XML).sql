SELECT E.EmployeeFirstName AS '@EmployeeFirstName', -- Defined attributes must come first in the select statement.
	   E.EmployeeLastName AS '@EmployeeLastName', 
	   E.EmployeeNumber, 
	   E.DateOfBirth,
	   (SELECT T.Amount AS 'Amount'
	   FROM tblTransaction AS T WHERE T.EmployeeNumber = E.EmployeeNumber FOR XML PATH(''), TYPE) as TransactionElement -- TYPE forces the result to output in Readable Xml Format
FROM tblEmployee AS E
WHERE E.EmployeeNumber BETWEEN 200 AND 202
FOR XML PATH('Elements'), ROOT('MyXML') -- You Can Customise data to be either elements or attributes an adjust what gets put as a starter tag(root)
GO

SELECT E.EmployeeFirstName AS '@EmployeeFirstName', -- Defined attributes must come first in the select statement.
	   E.EmployeeLastName AS '@EmployeeLastName', 
	   E.EmployeeNumber, 
	   E.DateOfBirth,
	   T.Amount AS 'Transaction/Amount', 
	   T.DateOfTransaction AS 'Transaction/DateOfTransaction' -- Its an element called DateOfTransaction that is located inside a parent element called Transaction
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