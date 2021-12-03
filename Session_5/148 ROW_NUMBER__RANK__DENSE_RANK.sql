SELECT A.EmployeeNumber, A.AttendanceMonth, A.NumberAttendance,
ROW_NUMBER() OVER(PARTITION BY A.EmployeeNuber ORDER BY A.EmployeeNumber, A.AttendanceMonth) AS TheRowNumber,
RANK() OVER(PARTITION BY A.EmployeeNuber ORDER BY A.EmployeeNumber, A.AttendanceMonth) AS TheRank,
DENSE_RANK() OVER(PARTITION BY A.EmployeeNuber ORDER BY A.EmployeeNumber, A.AttendanceMonth) AS TheDenseRank
FROM tblEmployee AS E JOIN tblAttendance AS A 
ON E.EmployeeNumber = A.EmployeeNumber

SELECT *, ROW_NUMBER() OVER(ORDER BY (SELECT NULL)) FROM tblAttendance

-- RANK leaves a gap in the numbering when pattern ties are present but DENSE_RANK does not 