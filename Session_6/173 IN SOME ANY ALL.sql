SELECT * FROM tblTransaction
WHERE EmployeeNumber IN
(SELECT EmployeeNumber FROM tblEmployee WHERE EmployeeLastName like 'y%')
ORDER BY EmployeeNumber

SELECT * FROM tblTransaction
WHERE EmployeeNumber = ANY
(SELECT EmployeeNumber FROM tblEmployee WHERE EmployeeLastName like 'y%')
ORDER BY EmployeeNumber

SELECT * FROM tblTransaction
WHERE EmployeeNumber = SOME
(SELECT EmployeeNumber FROM tblEmployee WHERE EmployeeLastName like 'y%')
ORDER BY EmployeeNumber

SELECT * FROM tblTransaction
WHERE EmployeeNumber <> ANY -- Is it equal to one ocurrence in all (Bad to use this)
(SELECT EmployeeNumber FROM tblEmployee WHERE EmployeeLastName like 'y%')
ORDER BY EmployeeNumber

SELECT * FROM tblTransaction
WHERE EmployeeNumber <> ALL -- Is it equal to all
(SELECT EmployeeNumber FROM tblEmployee WHERE EmployeeLastName like 'y%')
ORDER BY EmployeeNumber