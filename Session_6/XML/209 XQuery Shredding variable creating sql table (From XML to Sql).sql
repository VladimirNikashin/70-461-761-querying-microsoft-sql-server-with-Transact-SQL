DECLARE @x XML
SET @x='<Shopping ShopperName="Captain Bluebeard" Weather="Good">
<ShoppingTrip ShoppingTripID="L1">
	<Item Cost="5">Bananas</Item>
	<Item Cost="4">Apples</Item>
	<Item Cost="3">Black Cherries</Item>
</ShoppingTrip>
<ShoppingTrip ShoppingTripID="L2">
	<Item>Emeralds</Item>
	<Item>Diamonds</Item>
	<Item>Furniture</Item>
</ShoppingTrip>
</Shopping>'

SELECT tbl.col.value('.','varchar(50)') AS Item,
	   tbl.col.value('/@Cost','varchar(50)') AS Cost
	   into tblTemp									-- Put everything inside the Xml into an SQL table
FROM @x.nodes('/Shopping/ShoppingTrip/Item') AS tbl(col)

truncate table tblTemp
drop table tblTemp

-- := is the same as == in some other languages
-- FLOWRC
-- for
-- let
-- order by
-- where
-- return
-- concat