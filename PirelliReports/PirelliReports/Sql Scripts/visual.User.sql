USE [Comercial]
GO
/****** Object:  User [visual]    Script Date: 10/12/2015 23:46:00 ******/
CREATE USER [visual] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[visual]
GO
ALTER ROLE [db_denydatareader] ADD MEMBER [visual]
GO
