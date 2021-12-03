SELECT * FROM dbo.TransList(123)
GO

SELECT *, (SELECT COUNT(*) FROM dbo.TransList(E.EmployeeNumber)) AS NumTransactions
FROM tblEmployee AS E

SELECT * FROM tblEmployee AS E
OUTER APPLY TransList(E.EmployeeNumber) AS T

SELECT * FROM tblEmployee AS E
CROSS APPLY TransList(E.EmployeeNumber) AS T

-- APPLY is used because Joins dont work with table functions such as Inline and Multi Line.
-- Its because the result that come from Inline and multi line are not like tables but more like arrays.

-- There are 2 types of apply:
-- OUTER APPLY allows to get all of tblEmployee and everything that exists in the TransList Function
-- CROSS APPLY allows us to get everything that exists in the TransList Function only.

-- OUTER APPLY is the equivalent to a LEFT JOIN
-- CROSS APPLY is the equivalent to an INNER JOIN

SELECT * FROM tblEmployee AS E
WHERE (SELECT COUNT(*) FROM dbo.TransList(E.EmployeeNumber)) > 3