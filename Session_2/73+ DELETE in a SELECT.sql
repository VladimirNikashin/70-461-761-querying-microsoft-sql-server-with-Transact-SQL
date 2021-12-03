BEGIN TRANSACTION

SELECT count(*) FROM tblTransaction

DELETE tblTransaction 
FROM tblTransaction
WHERE EmployeeNumber IN (
SELECT TNumber FROM(
SELECT E.EmployeeNumber AS ENumber, E.EmployeeFirstName,
E.EmployeeLastName, T.EmployeeNumber AS TNumber,
Sum(T.Amount) AS TotalAmount
FROM tblEmployee AS E
RIGHT JOIN tblTransaction AS T
ON E.EmployeeNumber = T.EmployeeNumber
GROUP BY E.EmployeeNumber,T.EmployeeNumber,E.EmployeeFirstName, E.EmployeeLastName, T.Amount
) AS newTable 
WHERE ENumber IS NULL 
--ORDER BY ENumber, TNumber, EmployeeFirstName,EmployeeLastName
)

SELECT count(*) FROM tblTransaction

ROLLBACK TRANSACTION

SELECT count(*) FROM tblTransaction