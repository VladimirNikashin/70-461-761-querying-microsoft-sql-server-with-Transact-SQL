BEGIN TRANSACTION
CREATE SEQUENCE newSeq AS BIGINT
START WITH 1
INCREMENT BY 1
MINVALUE 1
CACHE 50
SELECT NEXT VALUE FOR newSeq AS NextValue;
--select *, NEXT VALUE FOR newSeq OVER (ORDER BY DateOfTransaction) as NextNumber from tblTransaction
ROLLBACK TRANSACTION

CREATE SEQUENCE newSeq AS BIGINT --First create the sequence
START WITH 1
INCREMENT BY 1
MINVALUE 1
--MAXVALUE 999999
--CYCLE
CACHE 50

ALTER TABLE tblTransaction
ADD NextNumber INT CONSTRAINT DF_Transaction DEFAULT NEXT VALUE FOR newSeq -- Then add the NextNumber counter

ALTER TABLE tblTransaction
DROP DF_Transaction
ALTER TABLE tblTransaction
DROP COLUMN NextNumber

ALTER TABLE tblTransaction
ADD NextNumber INT
ALTER TABLE  tblTransaction
ADD CONSTRAINT DF_Transaction DEFAULT NEXT VALUE FOR newSeq FOR NextNumber

BEGIN TRANSACTION 
SELECT * FROM tblTransaction
INSERT INTO tblTransaction(Amount, DateOfTransaction, EmployeeNumber)
VALUES (1,'2017-01-01',123)
SELECT * FROM tblTransaction WHERE EmployeeNumber = 123;
UPDATE tblTransaction
SET NextNumber = NEXT VALUE FOR newSeq
WHERE NextNumber is null
SELECT * FROM tblTransaction --WHERE EmployeeNumber = 123
ROLLBACK TRANSACTION

--SET IDENTITY_INSERT tablename ON ....resets identity count
--DBCC CHECKIDENT(tablename,RESEED)

ALTER SEQUENCE newSeq -- resets the sequences count with from a specified starting point
RESTART WITH 1

ALTER TABLE tblTransaction -- To get rid of all the above we need to first
DROP DF_Transaction -- Remove The constraint
ALTER TABLE tblTransaction
DROP COLUMN NextNumber -- Remove the column
DROP SEQUENCE newSeq -- Then Remove the Sequence
