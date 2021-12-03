SELECT 1 AS TAG, NULL AS PARENT, -- In order to use Explicit you need to use Tag and NULL AS PARENT as the first Items in the Select Query
	   E.EmployeeFirstName AS [Elements!1!EmployeeFirstName],
	   E.EmployeeLastName AS [Elements!1!EmployeeLastName], 
	   E.EmployeeNumber AS [Elements!1!EmployeeNumber], 
	   E.DateOfBirth AS [Elements!1!EmployeeDateOfBirth],
	   NULL AS [Elements!2!Amount], 
	   NULL AS [Elements!2!DateOfTransaction]
FROM tblEmployee AS E
WHERE E.EmployeeNumber BETWEEN 200 AND 202
UNION ALL
SELECT 2 AS TAG, 1 AS PARENT,
NULL AS [EmployeeFirstName],
NULL AS [EmployeeLAstName],
T.EmployeeNumber,
null as DateOfBirth,
Amount,
DateOfTransaction
FROM tblTransaction AS T
INNER JOIN tblEmployee AS E ON T.EmployeeNumber = E.EmployeeNumber
WHERE T.EmployeeNumber BETWEEN 200 AND 202
ORDER BY EmployeeNumber, [Elements!2!Amount]
FOR XML EXPLICIT
GO