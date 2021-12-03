SELECT EmployeeGovernmentID, COUNT(EmployeeGovernmentID) AS MyCount FROM tblEmployee
GROUP BY EmployeeGovernmentID HAVING COUNT (EmployeeGovernmentID)>1

SELECT * FROM tblEmployee WHERE EmployeeGovernmentID IN ('HN513777D', 'PY852452V')

INSERT INTO tblEmployee([EmployeeNumber], [EmployeeFirstName], [EmployeeMiddleName], [EmployeeLastName], [EmployeeGovernmentID], [DateOfBirth], [Department])
VALUES (132, 'Dylan', 'A', 'Word', 'PY852452V', '1971-05-27', 'HR');

BEGIN TRANSACTION
DELETE FROM tblEmployee WHERE EmployeeNumber < 3

DELETE TOP(1) FROM tblEmployee
WHERE EmployeeNumber in (132)

SELECT * FROM tblEmployee WHERE EmployeeGovernmentID IN ('PY852452V')

ROLLBACK TRANSACTION