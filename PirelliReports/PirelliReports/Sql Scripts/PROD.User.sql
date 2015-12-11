USE [Comercial]
GO
/****** Object:  User [PROD]    Script Date: 10/12/2015 23:46:00 ******/
CREATE USER [PROD] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[PROD]
GO
ALTER ROLE [db_owner] ADD MEMBER [PROD]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [PROD]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [PROD]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [PROD]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [PROD]
GO
