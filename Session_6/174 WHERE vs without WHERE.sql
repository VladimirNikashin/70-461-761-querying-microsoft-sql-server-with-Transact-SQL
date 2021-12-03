SELECT * FROM tbltransaction as T
INNER JOIN (SELECT * FROM tblEmployee
WHERE EmployeeLastName LIKE 'y%') AS E
ON E.EmployeeNumber = T.EmployeeNumber
ORDER BY T.EmployeeNumber

SELECT * FROM tbltransaction as T
INNER JOIN tblEmployee AS E	
ON E.EmployeeNumber = T.EmployeeNumber
WHERE E.EmployeeLastNAme LIKE 'y%'
ORDER BY T.EmployeeNumber
GO

SELECT * FROM tbltransaction as T			-- Takes all Rows from tbltransaction and joins them
LEFT JOIN (SELECT * FROM tblEmployee		-- With the Derived table that is made inside this subquery. But it will keep all Rows From tblTransaction because it is a Left Join
WHERE EmployeeLastName LIKE 'y%') AS E		
ON E.EmployeeNumber = T.EmployeeNumber		-- There is no outer Where clause so the Results are not limited
ORDER BY T.EmployeeNumber

SELECT * FROM tbltransaction as T	-- SELECT the totality of tblTransaction
LEFT JOIN tblEmployee AS E			-- with Everything thats the same inside tblEmployee
ON E.EmployeeNumber = T.EmployeeNumber
WHERE E.EmployeeLastNAme LIKE 'y%'	-- Lastly it limits the Results 
ORDER BY T.EmployeeNumber
GO

SELECT * FROM tblTransaction AS T	-- SELECT the totality of tblTransaction
LEFT JOIN tblEmployee AS E			-- with Everything thats the same inside tblEmployee
ON E.EmployeeNumber = T.EmployeENumber
AND E.EmployeeLastName LIKE 'y%'	-- And joins it all based on the EmployeeLastNaem starting with a y but it keeps all rows inside tblTransaction because there is no limit.
ORDER BY T.EmployeeNumber