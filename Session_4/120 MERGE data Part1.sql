BEGIN TRANSACTION
MERGE INTO tblTransaction AS T
USING tblTransactionNew AS S
ON T.EmployeeNumber = S.EmployeeNumber AND T.DateOfTransaction = S.DateOfTransaction
WHEN MATCHED THEN 
	UPDATE SET Amount = T.Amount + S.Amount
WHEN NOT MATCHED BY TARGET THEN
	INSERT (Amount, DateOfTransaction, EmployeeNumber)
	VALUES (S.Amount, S.DateOfTransaction, S.EmployeeNumber); -- Must use Semi colon
ROLLBACK TRANSACTION

-- What was thought:
-- there would be no rows in tblTransaction -  but there would be rows in tblTransactionNew
-- That there would be 1 tblTransaction - for every other row in tblTransactionNew

-- problem is that there is 1 row in tblTransaction - With multuple rows that match it in tblTransactionNew
-- it finds multiple rows in tblTransactionNew and tries to insert them all into 1 row that is found in tblTransaction... and therefore it spits out an error. 