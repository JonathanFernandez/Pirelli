USE [Comercial]
GO
/****** Object:  StoredProcedure [dbo].[SP_VERIFICA_USUARIO_LEGAJO]    Script Date: 18/11/2015 2:17:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- AUTHOR:		<AUTHOR,,NAME>
-- CREATE DATE: <CREATE DATE,,>
-- DESCRIPTION:	<DESCRIPTION,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_VERIFICA_USUARIO_LEGAJO]
(
	@LEGAJO NVARCHAR(50)
)
AS
BEGIN
	SELECT * FROM MD_USUARIOS WHERE LEGAJO = @LEGAJO
END

GO
