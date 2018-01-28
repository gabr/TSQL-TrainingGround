USE [master]
GO

RESTORE DATABASE Northwind
   FROM DISK='C:\Users\gabr\Documents\Programming\TSQL-TrainingGround\northwind\northwind.bak'
   WITH NORECOVERY,
      MOVE 'Northwind' TO 'C:\Users\gabr\Documents\Programming\TSQL-TrainingGround\northwind\db\northwind.mdf',
      MOVE 'Northwind_log' TO 'C:\Users\gabr\Documents\Programming\TSQL-TrainingGround\northwind\db\northwind.ldf'

RESTORE LOG Northwind
   FROM DISK='C:\Users\gabr\Documents\Programming\TSQL-TrainingGround\northwind\northwind.bak'
   WITH RECOVERY

GO
