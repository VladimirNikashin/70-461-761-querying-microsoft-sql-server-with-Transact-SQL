SELECT * FROM tblEmployee WHERE EmployeeMiddleName IS NULL

DECLARE @myOption AS VARCHAR(10) = 'Option B'
SELECT ISNULL(@myOption, 'No Option') AS MyOptions -- If OptionA is not equal to null then it returns A if B is not equal to Null then return B... if neither then it returns null
GO												   -- ISNULL can only use 2 Options but its faster than COALESCE

DECLARE @myFirstOption AS VARCHAR(10) = 'Option A'
DECLARE @mySecondOption AS VARCHAR(10)= 'Option B'

SELECT COALESCE(@myfirstOption, @mySecondOption, 'No option') AS MyOption -- COALESCE can use as many options as you want but it is slower than ISNULL
GO

SELECT ISNULL('ABC',1) AS MyAnswer
SELECT COALESCE('ABC',1) AS MyOtherAnswer
GO

--__________________________________________________________________________________________________
CREATE TABLE tblExample
(myOption nvarchar(10) null)
GO

INSERT INTO tblExample (myOption)
VALUES ('Option A')

SELECT COALESCE(myOption, 'No option') AS MyOptions --Always Creates a table with a nullable column.
into tblIsCoalesce
From tblExample
SELECT CASE WHEN myOption IS NOT NULL THEN myOption else 'No option' END AS myOption from tblExample -- The Coalesce function in this block does the same thing as this.
GO


SELECT ISNULL(myOption, 'No option') AS MyOptions -- Creates a Table with a not null column because the function found no nulls in the data
into tblIsNull
From tblExample
GO

DROP TABLE tblExample
DROP TABLE tblIsCoalesce
DROP TABLE tblIsNull

--Coalesce returns the first non-null value in a list and ISNULL does the same.