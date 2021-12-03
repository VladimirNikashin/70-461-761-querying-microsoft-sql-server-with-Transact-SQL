USE [70-461]
DROP TABLE IF EXISTS [dbo].[#tblXML];
GO

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

CREATE TABLE #tblXML(pkXML INT PRIMARY KEY, xmlCol XML) -- in #tblXML the # means its a temporary table

INSERT INTO #tblXML(pkXML, xmlCol) VALUES (1, @x1)
INSERT INTO #tblXML(pkXML, xmlCol) VALUES (2, @x2)

CREATE PRIMARY XML INDEX pk_tblXML ON #tblXML(xmlCol) -- Create Primary Index and apply it to the column known as xmlCol
CREATE XML INDEX secpk_tblXML_Path ON #tblXML(xmlCol)
	   USING XML INDEX pk_tblXML FOR PATH
CREATE XML INDEX secpk_tblXML_Value ON #tblXML(xmlCol)
	   USING XML INDEX pk_tblXML FOR VALUE
CREATE XML INDEX secpk_tblXML_Property ON #tblXML(xmlCol)
	   USING XML INDEX pk_tblXML FOR PROPERTY

-- USING XML INDEX pk_tblXML FOR PATH      -> This speeds up queries that use a path such as IF EXISTS queries and is mainly used for catalogues.
-- USING XML INDEX pk_tblXML FOR VALUE     -> These are used for queries that have wildcards like in a path... So if the path is not fully known then an index by value will help
-- USING XML INDEX pk_tblXML FOR PROPERTY  -> The same as value... the only difference is that property uses multiple values. Mainly ussed to retrieve multiple values from a single xml instance.
-- All secondary indexes rely on a primary index
-- And the Primary index relies on a Primary Key

-- := is the same as == in some other languages
-- FLOWRC
-- for
-- let
-- order by
-- where
-- return
-- concat