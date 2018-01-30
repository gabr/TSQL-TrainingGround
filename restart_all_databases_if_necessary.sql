USE [master]
GO

DECLARE @DatabaseName VARCHAR(128)
DECLARE @State varchar(32)

DECLARE DatabaseCursor CURSOR
  LOCAL STATIC READ_ONLY FORWARD_ONLY
    FOR
        SELECT DISTINCT [name]
        FROM [sys].[databases]

OPEN DatabaseCursor
FETCH NEXT FROM DatabaseCursor INTO @DatabaseName
WHILE @@FETCH_STATUS = 0
BEGIN
    SET @State = (
        SELECT [state_desc]
            FROM [sys].[databases]
            WHERE [name] = @DatabaseName
    )
    PRINT 'Database ' + @DatabaseName + ' state: ' + @State

    IF (@State <> 'ONLINE')
    BEGIN

        PRINT 'Restarting database, setting offline...'

        EXEC('ALTER DATABASE ' + @DatabaseName + ' SET OFFLINE WITH ROLLBACK IMMEDIATE')
        EXEC('ALTER DATABASE ' + @DatabaseName + ' SET ONLINE')

        SET @State = (
            SELECT [state_desc]
                FROM [sys].[databases]
                WHERE [name] = @DatabaseName
        )
        PRINT 'Database ' + @DatabaseName + ' state: ' + @State
    END

    FETCH NEXT FROM DatabaseCursor INTO @DatabaseName
END

CLOSE DatabaseCursor
DEALLOCATE DatabaseCursor

