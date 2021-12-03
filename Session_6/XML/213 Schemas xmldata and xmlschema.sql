SELECT E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLAstName, T.Amount, T.DateOfTransaction
FROM [dbo].[tblEmployee] AS E
LEFT JOIN [dbo].[tblTransaction] AS T
ON E.EmployeeNumber = T.EmployeeNumber
WHERE E.EmployeeNumber BETWEEN 200 AND 202
FOR XML RAW, xmldata
GO

SELECT E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLAstName, T.Amount, T.DateOfTransaction
FROM [dbo].[tblEmployee] AS E
LEFT JOIN [dbo].[tblTransaction] AS T
ON E.EmployeeNumber = T.EmployeeNumber
WHERE E.EmployeeNumber BETWEEN 200 AND 202
FOR XML RAW, xmlschema
GO

-- xmldata auto generates a schema
-- A schema tells the XML that a string cannot be in the place of an int also the schema enforces that rule aswell.

-- xmlschema auto generatets a more complex XML Schema

-- Attributes of data types within XML
-- i4 is equivalent to an int
-- boolean
-- datetime - datetime.iso8601
-- double
-- string - varchar
-- null - nill