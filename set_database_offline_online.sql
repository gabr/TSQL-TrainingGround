USE [master]
GO

DECLARE @State varchar(32) = (
    SELECT [state_desc]
        FROM [sys].[databases]
        WHERE [name] = 'Northwind'
)
PRINT 'Database state: ' + @State

PRINT 'Shutting down...'

ALTER DATABASE [Northwind] SET OFFLINE
    WITH ROLLBACK IMMEDIATE
GO

DECLARE @State varchar(32) = (
    SELECT [state_desc]
        FROM [sys].[databases]
        WHERE [name] = 'Northwind'
)
PRINT 'Database state: ' + @State

PRINT 'Starting up...'

ALTER DATABASE [Northwind] SET ONLINE
GO

DECLARE @State varchar(32) = (
    SELECT [state_desc]
        FROM [sys].[databases]
        WHERE [name] = 'Northwind'
)
PRINT 'Database state: ' + @State

