DECLARE @myOption AS VARCHAR(10) = 'Option A'

SELECT CASE WHEN @MyOption = 'Option A' THEN 'first option' -- When My variable equals 'Option A' then output 'First Option'
			WHEN @myOption = 'Option B' THEN 'Second option'  -- When My variable equals 'Option B' then output 'Second Option'
			ELSE 'No Option' END AS MyOption -- When My variable matches non of the above then output 'No Option'
GO

DECLARE @myOption AS VARCHAR(10) = 'Option A'

SELECT CASE @myOption WHEN 'Option A' THEN 'First option'
			WHEN 'Option B' then 'Second option'
			ELSE 'No Option' END AS MyOptions
GO

DECLARE @myOption AS VARCHAR(10) = 'Option B'

SELECT CASE WHEN @MyOption = 'Option A' THEN 'first option'
			WHEN @myOption = 'Option B' THEN CONVERT(varchar(10),2)
			ELSE 'No Option' END AS MyOption
GO