USE [Comercial]
GO
/****** Object:  StoredProcedure [dbo].[SP_SELECT_TIPO_PROMO]    Script Date: 13/11/2015 2:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- AUTHOR:		<AUTHOR,,NAME>
-- CREATE DATE: <CREATE DATE,,>
-- DESCRIPTION:	<DESCRIPTION,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_SELECT_TIPO_PROMO]
	
AS
BEGIN
	SELECT * FROM   ZOTIPOPROMO
END

GO
