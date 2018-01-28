SELECT TOP 10
    o.OrderId, o.OrderDate,
    s.CompanyName
FROM [Northwind].[dbo].[Orders] as o
INNER JOIN [Northwind].[dbo].[Shippers] as s
    on o.ShipVia = s.ShipperID
GO
