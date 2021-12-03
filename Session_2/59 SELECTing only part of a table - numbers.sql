SELECT * FROM tblEmployee WHERE EmployeeNumber > 200

SELECT * FROM tblEmployee WHERE not EmployeeNumber > 200

SELECT * FROM tblEmployee WHERE not EmployeeNumber != 200

SELECT * FROM tblEmployee WHERE EmployeeNumber >= 200 and EmployeeNumber<=209

SELECT * FROM tblEmployee WHERE not (EmployeeNumber >= 200 and EmployeeNumber<=209)

SELECT * FROM tblEmployee WHERE EmployeeNumber<200 or EmployeeNumber>209

SELECT * FROM tblEmployee WHERE EmployeeNumber between 200 and 209

SELECT * FROM tblEmployee WHERE EmployeeNumber not between 200 and 209

SELECT * FROM tblEmployee WHERE EmployeeNumber in (200,2,208)
