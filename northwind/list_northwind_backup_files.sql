/*
-- To jest właściwy skrypt, ale jest wynik jest bardzo duży.
-- Poniższy kod służy tylko i wyłącznie przeniesieniu wyniku tej komendy do
-- zmiennej tabeli by wyświetlić potem tylko to na czym mi zależy.

RESTORE FILELISTONLY
    FROM DISK=N'C:\Users\gabr\Documents\Programming\TSQL-TrainingGround\northwind\northwind.bak'
GO
*/

DECLARE @Table TABLE (
    [LogicalName] varchar(128),
    [PhysicalName] varchar(128),
    [Type] varchar,
    [FileGroupName] varchar(128),
    [Size] varchar(128),
    [MaxSize] varchar(128),
    [FileId]varchar(128),
    [CreateLSN]varchar(128),
    [DropLSN]varchar(128),
    [UniqueId]varchar(128),
    [ReadOnlyLSN]varchar(128),
    [ReadWriteLSN]varchar(128),
    [BackupSizeInBytes]varchar(128),
    [SourceBlockSize]varchar(128),
    [FileGroupId]varchar(128),
    [LogGroupGUID]varchar(128),
    [DifferentialBaseLSN]varchar(128),
    [DifferentialBaseGUID]varchar(128),
    [IsReadOnly]varchar(128),
    [IsPresent]varchar(128),
    [TDEThumbprint]varchar(128),
    [SnapshotUrl]varchar(128)
)

DECLARE @Path varchar(1000)='C:\Users\gabr\Documents\Programming\TSQL-TrainingGround\northwind\northwind.bak'
DECLARE @LogicalNameData varchar(128), @LogicalNameLog varchar(128)

INSERT INTO @table
EXEC('
RESTORE FILELISTONLY
   FROM DISK=''' +@Path+ '''
')

SET @LogicalNameData=(SELECT LogicalName FROM @Table WHERE Type='D')
SET @LogicalNameLog=(SELECT LogicalName FROM @Table WHERE Type='L')

PRINT 'LogicalNameData: ' + @LogicalNameData
PRINT 'LogicalNameLog:  ' + @LogicalNameLog

