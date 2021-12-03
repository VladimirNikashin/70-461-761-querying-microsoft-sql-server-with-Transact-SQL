ALTER TABLE tblEmployee
ADD Department VARCHAR(10);

SELECT * FROM tblEmployee

INSERT INTO tblEmployee VALUES(132,'Dylan','A','Word','HG5137770','1992-09-14','Customer Relations');
GO

ALTER TABLE tblEmployee
DROP COLUMN Department
GO

ALTER TABLE tblEmployee
ADD Department VARCHAR(15);
GO

ALTER TABLE tblEmployee
ALTER COLUMN Department VARCHAR(20);
GO

INSERT INTO tblEmployee(
[EmployeeNumber],
[EmployeeFirstName],
[EmployeeMiddleName],
[EmployeeLastName],
[EmployeeGovernmentID],
[DateOfBirth],
[Department]) 
VALUES(
132,
'Dylan',
'A',
'Word',
'HG5137770',
'1992-09-14',
'Customer Relations'
);

SELECT * FROM tblEmployee