-- To Change the date which the data was entered set the time and date of the pc and enter run the query to enter the data
-- To create a temporal table
-- Create the table
-- Create 2 columns with dates in them
-- Create a Period for the system time which references the 2 dated columns
-- And lastly outside of the create table block set the system Versioning on

CREATE TABLE [dbo].[tblEmployeeTemporal]
(
[EmployeeNumber] INT NOT NULL PRIMARY KEY CLUSTERED,
[EmployeeFirstName] VARCHAR(50) NOT NULL,
[EmployeeMiddleName] VARCHAR(50) NULL,
[EmployeeLastName] VARCHAR(50) NOT NULL,
[EmployeeGovernmentID] char(10) NOT NULL,
[DateOfBirth] DATE NOT NULL, 
[Department] VARCHAR(19) NULL,
[ValidFrom] DATETIME2(2) GENERATED ALWAYS AS ROW START,
[ValidTo] DATETIME2(2) GENERATED ALWAYS AS ROW END,
PERIOD FOR SYSTEM_TIME (ValidFrom, ValidTo))
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.tblEmployeeHistory))
GO

INSERT INTO [dbo].[tblEmployeeTemporal](
[EmployeeNumber], [EmployeeFirstName], [EmployeeMiddleName], [EmployeeLastName], [EmployeeGovernmentId], [DateOfBirth], [Department]
)VALUES (123, 'Jane', NULL, 'Zwilling', 'AB123456G', '1985-01-01', 'Customer Relations'),
		(124, 'Carolyn', 'Andrea', 'Zimmerman', 'AB234578H', '1975-06-01', 'Commercial'),
		(125, 'Jane', NULL, 'Zabokritski', 'LUT778728T', '1977-12-09', 'Commercial'),
		(126, 'Ken', 'J', 'Yukish', 'PO201903O', '1969-12-27', 'HR'),
		(127, 'Terri', 'Lee', 'Yu', 'ZH206496W', '1986-11-14', 'Customer Relations'),
		(128, 'Roberto', NULL, 'Young', 'EH793082D', '1967-04-05', 'Customer Relations')
GO

SELECT * FROM dbo.tblEmployeeTemporal
GO

UPDATE [dbo].[tblEmployeeTemporal] SET EmployeeLastName = 'SMITH' WHERE EmployeeNumber = 124
UPDATE [dbo].[tblEmployeeTemporal] SET EmployeeLAstNAme = 'ALBERT' WHERE EmployeeNumber = 124

-- To Drop a Temporal table to the following.
ALTER TABLE [dbo].[tblEmployeeTemporal] SET ( SYSTEM_VERSIONING = OFF  )
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblEmployeeTemporal]') AND type in (N'U'))
DROP TABLE [dbo].[tblEmployeeTemporal]
GO

-- Be mindful that this hidden table needs to be dropped aswell.
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblEmployeeHistory]') AND type in (N'U'))
DROP TABLE [dbo].[tblEmployeeHistory]
GO