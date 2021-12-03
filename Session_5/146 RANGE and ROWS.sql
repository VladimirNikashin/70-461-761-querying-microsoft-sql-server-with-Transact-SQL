SELECT A.EmployeeNumber, A.AttendanceMonth, A.NumberAttendance,
SUM(A.NumberAttendance) OVER (PARTITION BY A.EmployeeNumber, YEAR(A.AttendanceMonth) 
	ORDER BY A.AttendanceMonth ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS RowsTotal,
SUM(A.NumberAttendance) OVER (PARTITION BY A.EmployeeNumber, YEAR(A.AttendanceMonth) 
	ORDER BY A.AttendanceMonth RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS RangeTotal
	FROM tblEmployee AS E JOIN (SELECT * FROM tblAttendance UNION ALL SELECT * FROM tblAttendance) as A
	ON E.EmployeeNumber = A.EmployeeNumber
ORDER BY A.EmployeeNumber, A.AttendanceMonth

SELECT A.EmployeeNumber, A.AttendanceMonth, A.NumberAttendance,
SUM(A.NumberAttendance) OVER (PARTITION BY A.EmployeeNumber, YEAR(A.AttendanceMonth) 
	ORDER BY A.AttendanceMonth ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) AS RowsTotal,
SUM(A.NumberAttendance) OVER (PARTITION BY A.EmployeeNumber, YEAR(A.AttendanceMonth) 
	ORDER BY A.AttendanceMonth RANGE BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) AS RangeTotal
	FROM tblEmployee AS E JOIN (SELECT * FROM tblAttendance UNION ALL SELECT * FROM tblAttendance) as A
	ON E.EmployeeNumber = A.EmployeeNumber
ORDER BY A.EmployeeNumber, A.AttendanceMonth

-- Difference between RANGE and ROWS
-- ROWS... You take the current row and we work out the backwards and forwards of that row
-- RANGE... We take the current row we have a look at the pattern and treat anything that has the same pattern as being tied.

-- RANGE can only be used with UNBOUNDED and CURRENT ROW

-- Here are 3 combos that are used with RANGE
-- UNBOUNDED PRECEDING AND CURRENT ROW
-- CURRENT ROW AND UNBOUNDED FOLLOWING
-- UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING -> Range and Rows would give the same data in this scenario

-- Because RANGE has to work out the tied patterns it is overall slower than ROWS
-- ROWS must always be used as a standard default.
-- The only reason to use RANGE is to take the tied patterns into consideration