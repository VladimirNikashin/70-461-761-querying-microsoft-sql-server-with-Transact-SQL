SELECT E.Department, E.EmployeeNumber, A.AttendanceMonth AS AttendanceMonth, SUM(A.NumberAttendance) AS NumberAttendance,
GROUPING(E.EmployeeNumber) AS EmployeeNumberGroupedBy,
GROUPING_ID(E.Department,E.EmployeeNumber,A.AttendanceMonth) AS EmployeeNumberGroupedID
FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber = A.EmployeeNumber
GROUP BY ROLLUP (E.Department, E.EmployeeNumber, A.AttendanceMonth)
ORDER BY Department, EmployeeNumber, AttendanceMonth