--DECLARE @mydate AS DATETIME = '2020-06-25 01:02:03.456'
--SELECT 'The date and time is: ' + @mydate
--GO

DECLARE @mydate AS DATETIME ='2020-06-25 01:02:03.456'
SELECT 'The date and time is: ' + CONVERT(nvarchar(20),@mydate) AS MyConverteddDate
GO

DECLARE @mydate as DATETIME ='2020-06-25 01:02:03.456'
SELECT CAST(@mydate AS nvarchar(20)) AS MyCastDate

SELECT CONVERT(date, 'Thursday, 25 June 2020') AS MyConvertedDate
SELECT PARSE('Thursday, 25 June 2020' AS date) AS MyParsedDate
SELECT PARSE ('Jueves,25 de Junie de 2020' AS date) AS MySpanishedParsedDate

SELECT FORMAT(CAST('2020-06-25 01:02:03.456' AS datetime),'D') AS MyFormattedDate
SELECT FORMAT(CAST('2020-06-25 01:02:03.456' AS datetime),'D') AS MyFormattedShortDate