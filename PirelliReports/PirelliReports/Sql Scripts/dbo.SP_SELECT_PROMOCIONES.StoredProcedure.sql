USE [Comercial]
GO
/****** Object:  StoredProcedure [dbo].[SP_SELECT_PROMOCIONES]    Script Date: 10/12/2015 0:05:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- AUTHOR:		<AUTHOR,,NAME>
-- CREATE DATE: <CREATE DATE,,>
-- DESCRIPTION:	<DESCRIPTION,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_SELECT_PROMOCIONES] 
	
AS
BEGIN
	SELECT  * FROM DBO.ZOTIPOPROMO
	ORDER BY FECHASTA DESC
END

GO
