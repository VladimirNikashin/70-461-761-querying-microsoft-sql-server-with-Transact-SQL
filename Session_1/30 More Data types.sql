DECLARE @myvar AS numeric(7,2); -- 7 represents the total XXXXXXX and the 2 represents XXXXX.XX
SET @myvar = 99999.99
SELECT @myvar AS myVariable
GO

DECLARE @myvar AS decimal(7,2);
SET @myvar = 12345.67
SELECT @myvar AS myVariable
GO

DECLARE @myothervar AS numeric(9,2);
SET @myothervar = 54321.7
SELECT @myothervar AS myOtherVariable
GO

DECLARE @myothervar AS decimal(9,2);
SET @myothervar = 54321.7
SELECT @myothervar AS myOtherVariable
GO

Declare @myvar AS smallmoney = 123456.78917
SELECT @myvar AS myVariable;