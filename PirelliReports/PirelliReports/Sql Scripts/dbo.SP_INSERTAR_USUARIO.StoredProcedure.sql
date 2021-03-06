USE [Comercial]
GO
/****** Object:  StoredProcedure [dbo].[SP_INSERTAR_USUARIO]    Script Date: 10/12/2015 0:05:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- AUTHOR:		<AUTHOR,,NAME>
-- CREATE DATE: <CREATE DATE,,>
-- DESCRIPTION:	<DESCRIPTION,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_INSERTAR_USUARIO]
(
	@USU_ID NVARCHAR(50),
	@USU_DESC NVARCHAR(50),
	@MAIL NVARCHAR(50),
	@PASS NVARCHAR(20),
	@LEGAJO NVARCHAR(50),
	@ACTIVO BIT
)
AS
BEGIN
	INSERT INTO [DBO].[MD_USUARIOS]
           ([USU_ID]
           ,[USU_DESC]
           ,[MAIL]
           ,[PASS]
           ,[LEGAJO]
           ,[ACTIVO])
     VALUES
           (@USU_ID,
            @USU_DESC,
            @MAIL,
            @PASS,
            @LEGAJO,
            @ACTIVO
			)
END

GO
