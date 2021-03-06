ALTER FUNCTION [dbo].[TransactionList](
@EmployeeNumber int
)
RETURNS TABLE AS RETURN
(
    SELECT * FROM tblTransaction WHERE EmployeeNumber = @EmployeeNumber
)
GO

SELECT * FROM dbo.TransactionList(123)
GO

CREATE FUNCTION TransList(@EmployeeNumber INT)
RETURNS @TransList TABLE
(Amount SMALLMONEY,
DateOfTransaction  SMALLDATETIME,
EmployeeNumber INT)
AS
BEGIN
INSERT INTO @TransList(Amount, DateOfTransaction, EmployeeNumber)
	SELECT Amount, DateOfTransaction, EmployeeNumber FROM tblTransaction 
	WHERE EmployeeNumber = @EmployeeNumber
	RETURN
END
GO

SELECT * FROM dbo.TransList(123)
GO

-- Differernce between a multi table function and an inline table function
-- Inline:
-- you dont have to return the table.
-- BEGIN and END are not used however we do use brackets to instead.

-- Multi line:
-- you must return a variable defined as a table and then define the table. 
-- Always ends on a return statement that returns the table that was defined in the same block
-- Is Primarily used to enable one to implement branching logic... e.g If x=1 then execute function TransList