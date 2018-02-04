-- returns first not null result
DECLARE @my1 int
DECLARE @my2 int
DECLARE @my3 int

SET @my2 = 3

-- the 5 is the default value if all values are null
SELECT COALESCE (@my1, @my2, @my3, 5)

SELECT ISNULL(NULL, 'default value if first is null')

