SELECT E.Department, E.EmployeeNumber, A.AttendanceMonth AS AttendanceMonth, A.NumberAttendance
FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber = A.EmployeeNumber
UNION
SELECT E.Department, E.EmployeeNumber, NULL AS AttendanceMonth, SUM(A.NumberAttendance) AS TotalAttendance
FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber = A.EmployeeNumber
GROUP BY E.Department, E.EmployeeNumber
ORDER BY Department, EmployeeNumber
GO

SELECT E.Department, E.EmployeeNumber, A.AttendanceMonth AS AttendanceMonth, A.NumberAttendance
FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber = A.EmployeeNumber
UNION
SELECT E.Department, E.EmployeeNumber, NULL AS AttendanceMonth, SUM(A.NumberAttendance) AS TotalAttendance
FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber = A.EmployeeNumber
GROUP BY E.Department, E.EmployeeNumber
UNION
SELECT E.Department, null, null AS AttendanceMonth, SUM(A.NumberAttendance) AS TotalAttendance
FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber = A.EmployeeNumber
GROUP BY E.Department
ORDER BY Department, EmployeeNumber, AttendanceMonth
GO

-- Below is a calculation of the grand total
SELECT E.Department, E.EmployeeNumber, A.AttendanceMonth AS AttendanceMonth, A.NumberAttendance
FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber = A.EmployeeNumber
UNION
SELECT E.Department, E.EmployeeNumber, NULL AS AttendanceMonth, SUM(A.NumberAttendance) AS TotalAttendance
FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber = A.EmployeeNumber
GROUP BY E.Department, E.EmployeeNumber
UNION
SELECT NULL, null, null AS AttendanceMonth, SUM(A.NumberAttendance) AS TotalAttendance
FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber = A.EmployeeNumber
ORDER BY Department, EmployeeNumber, AttendanceMonth
GO

--Another variation
SELECT E.Department, E.EmployeeNumber, A.AttendanceMonth AS AttendanceMonth, A.NumberAttendance
FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber = A.EmployeeNumber
UNION
SELECT E.Department, E.EmployeeNumber, NULL AS AttendanceMonth, SUM(A.NumberAttendance) AS TotalAttendance
FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber = A.EmployeeNumber
GROUP BY E.Department, E.EmployeeNumber
UNION
SELECT NULL, null, null AS AttendanceMonth, SUM(A.NumberAttendance) AS TotalAttendance
FROM tblEmployee AS E JOIN tblAttendance AS A
ON E.EmployeeNumber = A.EmployeeNumber
ORDER BY Department, EmployeeNumber, AttendanceMonth
GO