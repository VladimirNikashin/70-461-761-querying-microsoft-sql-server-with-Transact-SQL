DECLARE @firstname AS nvarchar(15)
DECLARE @middlename AS nvarchar(15)
DECLARE @lastname AS nvarchar(15)

SET @firstname = 'John'
SET @middlename = 'Walker'
SET @lastname = 'Smith'

SELECT @firstname + IIF(@middlename is null,'', ' ' + @middlename) + ' ' + @lastname AS FullName
SELECT @firstname + CASE WHEN @middlename is null THEN '' ELSE ' ' + @middlename END + ' ' + @lastname AS FullName
SELECT @firstname + COALESCE(' ' + @middlename,'') + ' ' + @lastname as FullName

SELECT CONCAT(@firstname,' '+ @middlename, ' ',@lastname) AS FullName