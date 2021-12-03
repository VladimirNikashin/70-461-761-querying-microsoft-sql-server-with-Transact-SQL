SELECT A.EmployeeNumber, YEAR(A.AttendanceMonth) AS AttendanceYear, SUM(A.NumberAttendance) AS TotalAttendance
FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber = A.EmployeeNumber
GROUP BY A.EmployeeNumber, YEAR(A.AttendanceMonth)
GO

SELECT A.EmployeeNumber, A.AttendanceMonth, A.NumberAttendance,
SUM (A.NumberAttendance) OVER() AS TotalAttendance -- Over has calculated the sum over the entirety of the table 
FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber = A.EmployeeNumber

SELECT SUM (NumberAttendance) FROM tblAttendance

SELECT A.EmployeeNumber, A.AttendanceMonth, A.NumberAttendance,
SUM (A.NumberAttendance) OVER() AS TotalAttendance,
CONVERT(DECIMAL(18,7),A.NumberAttendance) / SUM (A.NumberAttendance) OVER() * 100.0000 AS PercentageAttendance  -- NumberAttendance is a smallinteger it then rounds it down to zero and 100 * 0 is still 0
FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber = A.EmployeeNumber

SELECT CONVERT (MONEY,14)/35409

-- OVER() takes a particular range of some rows and it does a calculation based on that number of over those rows.