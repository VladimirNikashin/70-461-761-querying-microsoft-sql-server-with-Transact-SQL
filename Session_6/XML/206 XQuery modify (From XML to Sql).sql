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
SET @x.modify('replace value of (/Shopping/ShoppingTrip[1]/Item[3]/@Cost)[1] with "6.0"') --*modify* and *replace value of* is case sensitive
SET @x.modify('insert <Item Cost="5">New Food</Item> into (/Shopping/ShoppingTrip)[1]') -- Inserts into the first tag known as ShoppingTrip
SET @x.modify('insert <Item Cost="5">New Food</Item> into (/Shopping/ShoppingTrip)[2]') -- Inserts in the second tag known as ShoppingTrip 
SELECT @x