USE [Comercial]
GO
/****** Object:  StoredProcedure [dbo].[SP_DELETE_CLIEN1_TEMP]    Script Date: 29/11/2015 19:40:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- AUTHOR:		<AUTHOR,,NAME>
-- CREATE DATE: <CREATE DATE,,>
-- DESCRIPTION:	<DESCRIPTION,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_DELETE_CLIEN1_TEMP]
	
AS
BEGIN
	DELETE FROM Zoclien1_TEMP
END

GO
