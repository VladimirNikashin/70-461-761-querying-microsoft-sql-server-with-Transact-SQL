DECLARE @json nvarchar(4000)
set @json = '
{
"name":"Pilot Inspector",
"Shopping": {
	"ShoppingTrip":1,
	"Items":[
	{"Item":"Bananas","Cost":5},
	{"Item":"Apples","Cost":4},
	{"Item":"Cherries","Cost":3}
	]
  }
}
'

SELECT isJson (@json) -- Returns a 1 if its correctly formatted or returns a zero if its incorrectly formatted
--JSON (JavaScript Object Notification)

SELECT * FROM OPENJSON(@json,'$.Shopping.Items')
	WITH (Item varchar(10), Cost int)

SELECT 'Bananas' AS Item, 5 AS COST
UNION
SELECT 'Apples', 4
UNION
SELECT 'Cherries', 3
FOR JSON PATH, ROOT('Items')