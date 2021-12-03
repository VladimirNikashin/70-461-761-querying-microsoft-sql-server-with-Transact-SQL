SELECT * FROM
(SELECT D.Department, E.Employeenumber, EmployeeFirstName, EmployeeLastName, 
	rank() OVER(PARTITION BY D.Department ORDER BY E.EmployeeNumber) AS TheRank
	FROM tblDepartment AS D
	JOIN tblEmployee AS E ON D.Department = E.Department) AS MyTable
	WHERE Therank <= 5
ORDER BY Department, EmployeeNumber
GO
-- The query Above cannot be dynamically reused.

-- Below Is a implementation of a dynamically reusable query.
WITH TblWithRanking AS
(SELECT D.Department, EmployeeNumber, EmployeeFirstName, EmployeeLastName,
	rank() OVER(PARTITION BY D.Department ORDER BY E.EmployeeNumber) AS TheRank
	FROM tblDepartment AS D
	JOIN tblEmployee AS E ON D.Department = E.Department)

	SELECT * FROM TblWithRanking
	WHERE Therank <= 5
	ORDER BY Department, EmployeeNumber
GO
--________________________________________________

-- Below Is a implementation of a dynamically reusable query with 2 tables
WITH TblWithRanking AS
(SELECT D.Department, EmployeeNumber, EmployeeFirstName, EmployeeLastName,
	rank() OVER(PARTITION BY D.Department ORDER BY E.EmployeeNumber) AS TheRank
	FROM tblDepartment AS D
	JOIN tblEmployee AS E ON D.Department = E.Department),
	Transaction2014 AS
	(SELECT * FROM tblTransaction WHERE DateOfTransaction < '2015-01-01')

	SELECT * FROM TblWithRanking LEFT JOIN Transaction2014 ON tblWithRanking.EmployeeNumber = Transaction2014.EmployeeNumber
	WHERE Therank <= 5
	ORDER BY Department, tblWithRanking.EmployeeNumber
GO