SELECT E.EmployeeNumber, T.Amount
FROM [dbo].[tblEmployee] AS E
LEFT JOIN [dbo].[tblTransaction] AS T
ON E.EmployeeNumber = T.EmployeeNumber
WHERE E.EmployeeNumber / 10 = 34 -- Not a SARG and as a result it decided to scan for a result instead of seek
ORDER BY Amount -- Adding this line will Slow down the entire query

SELECT E.EmployeeNumber, T.Amount
FROM [dbo].[tblEmployee] AS E
LEFT JOIN [dbo].[tblTransaction] AS T
ON E.EmployeeNumber = T.EmployeeNumber
WHERE E.EmployeeNumber BETWEEN 340 AND 349 -- This is a SARG and it ended up to be twice as fast as the above.
ORDER BY Amount -- Adding this line will Slow down the entire query

SELECT E.EmployeeNumber, T.Amount
FROM [dbo].[tblEmployee] AS E
LEFT JOIN [dbo].[tblTransaction] AS T
ON E.EmployeeNumber = T.EmployeeNumber
WHERE E.EmployeeNumber / 10 = 34 -- Not a SARG and as a result it decided to scan for a result instead of seek

SELECT E.EmployeeNumber, T.Amount
FROM [dbo].[tblEmployee] AS E
LEFT JOIN [dbo].[tblTransaction] AS T
ON E.EmployeeNumber = T.EmployeeNumber
WHERE E.EmployeeNumber BETWEEN 340 AND 349 -- This is a SARG and it ended up to be twice as fast as the above.

-- DONT SORT UNLESS YOU ABSOLUTELY NEED TO

-- SARG
-- Search Arguments
-- SARG can use Indexes.

-- WHERE YEAR(DateOriginal)=2020											 This does not use an index and its not a SARG
-- WHERE DateOriginal >='2020-01-01' AND DateOriginal < '2021-01-01'		 This is a SARG because the field is not enclosed by a function and it doesnt use an index

-- WHERE SUBSTRING(PersonName,1,4)='Jhon'									 PersonName is being Manipulated therefore this is not a SARG.
-- WHERE PersonName like 'John%'											 This would still give the PersonName... this is a SARG 

