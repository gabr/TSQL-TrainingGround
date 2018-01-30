USE [Northwind]
GO

CREATE TABLE test_transaction (col1 varchar(10))
GO

INSERT INTO dbo.test_transaction (col1) VALUES ('aaa')
GO

SELECT * FROM dbo.test_transaction
GO

BEGIN TRANSACTION

UPDATE dbo.test_transaction
    SET col1 = 'bbb'
    OUTPUT INSERTED.*
    WHERE col1 = 'aaa'

ROLLBACK TRANSACTION
GO

SELECT * FROM dbo.test_transaction
DROP TABLE dbo.test_transaction
GO
