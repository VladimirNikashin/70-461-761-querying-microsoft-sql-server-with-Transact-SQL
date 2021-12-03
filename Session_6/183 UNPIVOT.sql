WITH myTable AS
(SELECT YEAR(DateOfTransaction) AS TheYear, MONTH(DateOfTransaction) AS TheMonth, Amount FROM tblTransaction)

SELECT TheYear, ISNULL([1],0) AS [1], 
				ISNULL([2],0) AS [2],
				ISNULL([3],0) AS [3],
				ISNULL([4],0) AS [4],
				ISNULL([5],0) AS [5],
				ISNULL([6],0) AS [6],
				ISNULL([7],0) AS [7],
				ISNULL([8],0) AS [8],
				ISNULL([9],0) AS [9],
				ISNULL([10],0) AS [10],
				ISNULL([11],0) AS [11],
				ISNULL([12],0) AS [12]
FROM myTable
PIVOT (SUM(Amount) FOR TheMonth IN ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12])) AS myPvt
ORDER BY TheYear
GO

WITH myTable AS
(SELECT YEAR(DateOfTransaction) AS TheYear, MONTH(DateOfTransaction) AS TheMonth, SUM(Amount) AS Amount FROM tblTransaction
GROUP BY YEAR(DateOfTransaction), MONTH(DateOfTransaction))

SELECT TheYear, ISNULL([1],0) AS [1], 
				ISNULL([2],0) AS [2],
				ISNULL([3],0) AS [3],
				ISNULL([4],0) AS [4],
				ISNULL([5],0) AS [5],
				ISNULL([6],0) AS [6],
				ISNULL([7],0) AS [7],
				ISNULL([8],0) AS [8],
				ISNULL([9],0) AS [9],
				ISNULL([10],0) AS [10],
				ISNULL([11],0) AS [11],
				ISNULL([12],0) AS [12]
INTO tblPivot FROM myTable
PIVOT (SUM(Amount) FOR TheMonth IN ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12])) AS myPvt
ORDER BY TheYear
GO

SELECT * FROM [tblPivot]
UNPIVOT (Amount FOR MONTH IN([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12])) AS tblUnpivot
GO

SELECT * FROM [tblPivot]
UNPIVOT (Amount FOR MONTH IN([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12])) AS tblUnpivot
WHERE Amount <> 0
GO
