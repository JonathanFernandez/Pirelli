USE [Comercial]
GO
/****** Object:  StoredProcedure [dbo].[SP_SELECT_MEDIDAS_ACTIVAS]    Script Date: 30/10/2015 12:05:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- AUTHOR:		<AUTHOR,,NAME>
-- CREATE DATE: <CREATE DATE,,>
-- DESCRIPTION:	<DESCRIPTION,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_SELECT_MEDIDAS_ACTIVAS]
AS
BEGIN
	SELECT * FROM VISTA_DESC_MEDIDAS
END

GO
