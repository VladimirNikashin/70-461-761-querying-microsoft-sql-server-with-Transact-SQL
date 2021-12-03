ALTER TABLE tblTransaction
ADD DateOfEntry DATETIME

ALTER TABLE tblTransaction
ADD CONSTRAINT defDateOfEntry DEFAULT GETDATE() FOR DateOfEntry

INSERT INTO tblTransaction (Amount, DateOfTransaction, EmployeeNumber) VALUES (1, '2014-01-01', 1)
INSERT INTO tblTransaction (Amount, DateOfTransaction, EmployeeNumber, DateOfEntry) VALUES(2, '2014-01-02', 1,'2013-01-01')

DELETE TOP(2) FROM tblTransaction  WHERE EmployeeNumber IN (1,2)

SELECT * FROM tblTransaction WHERE EmployeeNumber < 3

CREATE TABLE tblTransaction2(Amount smallmoney NOT NULL,
DateOfTransaction smalldatetime NOT NULL,
EmployeeNumber int NOT NULL,
DateOfEntry datetime NULL CONSTRAINT tblTransaction2_defDateOfEntry DEFAULT GETDATE()
)

INSERT INTO tblTransaction2 (Amount, DateOfTransaction, EmployeeNumber) VALUES (1, '2014-01-01', 1)
INSERT INTO tblTransaction2 (Amount, DateOfTransaction, EmployeeNumber, DateOfEntry) VALUES(2, '2014-01-02', 1,'2013-01-01')

SELECT * FROM tblTransaction2 WHERE EmployeeNumber < 3

DROP TABLE tblTransaction2

ALTER TABLE tblTransaction
DROP CONSTRAINT defDateOfEntry

ALTER TABLE tblTransaction
DROP COLUMN DateOfEntry