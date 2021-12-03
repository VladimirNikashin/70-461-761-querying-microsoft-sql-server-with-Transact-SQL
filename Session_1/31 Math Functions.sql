DECLARE @myvar AS numeric (7,2) = 4
SELECT POWER (@myvar,3)					-- Math function 4 to the power of the 3
GO

DECLARE @myvar AS numeric (7,2) = 3
SELECT SQUARE(@myvar)					--  Math function -> SQUARE the number
GO

DECLARE @myvar AS numeric (7,2) = 9;
SELECT POWER(@myvar, 0.5)				-- Find the SQUARE ROOT
GO

DECLARE @myvar AS numeric (7,2) = 3;
SELECT SQRT(@myvar)						-- Find the SQUARE ROOT
GO

--________________________________________________________________________________

DECLARE @myvar AS numeric(7,2) = 4.9
SELECT FLOOR(@myvar) AS myFloor			-- Rounds Downwards
GO

DECLARE @myvar AS numeric(7,2) = 4.9
SELECT CEILING(@myvar) AS myCeiling		-- Rounds Upwards
GO

DECLARE @myvar AS numeric(7,2) = 4.9
SELECT ROUND (@myvar,0) AS myRound		--Rounds to nearest whole number, either up or down
GO

DECLARE @myvar AS numeric(7,2) = -4.4
SELECT FLOOR(@myvar) AS myFloor			-- Rounds Downwards
SELECT CEILING(@myvar) AS myCeiling		-- Rounds Upwards
SELECT ROUND (@myvar,0) AS myRound		--Rounds to nearest whole number, either up or down
GO

DECLARE @myvar AS numeric(7,2) = 12.345
SELECT FLOOR(@myvar) AS myFloor			-- Rounds Downwards
SELECT CEILING(@myvar) AS myCeiling		-- Rounds Upwards
SELECT ROUND (@myvar,1) AS myRound		-- Rounds to nearest whole number, either starting from .5 upwards or .4 downwards
										-- and 1 means round to nearest estimated decimal place, 0 means to the nearest whole number and -1 mean to the nearest 10
GO

DECLARE @myvar as numeric(7,2) = -456.5678

SELECT PI() AS myPI
SELECT EXP(1) AS e

SELECT ABS(@myvar) as myABS, SIGN(@myvar) as mySign -- ABS always returns the exact same number as a positive value,
													-- if @myvar=0 then SIGN returns 0
													-- if @myvar>0 then SIGN returns 1
													-- if @myvar<0 then SIGN returns -1
GO

DECLARE @myvar as numeric(7,2) = 1234.56
SELECT RAND (@myvar)								--Returns a specific random number from (@myvar)
GO

