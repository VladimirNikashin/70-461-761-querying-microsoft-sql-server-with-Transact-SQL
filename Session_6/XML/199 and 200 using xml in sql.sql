DECLARE @x XML
SET @x ='<Shopping ShopperName="Captain Bluebeard" Weather="Good">
<ShoppingTrip ShoppingTripID="L1">
	<Item Cost="5">Bananas</Item>
	<Item Cost="4">Apples</Item>
	<Item Cost="3">Black Cherries</Item>
</ShoppingTrip>
<ShoppingTrip ShoppingTripID="L2">
<Item>Emerald</Item>
	<Item>Diamonds</Item>
	<Item>Furniture</Item>
</ShoppingTrip>
</Shopping>'

SELECT @x AS XMLOutput

ALTER TABLE tblEmployee  
ADD XMLOutput xml null

UPDATE [dbo].[tblEmployee] 
SET XMLOutput = @x
WHERE EmployeeNumber = 200

SELECT * FROM [dbo].[tblEmployee]

ALTER TABLE tblEmployee
DROP COLUMN XMLOutput
