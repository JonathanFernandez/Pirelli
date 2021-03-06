USE [Comercial]
GO
/****** Object:  StoredProcedure [dbo].[SP_INSERTAR_ZOPROMO]    Script Date: 10/12/2015 0:05:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- AUTHOR:		<AUTHOR,,NAME>
-- CREATE DATE: <CREATE DATE,,>
-- DESCRIPTION:	<DESCRIPTION,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_INSERTAR_ZOPROMO]
(
	@DESCTIPOPROMO NVARCHAR(30),
	@FECDESDE DATETIME,
	@FECHASTA DATETIME,
	@DESCU1 FLOAT = 0,
	@DESCU2 FLOAT= 0,
	@DESCU3 FLOAT = 0,
	@DESCU4 FLOAT = 0,
	@DESCU5 FLOAT = 0,
	@DESCU6 FLOAT = 0,
	@DESCU7 FLOAT = 0,
	@CUOTA1 INT = 0,
	@CUOTA2 INT = 0,
	@CUOTA3 INT = 0,
	@CUOTA4 INT = 0,
	@CUOTA5 INT = 0,
	@CUOTA6 INT = 0,
	@CUOTA7 INT= 0,
	@FLGBAJALOGICA CHAR(1) = '0'
)
AS
BEGIN
	INSERT INTO [DBO].[ZOTIPOPROMO]
           ([DESCTIPOPROMO]
           ,[FECDESDE]
           ,[FECHASTA]
           ,[DESCU1]
           ,[DESCU2]
           ,[DESCU3]
           ,[DESCU4]
           ,[DESCU5]
           ,[DESCU6]
           ,[DESCU7]
           ,[CUOTA1]
           ,[CUOTA2]
           ,[CUOTA3]
           ,[CUOTA4]
           ,[CUOTA5]
           ,[CUOTA6]
           ,[CUOTA7]
           ,[FLGBAJALOGICA])
     VALUES
           (@DESCTIPOPROMO
           ,@FECDESDE
           ,@FECHASTA
           ,@DESCU1
           ,@DESCU2
           ,@DESCU3
           ,@DESCU4
           ,@DESCU5
           ,@DESCU6
           ,@DESCU7
           ,@CUOTA1
           ,@CUOTA2
           ,@CUOTA3
           ,@CUOTA4
           ,@CUOTA5
           ,@CUOTA6
           ,@CUOTA7
           ,@FLGBAJALOGICA)
END

GO
