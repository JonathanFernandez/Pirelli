USE [Comercial]
GO
/****** Object:  StoredProcedure [dbo].[SP_MODIFICAR_USUARIO]    Script Date: 10/12/2015 0:05:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- AUTHOR:		<AUTHOR,,NAME>
-- CREATE DATE: <CREATE DATE,,>
-- DESCRIPTION:	<DESCRIPTION,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_MODIFICAR_USUARIO]
(
	@USU_ORIGINAL NVARCHAR(50),
	@USU_ID NVARCHAR(50),
	@USU_DESC NVARCHAR(50),
	@MAIL NVARCHAR(50),
	@PASS NVARCHAR(20),
	@LEGAJO NVARCHAR(50),
	@ACTIVO BIT
)
AS
BEGIN
	UPDATE 
		[DBO].[MD_USUARIOS]
    SET  
           [USU_ID] = @USU_ID,
		   [USU_DESC] = @USU_DESC,
           [MAIL] = @MAIL,
           [PASS] = @PASS,
           [LEGAJO] = @LEGAJO,
           [ACTIVO] = @ACTIVO
	WHERE [USU_ID] = @USU_ORIGINAL
     
END

GO
