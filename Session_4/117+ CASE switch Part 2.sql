SELECT TOP 1000 [EmployeeNumber],
		[EmployeeFirstName],
		[EmployeeMiddleName],
		[EmployeeLastName],
		[EmployeeGovernmentID],
		[DateOfBirth],
		[Department],
		CASE WHEN LEFT (EmployeeGovernmentID,1)='A' THEN 'Letter A'
		 WHEN LEFT(EmployeeGovernmentId,1)='B' THEN 'Letter B'
		 ELSE 'Neither Letter' END + '.' AS MyColumn
FROM [70-461].[DBO].[tblEmployee]

SELECT TOP 1000 [EmployeeNumber],
		[EmployeeFirstName],
		[EmployeeMiddleName],
		[EmployeeLastName],
		[EmployeeGovernmentID],
		[DateOfBirth],
		[Department],
		CASE WHEN LEFT (EmployeeGovernmentID,1)='A' THEN 'Letter A'
		 WHEN EmployeeNumber<200 THEN 'Less than 200'
		 ELSE 'Neither Letter' END + '.' AS MyColumn
FROM [70-461].[DBO].[tblEmployee]

SELECT TOP 1000 [EmployeeNumber],
		[EmployeeFirstName],
		[EmployeeMiddleName],
		[EmployeeLastName],
		[EmployeeGovernmentID],
		[DateOfBirth],
		[Department],
		CASE WHEN LEFT (EmployeeGovernmentID,1)='A' AND EmployeeNumber<200 THEN 'Letter A with Less Than 200'
		 WHEN EmployeeNumber<400 THEN 'Less than 400'
		 ELSE 'Neither Letter' END + '.' AS MyColumn
FROM [70-461].[DBO].[tblEmployee]