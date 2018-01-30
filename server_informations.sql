USE [master]
GO

SELECT @@VERSION
SELECT @@SERVERNAME
SELECT @@SERVICENAME

SELECT serverproperty('ComputerNamePhysicalNetBIOS');

SELECT * FROM fn_virtualservernodes();

