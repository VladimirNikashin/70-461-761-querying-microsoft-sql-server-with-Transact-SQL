BEGIN TRANSACTION
MERGE INTO tblTransaction as T
USING (SELECT EmployeeNumber, DateOfTransaction, SUM(Amount) AS Amount 
FROM tblTransaction
GROUP BY EmployeeNumber, DateOfTransaction) AS S
ON T.EmployeeNumber = S.EmployeeNumber AND T.DateOfTransaction = S.DateOfTransaction
WHEN MATCHED THEN
    UPDATE SET Amount = T.Amount + S.Amount
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Amount], [DateOfTransaction], [EmployeeNumber])
	VALUES (S.Amount, S.DateOfTransaction, S.EmployeeNumber)
OUTPUT inserted.*;
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