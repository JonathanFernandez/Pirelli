USE [Comercial]
GO
/****** Object:  StoredProcedure [dbo].[SP_SELECT_PAIS]    Script Date: 10/12/2015 0:05:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- AUTHOR:		<AUTHOR,,NAME>
-- CREATE DATE: <CREATE DATE,,>
-- DESCRIPTION:	<DESCRIPTION,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_SELECT_PAIS]
	
AS
BEGIN
	  SELECT DISTINCT PAIS AS [CODPAIS], PAIS FROM ZOPRODU1
END

GO
