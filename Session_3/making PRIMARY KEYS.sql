ALTER TABLE tblEmployee
ADD CONSTRAINT PK_tblEmployee PRIMARY KEY (EmployeeNumber) -- By Default this key is Clustered... Meaning the table is sorted by this key

ALTER TABLE tblEmployee
ADD CONSTRAINT PK_tblEmployee PRIMARY KEY NONCLUSTERED (EmployeeNumber) -- This PRIMARY KEY is NONCLUSTERED... meaning it wont be sorted by the this key.

CREATE TABLE tblEmployee2
(EmployeeNumber int CONSTRAINT PK_tblEmployee2 PRIMARY KEY IDENTITY(1,1), -- This automatically numbers new rows, The first number is the starting number and the second is how much the row goes up by with each new insert.
EmployeeName nvarchar(20)
)

SET IDENTITY_INSERT tblEmployee2 ON
INSERT INTO tblEmployee2(EmployeeNumber, EmployeeName) VALUES (38,'A Name'),(39,'A Name')
SET iDENTITY_INSERT tblEmployee2 OFF

SELECT @@IDENTITY --This returns the last identity that was used in the last Table that was used
SELECT SCOPE_IDENTITY() -- This returns the last used identity in a Scope or Function in the last table that was used.

SELECT IDENT_CURRENT('dbo.tblEmployee2') -- This gives the last used identity for a particular Table
