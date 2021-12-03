SELECT * FROM
(SELECT D.Department, EmployeeNumber, EmployeeFirstName, EmployeeLastName,
       RANK() OVER(PARTITION BY D.Department ORDER BY E.EmployeeNumber) AS TheRank
 FROM tblDepartment AS D 
 JOIN tblEmployee AS E ON D.Department = E.Department) AS MyTable
WHERE TheRank <= 5  -- SELECT top 5
ORDER BY Department, EmployeeNumber