SELECT * FROM tblEmployee WHERE EmployeeNumber = 129;
GO
DECLARE @command AS VARCHAR(255);
SET @command = 'select * from tblEmployee where EmployeeNumber = 129;'
SET @command = 'Select * from tblTransaction'
EXECUTE (@command);
GO
DECLARE @command AS VARCHAR(255), @param AS VARCHAR(50);
SET @command = 'select * from tblEmployee where EmployeeNumber = '
SET @param ='129'
EXECUTE (@command + @param); --sql injection potential, security breach
GO
DECLARE @command AS NVARCHAR(255), @param AS NVARCHAR(50);
SET @command = N'select * from tblEmployee where EmployeeNumber = @ProductID'
SET @param =N'129'
EXECUTE sys.sp_executesql @statement = @command, @params = N'@ProductID int', @ProductID = @param;
