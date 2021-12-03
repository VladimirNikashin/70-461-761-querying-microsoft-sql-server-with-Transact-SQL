SELECT A.EmployeeNumber, A.AttendanceMonth, A.NumberAttendance,
NTILE(10) OVER(PARTITION BY A.EmployeeNumber ORDER BY A.AttendanceMonth) AS TheNTile,
CONVERT(INT,(ROW_NUMBER() OVER(PARTITION BY E.EmployeeNumber ORDER BY A.AttendanceMonth)-1)/
	(COUNT(*) OVER (PARTITION BY E.EmployeeNumber
					ORDER BY A.AttendanceMonth)-1)/
					(COUNT(*) OVER(PARTITION BY E.EmployeeNumber
					ORDER BY A.AttendanceMonth
					ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)/10.0)) +1 AS MyNtile
FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber = A.EmployeeNumber
WHERE A.AttendanceMonth < '2015-05-01'

-- NTILE() means how many parts do you want the partition to be divided into.