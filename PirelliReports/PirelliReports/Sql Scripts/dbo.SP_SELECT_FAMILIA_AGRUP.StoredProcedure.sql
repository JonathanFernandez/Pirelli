USE [Comercial]
GO
/****** Object:  StoredProcedure [dbo].[SP_SELECT_FAMILIA_AGRUP]    Script Date: 22/11/2015 15:13:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- AUTHOR:		<AUTHOR,,NAME>
-- CREATE DATE: <CREATE DATE,,>
-- DESCRIPTION:	<DESCRIPTION,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_SELECT_FAMILIA_AGRUP]
AS
BEGIN
	SELECT  TOP 100 PERCENT FAMIAGRCODI,FAMIAGRDESC FROM T000_FAMILIA_AGRUP ORDER BY FAMIAGRDESC ASC
END

GO
