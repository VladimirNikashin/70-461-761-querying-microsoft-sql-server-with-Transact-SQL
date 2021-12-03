--INSERT INTO tblEmployee VALUES
--(1,'Nod','S', 'Word', 'KI53017P', '2002-10-24','Tation'),
--(5,'Warrel','C', 'Strad', 'HT73948T', '1996-09-11','Omunitation'),
--(6,'Karrel','D', 'Bow', 'UY64839Y', '1980-01-01','Ruination'),
--(7,'Alice','E', 'Zan', 'LI89340A', '1990-04-12','Extermination'),
--(8,'Telly','F', 'Ulter', 'WR45890N', '2005-06-19','Fromularation'),
--(9,'Jenny','G', 'Querg', 'BT93756Q', '1989-11-30','Sublimination'),
--(10,'Armond','H', 'Blorg', 'EX45896H', '1009-10-11','Intoxication'),
--(11,'Steve','I', 'Jim', 'ZX40195M', '2008-09-18','Killomonohation'),
--(12,'Jacob','J', 'Dake', 'SM98562D', '1900-12-12','Volimination')

SELECT * FROM tblEmployee WHERE EmployeeLastName like '%W'	 -- SELECT everything that has a W at the End of a name
SELECT * FROM tblEmployee WHERE EmployeeLastName = 'Word'	 -- SELECT everything that has Word in it
SELECT * FROM tblEmployee WHERE EmployeeLastName <> 'Word'	 -- SELECT everything that does NOT have Word in it
SELECT * FROM tblEmployee WHERE EmployeeLastName like '%U%'	 -- SELECT everything that Contains the letter U
SELECT * FROM tblEmployee WHERE EmployeeLastName like '_A%'	 -- SELECT everything that has A as a second letter
SELECT * FROM tblEmployee WHERE [EmployeeLastName] >= 'Word' -- Select everything that starts with the alphabet letter W and Over

SELECT * FROM tblEmployee WHERE [EmployeeLastName] like '[r-t]%'	-- SELECT everything in the range of R to T
SELECT * FROM tblEmployee WHERE [EmployeeLastName] like '[^rst]%'	-- SELECT everything that is not r, S or T
SELECT * FROM tblEmployee WHERE [EmployeeLastName] like '[%]%'		-- SELECT everything that has a % sign
