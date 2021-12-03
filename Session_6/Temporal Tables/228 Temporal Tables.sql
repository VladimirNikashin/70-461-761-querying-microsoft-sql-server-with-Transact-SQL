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
WITH (SYSTEM_VERSIONING = ON)

INSERT INTO [dbo].[tblEmployeeTemporal](
[EmployeeNumber], [EmployeeFirstName], [EmployeeMiddleName], [EmployeeLastName], [EmployeeGovernmentId], [DateOfBirth], [Department]
)VALUES (123, 'Jane', NULL, 'Zwilling', 'AB123456G', '1985-01-01', 'Customer Relations'),
		(124, 'Carolyn', 'Andrea', 'Zimmerman', 'AB234578H', '1975-06-01', 'Commercial'),
		(125, 'Jane', NULL, 'Zabokritski', 'LUT778728T', '1977-12-09', 'Commercial'),
		(126, 'Ken', 'J', 'Yukish', 'PO201903O', '1969-12-27', 'HR'),
		(127, 'Terri', 'Lee', 'Yu', 'ZH206496W', '1986-11-14', 'Customer Relations'),
		(128, 'Roberto', NULL, 'Young', 'EH793082D', '1967-04-05', 'Customer Relations')

SELECT * FROM dbo.tblEmployeeTemporal

UPDATE [dbo].[tblEmployeeTemporal] SET EmployeeLastName = 'SMITH' WHERE EmployeeNumber = 124
UPDATE [dbo].[tblEmployeeTemporal] SET EmployeeLAstNAme = 'ALBERT' WHERE EmployeeNumber = 124

TRUNCATE TABLE dbo.tblEmployeeTemporal
DROP TABLE dbo.tblEmployeeTemporal