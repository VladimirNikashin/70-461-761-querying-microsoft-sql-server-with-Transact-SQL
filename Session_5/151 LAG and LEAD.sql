SELECT A.EmployeeNumber , A.AttendanceMonth, A.NumberAttendance,
	LAG(NumberAttendance) OVER(PARTITION BY E. EmployeeNumber ORDER BY A.AttendanceMonth) AS MyLag,
	LEAD (NumberAttendance) OVER(PARTITION BY E.EmployeeNumber ORDER BY A.AttendanceMonth) AS MyLead
FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber = A.EmployeeNumber
-- The above is the best one to use as a standard.

SELECT A.EmployeeNumber , A.AttendanceMonth, A.NumberAttendance,
	LAG(NumberAttendance, 3) OVER(PARTITION BY E. EmployeeNumber ORDER BY A.AttendanceMonth) AS MyLag,
	LEAD (NumberAttendance, 3) OVER(PARTITION BY E.EmployeeNumber ORDER BY A.AttendanceMonth) AS MyLead
FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber = A.EmployeeNumber

SELECT A.EmployeeNumber , A.AttendanceMonth, A.NumberAttendance,
	LAG(NumberAttendance, 3, 999) OVER(PARTITION BY E. EmployeeNumber ORDER BY A.AttendanceMonth) AS MyLag,
	LEAD (NumberAttendance, 3, 999) OVER(PARTITION BY E.EmployeeNumber ORDER BY A.AttendanceMonth) AS MyLead
FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber = A.EmployeeNumber

-- LAG goes backwards and LEAD goes forwards
-- PARTITION is optional
-- ORDER BY is compulsory

-- The query Below calculates the difference between  the last row and current row.
SELECT A.EmployeeNumber , A.AttendanceMonth, A.NumberAttendance,
	LAG(NumberAttendance) OVER(PARTITION BY E. EmployeeNumber ORDER BY A.AttendanceMonth) AS MyLag,
	LEAD (NumberAttendance) OVER(PARTITION BY E.EmployeeNumber ORDER BY A.AttendanceMonth) AS MyLead,
	NumberAttendance - lag(NumberAttendance, 1) OVER(PARTITION BY E.EmployeeNumber ORDER BY A.AttendanceMonth) AS MyDiff
FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber = A.EmployeeNumber