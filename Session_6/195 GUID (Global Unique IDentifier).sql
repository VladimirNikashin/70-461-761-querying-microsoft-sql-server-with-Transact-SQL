DECLARE @newvalue AS UNIQUEIDENTIFIER --GUID Global Unique IDentifier its similar to a serial UID In C# or JAVA
SET @newvalue = NEWID()
SELECT @newvalue AS TheNewId
GO

DECLARE @randomnumberGenerator INT =  DATEPART(MILLISECOND,SYSDATETIME())
									 +1000*(DATEPART(SECOND,SYSDATETIME())
                                     +60*(DATEPART(MINUTE,SYSDATETIME())
									 +60*DATEPART(HOUR,SYSDATETIME())))
SELECT RAND(@randomnumbergenerator) AS RandomNumber;

BEGIN TRANSACTION
CREATE TABLE tblEmployee4
(UniqueID UNIQUEIDENTIFIER CONSTRAINT df_tblEmployee4_UNIQUEID DEFAULT NEWSEQUENTIALID(),
EmployeeNumber int CONSTRAINT uq_tblEmployee4_EmployeeNumber UNIQUE)

INSERT INTO tblEmployee4(EmployeeNumber)
VALUES (1), (2), (3)
SELECT * FROM tblEmployee4
ROLLBACK TRANSACTION