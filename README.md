Hallo! This is an overview of the contents in this project.

Entire_Database_Session_1-6: This is the main database that I have developed throughout the entire project. 
It already contains indexes, procedures, views, statistics, functions, keys, constraints and it exists as a finished project.

Entire_Database_Session_7 This database is solemnly used for Session 7 of the video course and in itself.
It contains a different set of indexes, procedures, indexes, functions, keys and statistics.

_____________________________________________
To Install this database do the Following:

Copy the folder called Entire_Database_Session_1-6 and paste it into local disk (C:)
After you launched SSMS right click on the Databases folder
Then click resatore database
Click on Device
Click on the ... button, make sure Backup media type is set to file and then click on Add
Locate the folder Entire_Database_Session_1-6 and Click ok. Then click ok again.
The database should now be installed.

WARNING: I was unable to test if this works on other systems.
_____________________________________________

Session 1: This session is focused on:
  *The insertion of data into a table via the INSERT INTO query.
  *The Creation of a Table.
  *The Creation and aliasing of data types such as integers, strings, varchars, nulls.
  *Implementaion of Math Functions
  *Retrieving data via the select statement.
  *Creation, Comparison and identification of the different types of Date Formats.
  *Conversion of dates to Strings as well as the conversion between Number types.
  *The joining and extravtion of Strings.
  *Null examples

Session 2: This Session is focused on:
  *The Manipulation of data in a table via ALTER, UPDATE, INSERT, ADD and DROP.
  *Selecting parts of a table in terms of strings and numbers.(Retrieving everything that has A as a second letter or... retrieve a range of numbers)
  *The introduction and implementation of SELECT FROM WHERE GROUP HAVING ORDER BY.
  *Creating tables through the SELECT statement.
  *How to Multi Join tables
  *The results of using of Rollback

Session 3: This Session is Focused on:
  *Creation of unique indexes.
  *Constraint Manipulation via ALTER and DROP.
  *The use of Check Constraints.
  *The Purpose of Primary Keys, Foreign KEys.
  *How to Create, Drop, and Secure Views and how to delete data from a view.
  *How to Log what has contents that have been deleted and inserted via the After Trigger.
  *Triggers that are activated if a Delete query has been run.
  *The complex handling of Multiple rows in a table.

Session 4: This Session id focused on:
  *The explanation, use and Implementation of INTERSECT AND EXCEPT.
  *The introduction to CASE Switches in SQL.
  *An introduction to Data Manipulation Language and DML Tactics.
  *The use and Creation and development of Procedures.
  *Control Flow via While loops.
  *Error Handling with Try and Catch
  *The Differences between ISNULL and COALESCE.
  *Joining result sets via UNION and UNION ALL.

Session 5: This Session is Focused on:
  *Partitioning a Table
  *Data reading techniques such as PRECEDING, FOLLOWING, CURRENT ROW and UNBOUNDED
  *Retrieving Ranges of values from Rows.
  *Division of Partions via NTILE
  *Differences between ROW_NUMBER, DENSE_RANK
  *Retrieval of the first and last values in a partition.
  *LAG and LEAD in Practice
  *Example of an accumulative distribution.
  *Finding the average with PErcentile_CONT and PERCENTILE_DISC
  *Variations of calculating Totals in a table
  *Introduction to spatial aggregates and playing around with POINT, GEOMETRY, LINE based queries.
  *Playing around with Geography co-ordinate queries.

Session 6: This Session is focused on:
  *Extended use of the WHERE clause.
  *Optimization of queries via correlated subquerying.
  *Advanced concept of Grouping Numbers
  *Replacing NULLS with ISNULL.
  *A look into Recursive CTE (Common Table Expressions)
  *Introduction and Explanation of the OUTER APPLY and CROSS APPLY
  *Summarising data with SYNONYM.
  *Serializing variables with GUID (Global Unique Indentifiers)
  *Introduction and complex implementation of Sequences.

Session 6 XML This subSection focuses on:
  *Techniques and methods on how to use XML in SQL.
  *various implementations of XQuery (retrieving and modifying xml data via sql queries.)
  *Shredding XML data to make sql tables

Session 6 JSON
  *JSON data conversion.
  *JSON data modification.
  *JSON data retrieval.

Session 6 Temporal Tables:
  *Creating temporal tables.
  *Dropping temporal tables.
  *Modifying Temporal tables.
  *Viewing tomporal row history.

Session 7: This Session is focused on:
  *Differences between Implicit Transaction and Explicit Transactions.
  *Marking Transactions to log them.
  *Indentifying whether a Transaction has been committed or Rolled Back.
  *Locking and Isolating Transactions during execution.
  *Seeks and Scans with regards to CLUSTERED and NON CLUSTERED INDEXES
  *Optimized Selection with filtered indices.
  *Optimization techniques with SARG (Search Arguments)
  *Statistical Outputs
  *Dynamic vs parameterised querying and the danger of dynamic queries.
  *Introduction to Cursors and Alternatives to cursors.

Session 7 Hints: Running a transaction with no locks and having the ability to read uncomitted transactional data.
