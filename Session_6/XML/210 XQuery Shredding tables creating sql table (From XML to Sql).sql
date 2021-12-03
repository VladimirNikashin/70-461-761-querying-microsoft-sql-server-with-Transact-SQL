DECLARE @x1 XML, @x2 XML
SET @x1='<Shopping ShopperName="Captain Bluebeard" Weather="Good">
<ShoppingTrip ShoppingTripID="L1">
	<Item Cost="5">Bananas</Item>
	<Item Cost="4">Apples</Item>
	<Item Cost="3">Cherries</Item>
</ShoppingTrip>
</Shopping>'
SET @x2='<Shopping ShopperName="Captain Bluebeard" Weather="Good">
<ShoppingTrip ShoppingTripID="L2">
	<Item>Emeralds</Item>
	<Item>Diamonds</Item>
	<Item>Furniture</Item>
</ShoppingTrip>
</Shopping>'

DROP TABLE #tblXML
CREATE TABLE #tblXML(pkXML INT PRIMARY KEY, xmlCol XML) -- in #tblXML the # means its a temporary table

INSERT INTO #tblXML(pkXML, xmlCol) VALUES (1, @x1)
INSERT INTO #tblXML(pkXML, xmlCol) VALUES (2, @x2)

SELECT * FROM #tblXML

SELECT tbl.col.query('.')							-- Put everything inside the Xml into an SQL table
FROM #tblXML CROSS APPLY
xmlCol.nodes('/Shopping/ShoppingTrip/Item') AS tbl(col)

SELECT tbl.col.value('@Cost','varchar(50)')							-- Put everything inside the Xml into an SQL table
FROM #tblXML CROSS APPLY
xmlCol.nodes('/Shopping/ShoppingTrip/Item') AS tbl(col)

-- := is the same as == in some other languages
-- FLOWRC
-- for
-- let
-- order by
-- where
-- return
-- concat