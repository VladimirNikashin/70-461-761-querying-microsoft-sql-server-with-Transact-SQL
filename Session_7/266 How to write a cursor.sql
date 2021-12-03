DECLARE @EmployeeID int
DECLARE csr CURSOR FOR 
SELECT EmployeeNumber
FROM [dbo].[tblEmployee]
WHERE EmployeeNumber BETWEEN 120 AND 299

OPEN csr
FETCH NEXT FROM csr INTO @EmployeeID
WHILE @@FETCH_STATUS = 0
BEGIN
SELECT * FROM [dbo].[tblTransaction] WHERE EmployeeNumber = @EmployeeID
FETCH NEXT FROM csr INTO @EmployeeID
END

CLOSE csr
DEALLOCATE csr

-- Using cursors are good for practice example purposes.
-- For practical purposes its bad because it takes too long to fully execute