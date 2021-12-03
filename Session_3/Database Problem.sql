SELECT * FROM tblEmployee

SELECT T.EmployeeNumber as TEmployeeNumber,
		E.EmployeeNumber as EEmployeeNumber, 
		sum(Amount) as SumAmount
FROM tblTransaction AS T
LEFT JOIN tblEmployee AS E
ON T.EmployeeNumber = E.EmployeeNumber
GROUP BY T.EmployeeNumber, E.EmployeeNumber
ORDER BY EEmployeeNumber

BEGIN TRANSACTION
UPDATE tblEmployee
SET DateOfBirth = '2101-01-01'
WHERE EmployeeNumber = 537
SELECT * FROM tblEmployee ORDER BY DateOfBirth DESC
ROLLBACK TRANSACTION

BEGIN TRANSACTION
UPDATE tblEmployee
SET EmployeeGovernmentID = 'aaaa'
WHERE  EmployeeNumber BETWEEN 530 AND 539
SELECT * FROM tblEmployee ORDER BY EmployeeGovernmentID ASC
ROLLBACK TRANSACTION