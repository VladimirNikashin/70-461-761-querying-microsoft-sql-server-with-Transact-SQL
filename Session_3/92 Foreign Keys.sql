BEGIN TRANSACTION
ALTER TABLE tblTransaction ALTER COLUMN EmployeeNumber INT NULL
ALTER TABLE tblTransaction ADD CONSTRAINT DF_tblTransaction DEFAULT 124 FOR EmployeeNumber
ALTER TABLE tblTransaction WITH NOCHECK
ADD CONSTRAINT FK_tblTransaction_EmployeeNumber FOREIGN KEY (EmployeeNumber)
REFERENCES tblEmployee(EmployeeNumber)
ON UPDATE CASCADE
ON DELETE SET DEFAULT

--UPDATE tblEmployee SET EmployeeNumber = 9123 WHERE EmployeeNumber = 123
DELETE tblEmployee WHERE EmployeeNumber = 123

SELECT E.EmployeeNumber, T.*
FROM tblEmployee as E
RIGHT JOIN tblTransaction as T
on E.EmployeeNumber = T.EmployeeNumber
WHERE T.Amount IN (-179.47, 786.22, -967.36, 957.03)

ROLLBACK TRANSACTION

--ALTER TABLE tblTransaction
--ADD CONSTRAINT FK_tblTransaction_EmployeeNumber FOREIGN KEY (EmployeeNumber)
--REFERENCES tblEmployee(EmployeeNumber)