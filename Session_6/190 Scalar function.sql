CREATE FUNCTION AmountPlusOne
(
    @Amount SMALLMONEY
)
RETURNS SMALLMONEY
AS
BEGIN
    RETURN @Amount + 1
END
GO -- SCALAR functions allow for us to get one value back

SELECT DateOfTransaction, EmployeeNumber, Amount, dbo.AmountPlusOne(Amount) AS AmountAndOne
FROM tblTransaction

DECLARE @myValue SMALLMONEY
EXEC @myValue = dbo.AmountPlusOne @Amount = 345.67
SELECT @myValue

-- Functions can be used in SELECT statements
-- Procedures cannot be used in SELECT statements

-- SCALAR functions are used to return 1 value only.