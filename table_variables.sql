USE [Northwind]
GO

/*
    NOTE: Microsoft only recommends the use of table variables if the
          number of rows of data in the table variable are less than 100.
          If you will be working with larger amounts of data,
          use a temporary table, or temp table, instead.

    NOTE: There can't be any GO statements. The table variable exists
          only within current batch.
*/

PRINT 'Creating table'
DECLARE @TableVariable TABLE
(
    ID int,
    Name NVARCHAR(128)
)

PRINT 'Inserting data'
INSERT INTO @TableVariable
VALUES
(1, 'AAA'),
(2, 'BBB'),
(3, 'CCC')

PRINT 'Selecting all'
SELECT * FROM @TableVariable

PRINT 'Changing first rist row'
UPDATE @TableVariable
    SET [Name] = 'Changed'
    WHERE [ID] = 1

PRINT 'Selecting all'
SELECT * FROM @TableVariable

PRINT 'Selecting row with ID = 2'
SELECT [Name]
    FROM @TableVariable
    WHERE [ID] = 2

PRINT 'Deleting rows with ID > 1'
DELETE FROM @TableVariable
    WHERE [ID] > 1

PRINT 'Selecting all'
SELECT * FROM @TableVariable

PRINT 'End'

