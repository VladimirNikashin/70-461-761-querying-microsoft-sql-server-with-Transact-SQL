-- IMPLICIT		Automatically converts data types
DECLARE @myvar as Decimal(5,2) = 3
SELECT @myvar
GO

-- EXPLICIT
DECLARE @myvar as Decimal(4,2) = 3
SELECT CONVERT(decimal(4,2),3)/2 AS convertedData
SELECT CAST(3 as decimal(5,2))/2 AS casterData

SELECT CONVERT(decimal(6,2),1000) AS thousandConv

SELECT 3 AS numberThree
SELECT 3/2 AS integerOfThree
SELECT 3.0/2 AS firstFraction
SELECT 3/2.0 As secondFraction

SELECT CONVERT(int,12.345) + CONVERT(int,12.6) AS decimalToInteger
SELECT CONVERT(int,12.345 + 12.7) AS AlternateDeciToInt
GO