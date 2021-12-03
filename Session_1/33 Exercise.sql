--EXERCISE
 SELECT system_type_id, column_id, CAST(system_type_id as decimal(4,1)) / CAST(column_id as decimal(4,1)) AS CalculationOne
 FROM sys.all_columns
 GO

 SELECT system_type_id, column_id, FLOOR(CAST(system_type_id as decimal(4,1)) / CAST(column_id as decimal(4,1))) AS CalculationTwo
 FROM sys.all_columns
 GO

SELECT system_type_id, column_id, CEILING(CAST(system_type_id as decimal(4,1)) / CAST(column_id as decimal(4,1))) AS CalculationThree
 FROM sys.all_columns
 GO

 SELECT system_type_id, column_id, ROUND(CAST(system_type_id as decimal(4,1)) / CAST(column_id as decimal(4,1)),1) AS CalculationFour
 FROM sys.all_columns
 GO

 SELECT system_type_id, column_id, TRY_CONVERT(tinyint,system_type_id * 2) AS CalculationFive
 FROM sys.all_columns
 GO