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

SELECT JSON_MODIFY(@json,'strict $.Shopping.Items[0]',JSON_QUERY('{"Item":" Big Bananas","Cost":1}')) -- modifying bananas

SELECT JSON_MODIFY(@json,'$.Date','2022-01-01')