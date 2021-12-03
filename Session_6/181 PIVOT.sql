WITH myTable AS
(SELECT YEAR(DateOfTransaction) AS TheYear, MONTH(DateOfTransaction) AS TheMonth, Amount FROM tblTransaction)

SELECT * FROM myTable
PIVOT (SUM(Amount) FOR TheMonth IN ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12])) AS myPvt
ORDER BY TheYear