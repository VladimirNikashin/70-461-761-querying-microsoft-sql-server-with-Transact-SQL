DECLARE @myvar smallint = 0;	-- Create variable that accepts no more than 32767 but no furtther
SET @myvar = 20000;				-- Assign it to value 20000
SELECT @myvar;					-- Return Value
GO

DECLARE @myvar smallint = 0;
SET @myvar = 200000;			-- Purposefully Assign a vlaue that will not work
SELECT @myvar;
GO

DECLARE @myvar int = 0;
SET @myvar = 200000;			-- Fix the issue
SELECT @myvar;
GO

DECLARE @myvar tinyint = 0;
SET @myvar = 20000;				-- Change value back to 20000 along with a data type that will not accept such a high value
SELECT @myvar;
GO

