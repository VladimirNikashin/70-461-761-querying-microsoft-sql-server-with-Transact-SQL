SELECT [name] + 'A' from sys.all_columns
SELECT [name] + N'Ⱥ' from sys.all_columns

SELECT SUBSTRING([name],2,LEN([name])-1) as [name] from sys.all_columns
SELECT SUBSTRING([name],1,LEN([name])-1) as [name] from sys.all_columns