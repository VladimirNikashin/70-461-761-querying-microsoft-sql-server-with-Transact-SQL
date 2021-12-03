SELECT A.EmployeeNumber, A.AttendanceMonth, A.NumberAttendance,
SUM(A.NumberAttendance) OVER (PARTITION BY A.EmployeeNumber, YEAR(A.AttendanceMonth) 
ORDER BY A.AttendanceMonth rows BETWEEN 1 PRECEDING AND 1 FOLLOWING) -- PRECEDING means the previous row... FOLLOWING means the next row
AS RunningTotal FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber = A.EmployeeNumber
GO

-- In the row where a new year starts it only adds the current NumberAttendance and next row's NumberAttendance
-- In the row where a year ends it only adds the current NumberAttendance and the previous row's NumberAttendance
-- Other than the 2 occurences above it will usually take the current rows NumberAttendance, the previous row's NumberAttendance and the next rows NumberAttendance.