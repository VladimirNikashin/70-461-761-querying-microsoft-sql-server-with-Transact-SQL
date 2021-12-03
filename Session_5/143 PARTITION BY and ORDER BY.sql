SELECT A.EmployeeNumber, A.AttendanceMonth, A.NumberAttendance,
SUM (A.NumberAttendance) OVER(PARTITION BY A.EmployeeNumber) AS TotalAttendance, -- PARTITION BY reduces the Data that Sum can look at. Instead of feeding SUM the entire data of the table after the where clause it now, for each row it only gets the data for that particular EmployeeNumber.
CONVERT(DECIMAL(18,7),A.NumberAttendance) / SUM (A.NumberAttendance) OVER(PARTITION BY A.EmployeeNumber) * 100.0000 AS PercentageAttendance  
FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber = A.EmployeeNumber

-- There are no commas in the over clause

WHERE A.AttendanceMonth < '20150101'
GO

SELECT A.EmployeeNumber, A.AttendanceMonth, A.NumberAttendance,
SUM (A.NumberAttendance) OVER(PARTITION BY A.EmployeeNumber ORDER BY AttendanceMonth) AS TotalAttendance 
FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber = A.EmployeeNumber

WHERE A.AttendanceMonth < '20150101'
GO

SELECT A.EmployeeNumber, A.AttendanceMonth, A.NumberAttendance,
SUM (A.NumberAttendance) OVER(PARTITION BY A.EmployeeNumber, YEAR(A.AttendanceMonth) ORDER BY AttendanceMonth) AS RunningTotalAttendance 
FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber = A.EmployeeNumber

-- Commas tell us that there are 2 PARTITION BY clause
-- Partition is kind of like saying restart when
-- Partition only takes into account the rows that have the same EmployeeNumber and the same year

WHERE A.AttendanceMonth < '20150101'
GO