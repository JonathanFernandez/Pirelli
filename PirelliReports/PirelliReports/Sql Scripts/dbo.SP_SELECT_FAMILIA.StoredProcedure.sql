USE [Comercial]
GO
/****** Object:  StoredProcedure [dbo].[SP_SELECT_FAMILIA]    Script Date: 01/11/2015 13:52:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- AUTHOR:		<AUTHOR,,NAME>
-- CREATE DATE: <CREATE DATE,,>
-- DESCRIPTION:	<DESCRIPTION,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_SELECT_FAMILIA] 
	
AS
BEGIN
	SELECT  TOP 100 PERCENT FAMIAGRCODI,FAMIAGRDESC FROM T000_FAMILIA_AGRUP ORDER BY FAMIAGRDESC ASC
END

GO
