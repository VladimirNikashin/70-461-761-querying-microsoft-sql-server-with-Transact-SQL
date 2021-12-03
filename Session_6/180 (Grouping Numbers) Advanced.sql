WITH Numbers AS (
SELECT TOP(SELECT MAX(EmployeeNumber) FROM tblTransaction) ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS RowNumber 
FROM tblTransaction AS U),
Transaction2014 as (
SELECT * FROM tblTransaction WHERE DateOfTransaction >='2014-01-01' AND DateOfTransaction < '2015-01-01')

SELECT U.RowNumber, 
	RowNumber - LAG(RowNumber) OVER(ORDER BY RowNumber)AS PreviousRowNumber, 
	LEAD(RowNumber) OVER (ORDER BY RowNumber) - RowNumber AS NextRowNumber,
	CASE WHEN RowNumber - LAG(RowNumber) OVER(ORDER BY Rownumber) = 1 THEN 0 ELSE 1 END AS GroupGap
FROM Numbers AS U
LEFT JOIN Transaction2014 AS T
ON U.RowNumber = T.EmployeeNumber
WHERE T.EmployeeNumber IS NULL
ORDER BY U.RowNumber
GO

WITH Numbers AS (
SELECT TOP(SELECT MAX(EmployeeNumber) FROM tblTransaction) ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS RowNumber 
FROM tblTransaction AS U),
Transaction2014 as (
SELECT * FROM tblTransaction WHERE DateOfTransaction >='2014-01-01' AND DateOfTransaction < '2015-01-01'),
tblGap as(

SELECT U.RowNumber, 
	RowNumber - LAG(RowNumber) OVER(ORDER BY RowNumber)AS PreviousRowNumber, 
	LEAD(RowNumber) OVER (ORDER BY RowNumber) - RowNumber AS NextRowNumber,
	CASE WHEN RowNumber - LAG(RowNumber) OVER(ORDER BY Rownumber) = 1 THEN 0 ELSE 1 END AS GroupGap
FROM Numbers AS U
LEFT JOIN Transaction2014 AS T
ON U.RowNumber = T.EmployeeNumber
WHERE T.EmployeeNumber IS NULL), tblGroup as (
SELECT *,  SUM (GroupGap) OVER (ORDER BY RowNumber) AS TheGroup
FROM tblGap)
SELECT MIN(RowNumber) AS StartingEmployeeNumber, MAX(RowNumber) AS EndingEmployeeNumber,
		MAX(RowNumber) - MIN(RowNumber) + 1 as NumberEmployees
FROM tblGroup
GROUP BY TheGroup
ORDER BY TheGroup
GO