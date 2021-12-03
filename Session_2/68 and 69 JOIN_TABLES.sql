SELECT EmployeeNumber, sum(amount ) AS TotalAmont 
FROM tblTransaction
GROUP BY EmployeeNumber
GO

SELECT * FROM tblEmployee
join tblTransaction 
ON tblEmployee.EmployeeNumber = tblTransaction.EmployeeNumber
GO

SELECT tblEmployee.EmployeeNumber, EmployeeFirstName, EmployeeLastName, SUM(Amount) AS SumOfAmount FROM tblEmployee
LEFT JOIN tblTransaction 
ON tblEmployee.EmployeeNumber = tblTransaction.EmployeeNumber
GROUP BY tblEmployee.EmployeeNumber, EmployeeFirstName, EmployeeLastName
ORDER BY EmployeeNumber ASC
GO

SELECT * FROM tblEmployee

SELECT * FROM tblEmployee WHERE EmployeeNumber = 1046

-- The main joins in these session projects are:
-- Left Join: returns all records from the left table and all matched rows from the right table
-- Right Join: returns all rows from the right table and unmatched rows from theleft table.
-- Cross Join: returns a paired combination of each row of the first table withe each row of the second table.

-- inner join is the default:
--it includes rows from both tables where the join conditions are met inside the on clause