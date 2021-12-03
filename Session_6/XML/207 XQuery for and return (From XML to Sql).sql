DECLARE @x XML
SET @x = '<Shopping ShopperName="Captain Bluebeard" Weather="Good">
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

-- returning multiple Values
SELECT @x.query('for $ValueRetrieved in /Shopping/ShoppingTrip/Item return string($ValueRetrieved)')
SELECT @x.query('for $ValueRetrieved in /Shopping/ShoppingTrip/Item return concat(string($ValueRetrieved),";")')


--FLWORC
-- for
-- let
-- where
-- order by
-- return
-- concat