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

SELECT JSON_VALUE(@json, 'strict $.name') -- retruns 1 value
SELECT JSON_QUERY(@json, '$.Shopping.Items') -- returns an object or an array

SELECT JSON_VALUE(@json, 'strict $.Shopping.Items[0].Item')
SELECT JSON_VALUE(@json, 'strict $.Shopping.Items[0].Cost')