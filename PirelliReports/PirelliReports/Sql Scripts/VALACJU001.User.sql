USE [Comercial]
GO
/****** Object:  User [VALACJU001]    Script Date: 10/12/2015 23:46:00 ******/
CREATE USER [VALACJU001] WITH DEFAULT_SCHEMA=[VALACJU001]
GO
ALTER ROLE [db_owner] ADD MEMBER [VALACJU001]
GO
