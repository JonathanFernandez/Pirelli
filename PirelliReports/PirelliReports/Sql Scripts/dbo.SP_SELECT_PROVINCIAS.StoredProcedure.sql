USE [Comercial]
GO
/****** Object:  StoredProcedure [dbo].[SP_SELECT_PROVINCIAS]    Script Date: 18/11/2015 2:17:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- AUTHOR:		<AUTHOR,,NAME>
-- CREATE DATE: <CREATE DATE,,>
-- DESCRIPTION:	<DESCRIPTION,,>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_SELECT_PROVINCIAS]
	
AS
BEGIN
	SELECT DISTINCT  TOP 100 PERCENT ZOCOD,ZODESC FROM ZOPROVINCIA ORDER BY ZODESC
END

GO
