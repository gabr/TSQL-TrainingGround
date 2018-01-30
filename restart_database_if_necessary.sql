USE [master]
GO

DECLARE @State varchar(32) = (
    SELECT [state_desc]
        FROM [sys].[databases]
        WHERE [name] = 'Northwind'
)
PRINT 'Database state: ' + @State

IF (@State = 'OFFLINE')
BEGIN

    PRINT 'Restarting database, setting offline...'
    ALTER DATABASE [Northwind] SET OFFLINE
        WITH ROLLBACK IMMEDIATE

    PRINT 'Databse offline'
    PRINT 'Starting up...'
    ALTER DATABASE [Northwind] SET ONLINE

    SET @State = (
        SELECT [state_desc]
            FROM [sys].[databases]
            WHERE [name] = 'Northwind'
    )
    PRINT 'Database state: ' + @State
END

