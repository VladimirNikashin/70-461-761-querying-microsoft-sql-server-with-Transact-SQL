SELECT * FROM inserted
UNION
SELECT * FROM deleted

SELECT CONVERT (CHAR(5),'hi') AS Greeting -- Only Takes a column name from the first data set
UNION
SELECT CONVERT (CHAR(11),'hallo there')
UNION
SELECT CONVERT (CHAR(11),'bonjour')
UNION
SELECT CONVERT (CHAR(5),'hi')

SELECT CONVERT (CHAR(5),'hi') AS Greeting	-- Only Takes a column name from the first data set
UNION all									-- UNION all does not get rid of duplicates
SELECT CONVERT (CHAR(11),'hallo there')
UNION all
SELECT CONVERT (CHAR(11),'bonjour')
UNION all
SELECT CONVERT (CHAR(5),'hi')

WITH cte AS (
SELECT CONVERT (TINYINT, 45) AS MyColumn
UNION
SELECT CONVERT(BIGINT, 456)
)
SELECT MyColumn
into tblTemp
FROM CTE

SELECT 'hi there'
UNION
SELECT 4

-- Union Combines the results of multiple queries into one single result set.
-- Union does not include duplicates.
-- Union All includes duplicates