BEGIN TRANSACTION
MERGE TOP (5) PERCENT INTO tblTransaction as T --DML (Data Manipulation Language)
USING (select EmployeeNumber, DateOfTransaction, sum(Amount) as Amount
from tblTransactionNew
group by EmployeeNumber, DateOfTransaction) as S
ON T.EmployeeNumber = S.EmployeeNumber AND T.DateOfTransaction = S.DateOfTransaction
WHEN MATCHED AND T.Amount + S.Amount >0 THEN
    UPDATE SET Amount = T.Amount + S.Amount, Comment = 'Updated Row'
WHEN MATCHED THEN
	DELETE
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Amount], [DateOfTransaction], [EmployeeNumber], Comment)
	VALUES (S.Amount, S.DateOfTransaction, S.EmployeeNumber, 'Inserted Row')
WHEN NOT MATCHED BY SOURCE THEN
	UPDATE SET Comment = 'Unchanged'
OUTPUT inserted.*, deleted.* , $action;
--Select * from tblTransaction ORDER BY EmployeeNumber, DateOfTransaction
ROLLBACK TRANSACTION
GO

SELECT EmployeeNumber, DateOfTransaction, SUM(Amount) AS TotalAmount 
FROM tblTransaction
GROUP BY EmployeeNumber, DateOfTransaction
HAVING COUNT(*)>1
GO

DISABLE TRIGGER [TR_tblTransaction] ON tblTransaction -- If you want to Disable the Trigger
GO

ENABLE TRIGGER [TR_tblTransaction] ON tblTransaction -- If you want to enable Trigger
GO