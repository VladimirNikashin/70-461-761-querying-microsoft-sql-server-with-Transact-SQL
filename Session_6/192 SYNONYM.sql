CREATE SYNONYM EmployeeTable
FOR tblEmployee
GO

SELECT * FROM EmployeeTable

CREATE SYNONYM DateTable
FOR tblDate
GO

SELECT * FROM DateTable

CREATE SYNONYM RemoteTable -- The word for reference
FOR OVERTHERE.70-461 REMOTE.dbo.tblRemote -- synonyms take statements like these with all the dots and turns them into a short word for reference
GO

SELECT * FROM RemoteTable