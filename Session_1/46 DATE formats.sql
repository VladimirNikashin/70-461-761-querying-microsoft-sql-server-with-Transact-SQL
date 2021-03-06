DECLARE @mydate AS datetime = '2020-06-24 12:34:56.124'
SELECT @mydate AS MyDate

DECLARE @mydate2 AS datetime2(3) = '20200624 12:34:56.124'
SELECT @mydate2 as MyDate2

SELECT DATEFROMPARTS(2015,06,24) AS ThisDate
SELECT DATETIME2FROMPARTS(2015,06,24,12,34,56,124,5)AS ThatDate
SELECT YEAR(@mydate) AS MyYear, MONTH(@mydate) AS myMonth, DAY(@mydate) AS myDay
SELECT 'END_____________________________________________________________________'
GO

SELECT CURRENT_TIMESTAMP AS RightNow
SELECT GETDATE() AS GetDateRightNow
SELECT SYSDATETIME() AS SystemDateRightNow
SELECT DATEADD(YEAR,1,'2020-01-02 03:04:05') AS myYear
SELECT DATEPART(HOUR,'2020-01-02 03:04:05') AS myHOUR
SELECT DATENAME(WEEKDAY, GETDATE()) AS GetMyDateName
SELECT DATEDIFF(SECOND,'2020-01-02 03:04:05', getdate()) as SecondsElapsed