SELECT A.EmployeeNumber, A.AttendanceMonth, A.NumberAttendance,
CUME_DIST()		OVER(PARTITION BY E.EmployeeNumber ORDER BY A.Attendance) AS MyCume_Dist,
PERCENT_RANK()	OVER (PARTITION BY E.EmployeeNumber ORDER BY A.AttendanceNumber) AS A
FROM tblEmployee AS E JOIN tblAttendance AS A ON E.EmployeeNumber = A.EmployeeNumber

SELECT A.EmployeeNumber, A.AttendanceMonth, A.NumberAttendance,
CUME_DIST()		OVER(PARTITION BY E.EmployeeNumber ORDER BY A.Attendance) * 22 AS MyCume_Dist,
PERCENT_RANK()	OVER (PARTITION BY E.EmployeeNumber ORDER BY A.AttendanceNumber) * 21 AS A
FROM tblEmployee AS E JOIN tblAttendance AS A ON E.EmployeeNumber = A.EmployeeNumber

-- CUME_DIST means accumulative distribution
-- PERCENT_RANK same as CUME_DIST

SELECT A.EmployeeNumber, A.AttendanceMonth, A.NumberAttendance,
CUME_DIST()		OVER(PARTITION BY E.EmployeeNumber ORDER BY A.Attendance) AS MyCume_Dist,
PERCENT_RANK()	OVER (PARTITION BY E.EmployeeNumber ORDER BY A.AttendanceNumber) AS MyPercent_Rank,
CAST(ROW_NUMBER() OVER(PARTITION BY E.EmployeeNumber ORDER BY A.AttendanceMonth) - 1 AS DECIMAL(9,5))
/ COUNT(*) OVER (PARTITION BY E.EmployeeNumber) AS CalcCume_Dist,
CAST(ROW_NUMBER() OVER(PARTITION BY E.EmployeeNumber ORDER BY A.AttendanceMonth) - 1 AS DECIMAL(9,5))
/ COUNT(*) OVER (PARTITION BY E.EmployeeNumber) AS CalcPercent_Rank
FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber = A.EmployeeNumber