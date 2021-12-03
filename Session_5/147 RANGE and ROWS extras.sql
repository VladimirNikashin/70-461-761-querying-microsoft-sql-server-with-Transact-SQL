SELECT A.EmployeeNumber, A.AttendanceMonth, A.NumberAttendance,
SUM(A.NumberAttendance) OVER (PARTITION BY  EmployeeNumber, year(A.AttendanceMonth) ORDER BY A.AttendanceMonth) AS SumAttendance
FROM tblEmployee AS E JOIN (SELECT * FROM tblAttendance UNION ALL SELECT * FROM tblAttendance) AS A
ON E.EmployeeNumber = A.EmployeeNumber
ORDER BY A.EmployeeNumber, A.AttendanceMonth

SELECT SUM(NumberAttendance) FROM tblAttendance

-- RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING - This is the default when there is no ORDER BY
-- RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW - This is the default when there is an ORDER BY