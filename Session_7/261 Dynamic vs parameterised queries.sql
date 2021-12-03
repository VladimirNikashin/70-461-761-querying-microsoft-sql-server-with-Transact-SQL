
--________________________________VERY BAD_______________________________
DECLARE @param VARCHAR(1000) = '127' + char(10) + 'SELECT * FROM tblDepartment'; -- Everything starting from the plus in this line is a sql injection attack
DECLARE @sql VARCHAR(1000) = 'SELECT * FROM [dbo].[tblTransaction] AS T WHERE T.EmployeeNumber = ' + @param

EXECUTE (@sql);
GO


--The above is an example of a dynamic query
--The below is an example of a Parameterised query

--________________________________VERY GOOD_______________________________
DECLARE @param VARCHAR(1000) = '127' + char(10) + 'SELECT * FROM tblDepartment'; -- The attack no longer works
EXECUTE SYS.sp_executesql
@statement = N'SELECT * FROM [dbo].[tblTransaction] AS T WHERE T.EmployeeNumber = @EmployeeNumber',
@params = N'@EmployeeNumber varchar(1000)',
@EmployeeNumber = @param
GO