USE [Comercial]
GO
/****** Object:  StoredProcedure [dbo].[SP_INSERTAR_GRUPOS]    Script Date: 22/11/2015 15:13:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- AUTHOR:		<AUTHOR,,NAME>
-- CREATE DATE: <CREATE DATE,,>
-- DESCRIPTION:	<DESCRIPTION,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_INSERTAR_GRUPOS]
(
	@NOMBRE NVARCHAR(50)
)
AS
BEGIN
	INSERT INTO MD_GRUPOS(GRUPO_DESC)
	VALUES(@NOMBRE)
END

GO
