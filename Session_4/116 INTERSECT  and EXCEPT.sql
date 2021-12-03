SELECT *, ROW_NUMBER() OVER(ORDER BY (SELECT NULL)) % 3 as ShouldIDelete
--into tblTransactionNew
FROM tblTransaction

delete FROM tblTransactionNew
WHERE ShouldIDelete = 1

update tblTransactionNew
set DateOfTransaction = DATEADD(DAY,1,DateOfTransaction)
WHERE ShouldIDelete = 2

ALTER TABLE tblTransactionNew
DROP COLUMN ShouldIDelete

SELECT * FROM tblTransaction -- 2496 rows
EXCEPT -- Brings back anything that exists in the second table that deos not exist in the first table 
SELECT * FROM tblTransactionNew -- 2496 rows

SELECT * FROM tblTransaction -- 2496 rows
INTERSECT -- Brings back anything that exists in both tables
SELECT * FROM tblTransactionNew -- 2496 rows

-- ORDER BY goes at the end after --EXCEPT--INTERSECT--UNION--UNION all

SELECT DISTINCT EmployeeFirstName from [dbo].[tblEmployee] where [EmployeeFirstName] like 'Y%'
INTERSECT
SELECT DISTINCT EmployeeFirstName from [dbo].[tblEmployee] where [EmployeeFirstName] like 'YA%'