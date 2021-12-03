DECLARE @myvar as int

DECLARE @mystring as nvarchar(20)
SELECT datalength(@mystring) as myString

declare @mydecimal decimal (5,2)
SELECT TRY_CONVERT(decimal(5,2),1000)
GO