SELECT DepartmentHead, sum(Amount) AS SumOfAmount FROM tblDepartment 
Left JOIN tblEmployee ON tblDepartment.Department = tblEmployee.Department 
Left JOIN tblTransaction on tblEmployee.EmployeeNumber = tblTransaction.EmployeeNumber
GROUP BY DepartmentHead
ORDER BY DepartmentHead

INSERT INTO tblDepartment(Department,DepartmentHead) VALUES ('Accounts', 'James')

SELECT D.DepartmentHead, Sum(T.Amount) as SumOfAmount
FROM tblDepartment AS D
LEFT JOIN tblEmployee AS E
ON D.Department = E.Department
LEFT JOIN tblTransaction AS T
ON E.EmployeeNumber = T.EmployeeNumber
GROUP BY D.DepartmentHead
ORDER BY D.DepartmentHead