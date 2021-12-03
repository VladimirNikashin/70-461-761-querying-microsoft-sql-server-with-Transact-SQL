DECLARE @chrMyCharacters as varchar(10)
SET @chrMyCharacters ='Hallo?'
SELECT @chrMyCharacters as myString, LEN(@chrMyCharacters) as MyLength, DATALENGTH(@chrMyCharacters) as myDataLength
GO

DECLARE @chrMyCharacters as nvarchar(10)
SET @chrMyCharacters = N'hello'
SELECT @chrMyCharacters as myString, LEN(@chrMyCharacters) as MyLength,DATALENGTH(@chrMyCharacters) as myDataLength
GO

DECLARE @chrASCII as varchar(10) = 'hallothere'
Declare @chrUNICODE as nvarchar(10) =N'Hallo?'

SELECT left(@chrASCII,2) as myASCII ,right(@chrUNICODE,2) as myUNICODE
SELECT SUBSTRING(@chrASCII,3,2) as middleLetters
SELECT REPLACE(@chrASCII,'l','L') as myReplace							-- Letters l in with L in the selection

SELECT UPPER(@chrASCII) as myUpper										-- prints in all Upper Case Letters
SELECT LOWER(@chrASCII) as myLower										-- prints in all Lower case letters
