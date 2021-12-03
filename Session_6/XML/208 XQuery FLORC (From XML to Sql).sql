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

SELECT @x.query('for $ValueRetrieved in /Shopping/ShoppingTrip[1]/Item/
				let $CostVariable := $ValueRetrieved/@Cost 
				where $CostVariable/@Cost >= 4
				order by $CostVariable/@Cost
				return concat(string($ValueRetrieved),";")')

-- := is the same as == in some other languages
--FLOWRC
-- for
-- let
-- order by
-- where
-- return
-- concat