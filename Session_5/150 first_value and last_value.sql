SELECT A.EmployeeNumber, A.AttendanceMonth, A.NumberAttendance,
first_value(NumberAttendance)
OVER(PARTITION BY E.EmployeeNumber ORDER BY A.AttendanceMonth 
ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS FirstMonth,
last_value(NumberAttendance)
OVER(PARTITION BY E.EmployeeNumber ORDER BY A.AttendanceMonth
ROWS BETWEEN UNBOUNDED PRECEDING AND 2 FOLLOWING) AS LastMonth
FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber = A.EmployeeNumber

-- first_value takes the first value of the partition or rows in ORDER BY
-- last_value takes the last value of the partition or row in ORDER BY