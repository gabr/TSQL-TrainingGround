sqlcmd -S .\SQLEXPRESS -Q "RESTORE FILELISTONLY FROM DISK=N'C:\Users\gabr\Documents\Programming\TSQL-TrainingGround\northwind\northwind.bak'" -o o.csv -s ";"

ipcsv o.csv -delimiter ";" | select -skip 1 | select -skiplast 1
