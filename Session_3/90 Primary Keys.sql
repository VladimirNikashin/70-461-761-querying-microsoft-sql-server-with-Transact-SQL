ALTER TABLE tblEmployee
ADD CONSTRAINT PK_tblEmployee PRIMARY KEY (EmployeeNumber)						-- Primary Key Sorts data contents and makes a specific coloumn Unique

INSERT INTO tblEmployee (EmployeeNumber, EmployeeFirstName, EmployeeMiddleName, EmployeeLastName, EmployeeGovernmentID, DateOfBirth, Department)
VALUES (2004,'firstName', 'middleName', 'lastName', 'AB12345FH', '2010-01-01', 'Accounts')

DELETE FROM tblEmployee
WHERE EmployeeNumber = 2004

ALTER TABLE tblEmployee
DROP CONSTRAINT PK_tblEmployee

CREATE TABLE tblEmployee2(
	EmployeeNumber INT CONSTRAINT PK_tblEmployee2 PRIMARY KEY IDENTITY(1,1),	-- Automatically numbers new rows
	EmployeeName nvarchar(20)
)

INSERT INTO tblEmployee2 VALUES('A Name'),
('A Name')

SELECT * FROM tblEmployee2

DELETE FROM tblEmployee2

TRUNCATE TABLE tblEmployee2

INSERT INTO tblEmployee2(EmployeeNumber, EmployeeName) VALUES(1, 'My Name'), (2, 'My Name')

SET IDENTITY_INSERT tblEmployee2 ON

INSERT INTO tblEmployee2(EmployeeNumber, EmployeeName) VALUES(38, 'A Name'), (39, 'My Name')

SET IDENTITY_INSERT tblEmployee2 OFF

SELECT @@IDENTITY
SELECT SCOPE_IDENTITY()

SELECT IDENT_CURRENT('dbo.tblEmployee2')

DROP TABLE tblEmployee2