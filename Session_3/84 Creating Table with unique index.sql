ALTER TABLE tblEmployee
ADD CONSTRAINT unqGovernmentID UNIQUE (EmployeeGovernmentID);		-- Adds a unique key
GO

ALTER TABLE tblTransaction
add CONSTRAINT unqTransaction UNIQUE (Amount, DateOfTransaction, EmployeeNumber)

DELETE FROM tblTransaction WHERE EmployeeNumber =131

INSERT INTO tblTransaction VALUES(1, '2015-01-01', 131)
INSERT INTO tblTransaction VALUES(1, '2015-01-01', 131)

ALTER TABLE tblTransaction
DROP CONSTRAINT unqTransaction

CREATE TABLE tblTransaction2(
Amount smallmoney NOT NULL,
DateOfTransaction smalldatetime NOT NULL,
EmployeeNumber INT NOT NULL,
CONSTRAINT unqTransaction2 UNIQUE (Amount,DateOfTransaction,EmployeeNumber)
)

DROP TABLE tblTransaction2