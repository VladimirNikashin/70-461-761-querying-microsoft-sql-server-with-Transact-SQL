SELECT * FROM tblTransaction
ORDER BY EmployeeNumber ASC
GO

-- Below is the entire static list of employee numbers that are not used in Transaction
WITH Numbers AS (
SELECT ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS RowNumber 
FROM tblTransaction AS U)

SELECT U.RowNumber FROM Numbers AS U
LEFT JOIN tblTransaction AS T
ON U.RowNumber = T.EmployeeNumber
WHERE T.EmployeeNumber IS NULL
GO

--Below is the entire static list of limited employee numbers that are not used in Transaction
WITH Numbers AS (
SELECT TOP(1120) ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS RowNumber 
FROM tblTransaction AS U)

SELECT U.RowNumber FROM Numbers AS U
LEFT JOIN tblTransaction AS T
ON U.RowNumber = T.EmployeeNumber
WHERE T.EmployeeNumber IS NULL
ORDER BY U.RowNumber
GO

-- Below is the entire Dynamic list of limited employee numbers that are not used in Transaction
WITH Numbers AS (
SELECT TOP(SELECT MAX(EmployeeNumber) FROM tblTransaction) ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS RowNumber 
FROM tblTransaction AS U)

SELECT U.RowNumber FROM Numbers AS U
LEFT JOIN tblTransaction AS T
ON U.RowNumber = T.EmployeeNumber
WHERE T.EmployeeNumber IS NULL
ORDER BY U.RowNumber
GO

SELECT ROW_NUMBER() OVER(ORDER BY(SELECT NULL)) FROM sys.objects 0 CROSS JOIN sys.objects P)