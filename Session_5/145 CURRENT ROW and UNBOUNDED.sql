
-- ______________________________________________________Bound_by_numbers_________________________________________________________________

SELECT A.EmployeeNumber, A.AttendanceMonth, A.NumberAttendance,
SUM(A.NumberAttendance) OVER (PARTITION BY A.EmployeeNumber, YEAR(A.AttendanceMonth) 
ORDER BY A.AttendanceMonth rows BETWEEN 1 PRECEDING AND 1 FOLLOWING) -- PRECEDING means the previous row... FOLLOWING means the next row
AS RunningTotal FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber = A.EmployeeNumber
GO

SELECT A.EmployeeNumber, A.AttendanceMonth, A.NumberAttendance,
SUM(A.NumberAttendance) OVER (PARTITION BY A.EmployeeNumber, YEAR(A.AttendanceMonth) 
ORDER BY A.AttendanceMonth rows BETWEEN 1 PRECEDING AND 0 FOLLOWING)
AS RunningTotal FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber = A.EmployeeNumber
GO

SELECT A.EmployeeNumber, A.AttendanceMonth, A.NumberAttendance,
SUM(A.NumberAttendance) OVER (PARTITION BY A.EmployeeNumber, YEAR(A.AttendanceMonth) 
ORDER BY A.AttendanceMonth rows BETWEEN 0 PRECEDING AND 1 FOLLOWING)
AS RunningTotal FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber = A.EmployeeNumber
GO

SELECT A.EmployeeNumber, A.AttendanceMonth, A.NumberAttendance,
SUM(A.NumberAttendance) OVER (PARTITION BY A.EmployeeNumber, YEAR(A.AttendanceMonth) 
ORDER BY A.AttendanceMonth rows BETWEEN 9999 PRECEDING AND 9999 FOLLOWING) 
AS RunningTotal FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber = A.EmployeeNumber
GO


-- ______________________________________________________Unbound_by_numbers_______________________________________________________________

SELECT A.EmployeeNumber, A.AttendanceMonth, A.NumberAttendance,
SUM(A.NumberAttendance) OVER (PARTITION BY A.EmployeeNumber, YEAR(A.AttendanceMonth) 
ORDER BY A.AttendanceMonth rows BETWEEN UNBOUNDED PRECEDING AND 0 FOLLOWING) -- count all previous rows and no following rows
AS RunningTotal FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber = A.EmployeeNumber
GO

SELECT A.EmployeeNumber, A.AttendanceMonth, A.NumberAttendance,
SUM(A.NumberAttendance) OVER (PARTITION BY A.EmployeeNumber, YEAR(A.AttendanceMonth) 
ORDER BY A.AttendanceMonth rows BETWEEN 0 PRECEDING AND UNBOUNDED FOLLOWING) -- count no previous rows and all following rows
AS RunningTotal FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber = A.EmployeeNumber
GO

SELECT A.EmployeeNumber, A.AttendanceMonth, A.NumberAttendance,
SUM(A.NumberAttendance) OVER (PARTITION BY A.EmployeeNumber, YEAR(A.AttendanceMonth) 
ORDER BY A.AttendanceMonth rows BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) -- counts current rows and all following rows... CURRENT ROW is the SAME AS 0 PRECEDING and 0 FOLLOWING
FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber = A.EmployeeNumber
GO

SELECT A.EmployeeNumber, A.AttendanceMonth, A.NumberAttendance,
SUM(A.NumberAttendance) OVER (PARTITION BY A.EmployeeNumber, YEAR(A.AttendanceMonth) 
ORDER BY A.AttendanceMonth rows BETWEEN 0 PRECEDING AND UNBOUNDED FOLLOWING) - A.NumberAttendance AS RunningTotal -- count no previous rows and all following rows minus the data of the rows particular month
FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber = A.EmployeeNumber
GO

SELECT A.EmployeeNumber, A.AttendanceMonth, A.NumberAttendance,
SUM(A.NumberAttendance) OVER (PARTITION BY A.EmployeeNumber, YEAR(A.AttendanceMonth) 
ORDER BY A.AttendanceMonth rows BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) - A.NumberAttendance AS RunningTotal -- counts current rows and all following rows... CURRENT ROW is the SAME AS 0 PRECEDING and 0 FOLLOWING
FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber = A.EmployeeNumber
GO

SELECT A.EmployeeNumber, A.AttendanceMonth, A.NumberAttendance,
SUM(A.NumberAttendance) OVER (PARTITION BY A.EmployeeNumber, YEAR(A.AttendanceMonth) 
ORDER BY A.AttendanceMonth rows BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) - A.NumberAttendance AS RunningTotal -- counts current rows and all following rows... CURRENT ROW is the SAME AS 0 PRECEDING and 0 FOLLOWING
FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber = A.EmployeeNumber
GO