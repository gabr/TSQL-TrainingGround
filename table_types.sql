USE [Northwind]
GO

-- simillar to C structs

CREATE TYPE [MyComplexType] AS TABLE
(
    [Id] INT PRIMARY KEY,
    [FirstName] VARCHAR(10),
    [LastName]  VARCHAR(10),
    [CreateDate] DATETIME default GETDATE()
)


CREATE TYPE [MyComplexType2] AS TABLE
(
    [FirstName] VARCHAR(10),
    [LastName]  VARCHAR(10),
    [CreateDate] DATETIME default GETDATE()
    PRIMARY KEY ([FirstName], [LastName])
)

-- ussage example: https://docs.microsoft.com/en-us/sql/relational-databases/tables/use-table-valued-parameters-database-engine
