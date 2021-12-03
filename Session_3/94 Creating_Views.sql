 SELECT 1
 GO
 
CREATE VIEW ViewByDepartment as -- Only works with a GO keyword after and or before the statementat. And only works without an ORDER BY Statement
SELECT D.Department, T.EmployeeNumber, T.DateOfTransaction, T.Amount AS TotalAmount
FROM tblDepartment AS D
LEFT JOIN tblEmployee AS E
ON D.Department = E.Department
LEFT JOIN tblTransaction AS T
ON E.EmployeeNumber = T.EmployeeNumber
WHERE T.EmployeeNumber BETWEEN 120 AND 139
--ORDER BY D.Department, T.EmployeeNumber
GO

CREATE VIEW ViewSummary AS
SELECT D.Department, T.EmployeeNumber AS EmpNum, SUM(T.Amount) AS TotalAmount
FROM tblDepartment AS D
LEFT JOIN tblEmployee AS E
ON D.Department = E.Department
LEFT JOIN tblTransaction AS T
ON E.EmployeeNumber = T.EmployeeNumber
GROUP BY D.Department, T.EmployeeNumber
--ORDER BY D.Department, T.EmployeeNumber
GO

SELECT * FROM ViewByDepartment
SELECT * FROM ViewSummary