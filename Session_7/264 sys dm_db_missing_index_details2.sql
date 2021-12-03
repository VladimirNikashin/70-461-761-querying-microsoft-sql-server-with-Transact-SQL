SELECT T.*
INTO dbo.tblTransactionBigger
FROM [dbo].[tblTransaction] AS T
CROSS JOIN [dbo].[tblTransaction] AS T2

SELECT * FROM dbo.tblTransactionBigger
WHERE [EmployeeNumber] = 127

SELECT * FROM sys.dm_db_missing_index_details

SELECT mig.*, statement AS table_name, column_id, column_name, column_usage FROM sys.dm_db_missing_index_details AS mid
CROSS APPLY sys.dm_db_missing_index_columns (mid.index_handle)
INNER JOIN sys.dm_db_missing_index_groups AS mig ON mig.index_handle = mid.index_handle
WHERE database_id = db_id()

drop table dbo.tblTransactionBigger