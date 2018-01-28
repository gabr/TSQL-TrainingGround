-- sqlcmd -S .\SQLEXPRESS -i .\select_top.sql -Y 8
SELECT TOP 10 * FROM [Northwind].[dbo].[Orders]
GO
