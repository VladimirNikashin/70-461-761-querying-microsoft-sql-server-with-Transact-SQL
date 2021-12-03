DECLARE @mystinyvar AS tinyint = 2; -- Create variable does not support negative numbers

DECLARE @mysmallvar AS smallint = 2; -- Create variable that accepts negatives math operations

SET @mysmallvar = 3; -- Assigning new Value to variable

SET @mysmallvar = @mysmallvar + 5; -- Increasing Variable

SELECT @mysmallvar AS myVariable; -- Retrieve said value

-- Bigint greater than int
-- tinyint = 0 to 255
-- smallint = -32767 to 32768
-- int -1.999.999.999 to 2.000.000.000