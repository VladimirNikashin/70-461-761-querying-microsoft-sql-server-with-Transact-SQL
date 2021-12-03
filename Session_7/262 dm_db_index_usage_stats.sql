--DMV Dynamic Management View
--SELECT * FROM sys.dm_db_index_usage_stats
--SELECT * FROM sys.dm_db_missing_index_details
--SELECT * FROM sys.dm_db_missing_index_columns
--SELECT * FROM sys.dm_db_missing_index_groups
--SELECT * FROM sys.dm_db_index_physical_stats

SELECT db_name(database_id) AS [Database Name],
object_name(ddius.object_id) AS [Table Name],
i.name AS [Index Name],
ddius.*
FROM sys.dm_db_index_usage_stats AS ddius
JOIN sys.indexes AS i on ddius.object_id = i.object_id and ddius.index_id = i.index_id
WHERE database_id = db_id()
GO


SELECT * FROM sys.indexes -- this retrieves an id of an index

-- To retreive the database id do the following:
-- Connect to the database that you wish to use and run this query:
SELECT db_id()