USE [Comercial]
GO
/****** Object:  StoredProcedure [dbo].[SP_VERIFICA_GRUPO_EXISTENTE]    Script Date: 10/12/2015 0:05:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- AUTHOR:		<AUTHOR,,NAME>
-- CREATE DATE: <CREATE DATE,,>
-- DESCRIPTION:	<DESCRIPTION,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_VERIFICA_GRUPO_EXISTENTE]
(
	@NOMBRE NVARCHAR(50)
)
AS
BEGIN
	SELECT * FROM MD_GRUPOS WHERE GRUPO_DESC = @NOMBRE
END

GO
