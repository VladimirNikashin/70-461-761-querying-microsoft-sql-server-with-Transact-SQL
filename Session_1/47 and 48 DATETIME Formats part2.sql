DECLARE @myDateOffset AS DATETIMEOFFSET = '2020-06-25 01:02:03.456 +05:30' --8-10 bytes
SELECT @myDateOffset AS myDateOffset
GO

DECLARE @myDate AS DATETIME2 = '2020-06-25 01:02:03.456'
SELECT TODATETIMEOFFSET(@myDate, '+05:30') AS MyDateOffset

SELECT DATETIME2FROMPARTS(2020,06,25,1,2,3,456,3) AS MyDateFromParts2Offset
SELECT DATETIMEOFFSETFROMPARTS(2020,06,25,1,2,3,456,5,30,3) AS MyDateOffset

SELECT SYSDATETIMEOFFSET() AS TimeNowWithOffset
SELECT SYSUTCDATETIME() AS TimeNowUTC

DECLARE @myDateOffset AS DATETIMEOFFSET = '2020-06-25 01:02:03.456 +05:30'
SELECT SWITCHOFFSET(@myDateOffset, '-05:00') AS MyDateOffsetTexas