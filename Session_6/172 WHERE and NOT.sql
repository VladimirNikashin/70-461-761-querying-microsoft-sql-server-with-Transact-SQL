SELECT T.*
FROM tblTransaction AS T
INNER JOIN tblEmployee AS E
ON E.EmployeeNumber = T.EmployeeNumber
WHERE E.EmployeeLastNAme NOT LIKE 'y%'
ORDER BY T.EmployeeNumber
GO
-- If you want to do the same thing without the join look below
SELECT *
FROM tblTransaction AS T
WHERE EmployeeNumber IN
(SELECT EmployeeNumber FROM tblemployee WHERE EmployeeLastName NOT LIKE 'y%') -- Everything that does not start with y and limits everything to the results in tblEmployee
ORDER BY EmployeeNumber														  -- This Block is the same as an INNER JOIN
GO

SELECT *
FROM tblTransaction AS T
WHERE EmployeeNumber NOT IN -- This does not limit the results because its not in the sub query.
(SELECT EmployeeNumber FROM tblemployee WHERE EmployeeLastName LIKE 'y%') -- Show everything Except all the rows that the Subquery references
ORDER BY EmployeeNumber													  -- This block is the same as a LEFT JOIN