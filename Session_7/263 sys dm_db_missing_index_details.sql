SELECT * FROM dm_db_index_physical_stats(db_id('70-461S7'),object_id('dbo.tblEmployee')
, NULL, NULL, 'DETAILED')

SELECT * FROM
sys.dm_db_index_physical_stats(NULL,NULL,NULL, NULL,'DETAILED') -- This has 5 parameters such as database, object, index, partition and the scan mode