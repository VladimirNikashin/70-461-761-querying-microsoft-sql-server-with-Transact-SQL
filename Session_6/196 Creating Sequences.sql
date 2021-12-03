BEGIN TRANSACTION
CREATE SEQUENCE newSeq AS BIGINT
START WITH 1
INCREMENT BY 1
MINVALUE 1			-- its the value that the cycle starts with
MAXVALUE 999999		-- its the value that the cycle ends with
CYCLE				-- Cycle means when it reaches max value then it goes back to the min value as part of a new cycle
CACHE 50
CREATE SEQUENCE secondSeq AS INT
SELECT * FROM sys.sequences
ROLLBACK TRANSACTION


-- Sequences are objects which store a number and gives you the next number
-- Sequences can be applied to no column, one or columns or even all columns.
-- Identity cannot do that because identity is unique to one column

-- Without the Predefined Max value it will default to the size of the variable that was declared in this case it would default to BIGINT.