USE [Comercial]
GO
/****** Object:  User [datac]    Script Date: 10/12/2015 23:46:00 ******/
CREATE USER [datac] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[datac]
GO
ALTER ROLE [db_owner] ADD MEMBER [datac]
GO
