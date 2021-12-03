--DECLARE @mydate AS DATETIME = '2020-06-25 01:02:03.456'
--SELECT 'The date and time is: ' + @mydate
--GO

DECLARE @mydate AS DATETIME ='2020-06-25 01:02:03.456'
SELECT 'The date and time is: ' + CONVERT(nvarchar(20),@mydate) AS MyConverteddDate
GO

DECLARE @mydate as DATETIME ='2020-06-25 01:02:03.456'
SELECT CAST(@mydate AS nvarchar(20)) AS MyCastDate

--SELECT CONVERT(date, 'Thursday, 25 June 2020') AS MyConvertedDate
SELECT PARSE('Thursday, 25 June 2020' as date) AS MyParsedDate
SELECT FORMAT(CAST('2020-06-25 01:02:03.456' as datetime),'D','es-ES') AS MyFormattedInternationalLongDate

SELECT FORMAT(CAST('2020-06-25 01:02:03.456' as datetime),'D') AS MyFormattedLongDate
SELECT FORMAT(CAST('2020-06-25 01:02:03.456' as datetime),'d') AS MyFormattedShortDate
SELECT FORMAT(CAST('2020-06-25 01:02:03.456' as datetime),'dd-mm-yyyy') AS MyFormattedBritishDate
SELECT FORMAT(CAST('2020-06-25 01:02:03.456' as datetime),'D') AS MyFormattedInternationalLongDate