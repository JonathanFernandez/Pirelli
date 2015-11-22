USE [Comercial]
GO
/****** Object:  StoredProcedure [dbo].[SP_INSERTAR_GRUPOS_USUARIO]    Script Date: 22/11/2015 15:13:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- AUTHOR:		<AUTHOR,,NAME>
-- CREATE DATE: <CREATE DATE,,>
-- DESCRIPTION:	<DESCRIPTION,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_INSERTAR_GRUPOS_USUARIO]
(
	@grupo_id int,
	@USU_ID NVARCHAR(50)
	
)
AS
BEGIN
	INSERT INTO [dbo].[GRUPOS_USUARIOS]
           ([GRUPO_ID]
           ,[USU_ID])
     VALUES
           (
		    @GRUPO_ID,
            @USU_ID)
END

GO
