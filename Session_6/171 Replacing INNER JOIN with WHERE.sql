SELECT T.*
FROM tblTransaction AS T
INNER JOIN tblEmployee AS E
ON E.EmployeeNumber = T.EmployeeNumber
WHERE E.EmployeeLastNAme LIKE 'y%'
ORDER BY T.EmployeeNumber

-- If you want to do the same thing without the join look below
SELECT *
FROM tblTransaction AS T
WHERE EmployeeNumber IN
(SELECT EmployeeNumber FROM tblemployee WHERE EmployeeLastName LIKE 'y%')
ORDER BY EmployeeNumber