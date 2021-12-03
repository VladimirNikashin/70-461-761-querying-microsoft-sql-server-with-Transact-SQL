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
SELECT @x.exist('(/Shopping/ShoppingTrip/Item)[1]') -- if the item exists then return 1 if the item doesnt exist then return 0
SELECT @x.value('(/Shopping/ShoppingTrip/Item)[1]','varchar(50)') -- We are retrieving Item)[1] which is the item known as bananas and we are returning it in a varchar data type
SELECT @x.value('(/Shopping/ShoppingTrip/Item/@Cost)[1]','varchar(50)') -- @Cost is an attribute.