SELECT DATENAME(month, DateOfBirth) as NameofMonth, COUNT(*) as NumberOfEmployees,
COUNT(EmployeeMiddleName) as NumberOfMiddleNames,
COUNT (*)-count(EmployeeMiddleName) as MiddleName,
format(min(DateOfBirth),'dd-MM-YY') as YoungestDateofBirth,
format(max(DateOfBirth),'D') as OldestDateOfBirth
FROM tblEmployee
GROUP BY DATENAME(MONTH,DateOfBirth), DATEPART(MONTH,DateOfBirth)
ORDER BY DATEPART(MONTH,DateOfBirth)