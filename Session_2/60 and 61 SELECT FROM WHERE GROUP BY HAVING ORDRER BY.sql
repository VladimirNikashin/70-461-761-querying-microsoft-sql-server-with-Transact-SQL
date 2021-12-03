SELECT * FROM tblEmployee WHERE DateOfBirth BETWEEN '1976-01-01' and '1986-12-30'

SELECT * FROM tblEmployee WHERE DateOfBirth >= '1976-01-01' and DateOfBirth < '1986-12-30'

SELECT * FROM tblEmployee WHERE year(DateOfBirth) between 1976 and 1986 -- NOT Recommended to use

SELECT year(DateOfBirth) AS YearDateOfBirth, count(*) AS NumberBorn
FROM tblEmployee 
GROUP BY year(DateOfBirth)

SELECT * FROM tblEmployee
WHERE year(DateOfBirth) = 1967


-- The following is Non deterministic... meaning if used on a massive database it will not return in the same order
SELECT year(DateOfBirth) AS YearDateOfBirth, count(*) AS NumberBorn
FROM tblEmployee 
WHERE 1=1
GROUP BY year(DateOfBirth)
--______________________________________________________________________________________________________________

SELECT left(EmployeeLastName,1) AS Initial, count(*) as CountOfInitial 
FROM tblEmployee 
GROUP BY left(EmployeeLastName,1)
ORDER BY count(*) DESC -- or you can use    left(EmployeeLastName,1)

SELECT top(5) left(EmployeeLastName,1) AS Initial, count(*) as CountOfInitial 
FROM tblEmployee 
GROUP BY left(EmployeeLastName,1)
ORDER BY count(*) DESC

SELECT left(EmployeeLastName,1) AS Initial, count(*) as CountOfInitial 
FROM tblEmployee
WHERE DateOfBirth > '1986-01-01'
GROUP BY left(EmployeeLastName,1)
HAVING count(*)>=20
ORDER BY CountOfInitial DESC

SELECT left(EmployeeLastName,1) AS Initial, count(*) as CountOfInitial 
FROM tblEmployee 
WHERE DateOfBirth > '1986-01-01'