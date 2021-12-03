ALTER TABLE tblTransaction
ADD CONSTRAINT chkAmount CHECK (Amount >-1000 and Amount < 1000) -- The check limits the amount to 1000.

INSERT INTO tblTransaction VALUES (1010, '2014-01-01', 1) -- This wont work because the CONSTRAINT chkAmount limits the value to 1000

ALTER TABLE tblEmployee WITH NOCHECK -- look though the table without applying a check to already existing rows
ADD CONSTRAINT chkMiddleName CHECK
(REPLACE(EmployeeMiddleName, '.','') = EmployeeMiddleName OR EmployeeMiddleName IS NULL)

ALTER TABLE tblEmployee
DROP CONSTRAINT chkMiddleName

BEGIN TRANSACTION
	INSERT INTO tblEmployee
	VALUES (2003,'A', 'B.', 'C', 'D', '2115-01-01','Accounts')
	SELECT * FROM tblEmployee WHERE EmployeeNumber = 2003
ROLLBACK TRANSACTION

ALTER TABLE tblEmployee WITH NOCHECK
ADD CONSTRAINT chkDateOfBirth CHECK (DateOfBirth BETWEEN '1900-01-01' AND GETDATE())	-- Lmits the date so that people cant be born in the future dates today.

BEGIN TRANSACTION
  INSERT INTO tblEmployee
  VALUES (2003, 'A', 'B', 'C', 'D', '2115-01-01', 'Accounts')
  SELECT * FROM tblEmployee WHERE EmployeeNumber = 2003
ROLLBACK TRANSACTION

CREATE TABLE tblEmployee2
(EmployeeMiddleName VARCHAR (50) null, CONSTRAINT CK_EmployeeMidName CHECK(
REPLACE(EmployeeMiddleName,'.','') = EmployeeMiddleName OR EmployeeMiddleName IS NULL))

DROP table tblEmployee2

ALTER TABLE tblEmployee
DROP chkDateOfBirth
ALTER TABLE tblEmployee
DROP chkMiddleName
ALTER TABLE tblTransaction
DROP chkAmount